import 'package:auth/auth.dart';
import 'package:shared_models/shared_models.dart';

import 'login_repository.dart';

export 'login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final AuthClient _authClient;

  LoginRepositoryImpl(this._authClient);

  @override
  Future<AuthenticatedUser> signIn(String otp) {
    return _authClient.signIn(otp);
  }
}
