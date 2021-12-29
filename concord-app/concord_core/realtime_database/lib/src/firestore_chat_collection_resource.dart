import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:realtime_database/src/firestore_collections.dart';
import 'package:serialization/serialization.dart';

import 'realtime_resource.dart';

export 'realtime_resource.dart';

class FirestoreChatCollectionLocation {
  final String chats;
  FirestoreChatCollectionLocation(this.chats);
}

class FirestoreChatCollectionResource
    implements ChatCollectionRealtimeResource {
  final FirebaseFirestore _firestore;

  FirestoreChatCollectionResource(this._firestore);

  @override
  Stream<List<T>> documents<T>(Deserializer<T> deserializer) {
    return _firestore.collection(Collections.chat).snapshots().map((query) =>
        query.docs.map((document) => deserializer(document.data())).toList());
  }
}
