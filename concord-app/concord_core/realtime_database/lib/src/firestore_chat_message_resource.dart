import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord_foundation/serialization.dart';
import 'package:concord_foundation/types.dart';

import 'firestore_collections.dart';
import 'realtime_resource.dart';

export 'realtime_resource.dart';

class FirestoreChatMessageResource implements ChatMessageRealtimeResource {
  final FirebaseFirestore _firestore;
  final AuthClient _authClient;

  FirestoreChatMessageResource(this._firestore, this._authClient);

  @override
  Stream<List<T>> documents<T>(
    String id,
    Deserializer<T> deserializer,
  ) async* {
    final chats = _firestore.collection(Collections.chats);
    final chatDocRef = chats.doc(id);
    final messages = chatDocRef.collection(Collections.messages);
    final user = await _authClient.session();

    yield* messages
        .orderBy(Fields.createdAt, descending: true)
        .snapshots()
        .map((query) => query.docs)
        .mapEach((doc) => {
              ...{"user_id": user.id},
              ...doc.data(),
            })
        .mapEach(deserializer);
  }

  @override
  Future<void> write<T>(String id, T document, Serializer<T> serializer) async {
    final data = serializer.call(document);

    final chats = _firestore.collection(Collections.chats);
    final chatDocRef = chats.doc(id);
    final messages = chatDocRef.collection(Collections.messages);
    final user = await _authClient.session();

    final payload = {
      ...data,
      "sender_id": user.id,
      "created_at": FieldValue.serverTimestamp(),
    };

    await messages.add(payload);
  }
}
