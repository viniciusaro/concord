import 'package:concord_core/shared_models.dart';
import 'package:login/data.dart';

import '../login_otp/login_otp_module.dart';
import 'login_provider.dart';

class LoginModule {
  final LoginRepository _loginRepository;
  final LoginOtpModule _loginOtpModule;

  LoginModule(
    this._loginRepository,
    this._loginOtpModule,
  );

  LoginProvider build({required Function(User) onLoggedIn}) {
    return LoginProvider(
      onLoggedIn: onLoggedIn,
      loginRepository: _loginRepository,
      loginOtpModule: _loginOtpModule,
    );
  }
}
