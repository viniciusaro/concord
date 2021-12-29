import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord_foundation/concord_foundation.dart';

import '../src/firestore_chat_collection_resource.dart';
import '../src/firestore_chat_resource.dart';

class RealtimeDatabaseRegister with Register {
  @override
  void register(Getter get, Setter set) {
    set(() {
      final instance = FirebaseFirestore.instance;
      instance.settings = const Settings(persistenceEnabled: true);
      return instance;
    });
    set(() => FirestoreChatResource(get()) as ChatRealtimeResource);
    set(() => FirestoreChatCollectionResource(get())
        as ChatCollectionRealtimeResource);
  }
}
