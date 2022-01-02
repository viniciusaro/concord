import 'package:concord_core/concord_core.dart';

abstract class LoginRepository {
  Future<void> sendOtp(String alias);
  Future<User> signIn(String otp);
  Future<User> signOut();
  Future<User> session();
}

class LoginRepositoryError extends BaseError {
  @override
  final Object? error;
  LoginRepositoryError(this.error);
}
