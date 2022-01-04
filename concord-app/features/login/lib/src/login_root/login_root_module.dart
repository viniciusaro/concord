import 'package:concord_core/shared_models.dart';
import 'package:login_data/login_data.dart';
import 'package:login_team_library/login_team_library.dart';

import '../login/login_module.dart';
import 'login_root_provider.dart';

typedef LoggedInModuleBuilder = Widget Function(User);

class LoginRootModule {
  final LoginRepository _loginRepository;
  final LoginModule _loginModule;

  LoginRootModule(
    this._loginRepository,
    this._loginModule,
  );

  LoginRootProvider build({
    required User user,
    required LoggedInModuleBuilder loggedInModuleBuilder,
  }) {
    return LoginRootProvider(
      user: user,
      loggedInModuleBuilder: loggedInModuleBuilder,
      loginModule: _loginModule,
      loginRepository: _loginRepository,
    );
  }
}
