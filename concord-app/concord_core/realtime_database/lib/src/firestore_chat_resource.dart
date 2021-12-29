import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord_foundation/concord_foundation.dart';

import 'firestore_collections.dart';
import 'realtime_resource.dart';

export 'realtime_resource.dart';

class FirestoreChatResource implements ChatRealtimeResource {
  final FirebaseFirestore _firestore;

  FirestoreChatResource(this._firestore);

  @override
  Stream<List<T>> documents<T>(
    String id,
    Deserializer<T> deserializer,
  ) async* {
    final chats = _firestore.collection(Collections.chat);
    final chatDocRef = chats.doc(id);
    final chatSnapshot = await chatDocRef.get();
    final messages = chatDocRef.collection(Collections.messages);

    yield* messages
        .orderBy(Fields.createdAt, descending: true)
        .snapshots()
        .map((query) => query.docs
            .map((message) => {
                  ...chatSnapshot.data() ?? {},
                  ...message.data(),
                })
            .map(deserializer)
            .toList());
  }

  @override
  Future<void> write<T>(String id, T document, Serializer<T> serializer) async {
    final data = serializer.call(document);

    final chats = _firestore.collection(Collections.chat);
    final chatDocRef = chats.doc(id);
    final chatSnapshot = await chatDocRef.get();
    final messages = chatDocRef.collection(Collections.messages);

    final userId = chatSnapshot.data()?["user_id"];

    await messages.add(
      {
        ...data,
        "sender_id": userId,
        "created_at": FieldValue.serverTimestamp(),
      },
    );
  }
}
