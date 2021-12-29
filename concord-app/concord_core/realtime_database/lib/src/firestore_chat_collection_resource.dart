import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serialization/serialization.dart';

import 'firestore_collections.dart';
import 'realtime_resource.dart';

export 'realtime_resource.dart';

class FirestoreChatCollectionResource
    implements ChatCollectionRealtimeResource {
  final FirebaseFirestore _firestore;

  FirestoreChatCollectionResource(this._firestore);

  @override
  Stream<List<T>> documents<T>(Deserializer<T> deserializer) {
    return _firestore
        .collection(Collections.chats)
        .snapshots()
        .map((query) => query.docs
            .map((document) => {
                  ...{"id": document.id},
                  ...document.data(),
                })
            .map(deserializer)
            .toList());
  }
}
