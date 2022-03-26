import 'package:chat_data/chat_data.dart';
import 'package:concord_foundation/di.dart';

import '../src/chat_alice_arch/chat/chat_module.dart';
import '../src/chat_alice_arch/chat_input/chat_input_module.dart';
import '../src/chat_alice_arch/chat_list/chat_list_module.dart';

class ChatRegister with Register {
  @override
  void register(Getter get, Setter set, SingletonSetter setSingleton) {
    set(() => ChatListModule(get(), get()));
    set(() => ChatModule(get(), get()));
    set(() => ChatInputModule(get()));
    set(() => ChatRepositoryImpl(get(), get()) as ChatRepository);
  }
}
