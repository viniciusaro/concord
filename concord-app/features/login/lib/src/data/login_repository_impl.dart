import 'package:concord_core/auth.dart';
import 'package:concord_core/shared_models.dart';
import 'package:concord_foundation/types.dart';

import 'login_repository.dart';

export 'login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final AuthClient _authClient;

  LoginRepositoryImpl(this._authClient);

  @override
  Future<void> sendOtp(String alias) {
    return _authClient.sendOtp(alias).mapError((e) => LoginRepositoryError(e));
  }

  @override
  Future<User> signIn(String otp) {
    return _authClient.signIn(otp).mapError((e) => LoginRepositoryError(e));
  }

  @override
  Future<User> signOut() {
    return _authClient.signOut();
  }

  @override
  Future<User> session() {
    return _authClient.session();
  }
}
