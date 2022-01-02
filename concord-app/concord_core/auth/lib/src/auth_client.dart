import 'package:concord_foundation/exceptions.dart';
import 'package:shared_models/shared_models.dart';

abstract class AuthClient {
  Future<void> sendOtp(String alias);
  Future<User> signIn(String otp);
  Future<User> signOut();
  Future<User> session();
  Future<String?> userIdOrNull();
}

abstract class AuthError extends BaseError {
  @override
  bool get reportIfUnhandled => true;
}

class AuthProviderError extends AuthError {
  @override
  final Object? error;
  AuthProviderError(this.error);
}

class AuthUnknownError extends AuthError {
  @override
  final Object? error;
  AuthUnknownError(this.error);
}
