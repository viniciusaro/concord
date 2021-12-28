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
  ) {
    final chats = _firestore.collection(chatCollection);
    final doc = chats.doc(id);
    final messages = doc.collection(messagesCollection);

    return messages.snapshots().debug(prefix: "#### ").map((query) => query.docs
        .map((document) {
          return document.data();
        })
        .map(deserializer)
        .toList());
  }
}
