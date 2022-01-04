import 'package:concord_foundation/di.dart';
import 'package:login_data/login_data.dart';

import '../src/login/login_module.dart';
import '../src/login_otp/login_otp_module.dart';
import '../src/login_root/login_root_module.dart';

class LoginRegister with Register {
  @override
  void register(Getter get, Setter set) {
    set(() => LoginModule(get(), get()));
    set(() => LoginOtpModule(get()));
    set(() => LoginRootModule(get(), get()));
    set(() => LoginRepositoryImpl(get()) as LoginRepository);
  }
}
