import 'package:chat/src/chat_list/chat_list_module.dart';
import 'package:chat_data/chat_data.dart';
import 'package:concord_foundation/di.dart';

class ChatRegister with Register {
  @override
  void register(Getter get, Setter set) {
    set(() => ChatListModule(get(), get()));
    set(() => ChatRepositoryImpl(get(), get()) as ChatRepository);
  }
}
