import 'package:concord_foundation/concord_foundation.dart';

import '../src/data/login_repository_impl.dart';
import '../src/modules/login/login_module.dart';

class LoginRegister with Register {
  @override
  void register(Getter get, Setter set) {
    set(() => LoginModule(get()));
    set(() => LoginRepositoryImpl(get()) as LoginRepository);
  }
}
