import 'package:concord_foundation/di.dart';

import '../src/data/login_repository_impl.dart';
import '../src/modules/login/login_module.dart';
import '../src/modules/login_otp/login_otp_module.dart';

class LoginRegister with Register {
  @override
  void register(Getter get, Setter set) {
    set(() => LoginModule(get(), get()));
    set(() => LoginOtpModule(get()));
    set(() => LoginRepositoryImpl(get()) as LoginRepository);
  }
}
