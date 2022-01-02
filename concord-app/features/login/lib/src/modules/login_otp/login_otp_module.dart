import 'package:concord_core/shared_models.dart';
import 'package:login/data.dart';

import 'login_otp_provider.dart';

class LoginOtpModule {
  final LoginRepository _loginRepository;

  LoginOtpModule(
    this._loginRepository,
  );

  LoginOtpProvider build({required Function(User) onLoggedIn}) {
    return LoginOtpProvider(
      onLoggedIn: onLoggedIn,
      loginRepository: _loginRepository,
    );
  }
}
