import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord_foundation/di.dart';

import '../src/firestore_chat_list_resource.dart';
import '../src/firestore_chat_message_resource.dart';

class RealtimeDatabaseRegister with Register {
  @override
  void register(Getter get, Setter set, SingletonSetter setSingleton) {
    set(() {
      final instance = FirebaseFirestore.instance;
      instance.settings = const Settings(persistenceEnabled: true);
      return instance;
    });

    set(
      () => FirestoreChatMessageResource(
        get(),
        get(),
      ) as ChatMessageRealtimeResource,
    );

    set(
      () => FirestoreChatListResource(
        get(),
      ) as ChatListRealtimeResource,
    );
  }
}
