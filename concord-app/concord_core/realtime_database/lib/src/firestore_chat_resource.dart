import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord_foundation/serialization.dart';

import 'firestore_collections.dart';
import 'realtime_resource.dart';

export 'realtime_resource.dart';

class FirestoreChatResource implements ChatRealtimeResource {
  final FirebaseFirestore _firestore;
  final AuthClient _authClient;

  FirestoreChatResource(this._firestore, this._authClient);

  @override
  Stream<List<T>> documents<T>(
    String id,
    Deserializer<T> deserializer,
  ) async* {
    final chats = _firestore.collection(Collections.chats);
    final chatDocRef = chats.doc(id);
    final messages = chatDocRef.collection(Collections.messages);
    final userId = await _authClient.userIdOrNull();

    yield* messages
        .orderBy(Fields.createdAt, descending: true)
        .snapshots()
        .map((query) => query.docs
            .map((message) => {
                  ...{"user_id": userId},
                  ...message.data(),
                })
            .map(deserializer)
            .toList());
  }

  @override
  Future<void> write<T>(String id, T document, Serializer<T> serializer) async {
    final data = serializer.call(document);

    final chats = _firestore.collection(Collections.chats);
    final chatDocRef = chats.doc(id);
    final messages = chatDocRef.collection(Collections.messages);
    final userId = await _authClient.userIdOrNull();

    await messages.add(
      {
        ...data,
        "sender_id": userId,
        "created_at": FieldValue.serverTimestamp(),
      },
    );
  }
}
