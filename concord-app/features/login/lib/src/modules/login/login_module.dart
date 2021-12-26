import 'package:login/data.dart';

import 'login_provider.dart';

class LoginModule {
  final LoginRepository _loginRepository;

  LoginModule(
    this._loginRepository,
  );

  LoginProvider build() {
    return LoginProvider(
      loginRepository: _loginRepository,
    );
  }
}
