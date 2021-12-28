import 'package:concord_core/concord_core.dart';
import 'package:login/data.dart';

import 'login_provider.dart';

class LoginModule {
  final LoginRepository _loginRepository;

  LoginModule(
    this._loginRepository,
  );

  LoginProvider build({required Function(User) onLoggedIn}) {
    return LoginProvider(
      onLoggedIn: onLoggedIn,
      loginRepository: _loginRepository,
    );
  }
}
