import 'package:concord_core/shared_models.dart';
import 'package:concord_foundation/di.dart';
import 'package:concord_ui/global.dart';

import 'modules/root/root_module.dart';

class MainRegister with Register {
  final User user;

  MainRegister(this.user);

  @override
  void register(Getter get, Setter set) {
    set(() => RootModule(get(), get(), get()));
    set(() => rootWidget(get));
  }

  Widget rootWidget(Getter get) {
    return get<RootModule>().build(user: user);
  }
}
