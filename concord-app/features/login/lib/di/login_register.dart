import 'package:concord_foundation/di.dart';
import 'package:login_data/login_data.dart';

// import '../src/login/login_module.dart';

class LoginRegister with Register {
  @override
  void register(Getter get, Setter set) {
    // set(() => LoginModule(get()));
    set(() => LoginRepositoryImpl(get()) as LoginRepository);
  }
}
