import 'package:concord_core/concord_core.dart';

abstract class LoginRepository {
  Future<AuthenticatedUser> signIn(String otp);
}

class LoginRepositoryError extends BaseError {
  @override
  final Object? error;
  LoginRepositoryError(this.error);
}
