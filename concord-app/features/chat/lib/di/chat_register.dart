import 'package:concord_foundation/concord_foundation.dart';

import '../src/data/chat_repository_impl.dart';
import '../src/modules/chat/chat_module.dart';

class ChatRegister with Register {
  @override
  void register(Getter get, Setter set) {
    set(() => ChatModule(get()));
    set(() => ChatRepositoryImpl(get(), get()) as ChatRepository);
  }
}
