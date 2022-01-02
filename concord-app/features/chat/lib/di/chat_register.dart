import 'package:concord_foundation/di.dart';

import '../src/data/chat_repository_impl.dart';
import '../src/modules/chat/chat_module.dart';
import '../src/modules/chat_input/chat_input_module.dart';
import '../src/modules/chat_list/chat_list_module.dart';

class ChatRegister with Register {
  @override
  void register(Getter get, Setter set) {
    set(() => ChatModule(get(), get()));
    set(() => ChatInputModule(get()));
    set(() => ChatListModule(get(), get()));
    set(() => ChatRepositoryImpl(get(), get()) as ChatRepository);
  }
}
