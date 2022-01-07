import 'package:chat/chat.dart';
import 'package:concord_core/shared_models.dart';
import 'package:concord_foundation/di.dart';
import 'package:concord_ui/global.dart';
import 'package:login/login.dart';

typedef ApplicationRoot = Widget;

class MainRegister with Register {
  final User user;

  MainRegister(this.user);

  @override
  void register(Getter get, Setter set, SingletonSetter setSingleton) {
    set(() => rootWidget(get));
  }

  ApplicationRoot rootWidget(Getter get) {
    return get<LoginRootModule>().build(
      user: user,
      loggedInModuleBuilder: (_) => get<ChatListModule>().build(),
    );
  }
}
