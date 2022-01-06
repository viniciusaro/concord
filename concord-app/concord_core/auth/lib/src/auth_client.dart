import 'package:concord_foundation/exceptions.dart';
import 'package:shared_models/shared_models.dart';

abstract class AuthClient {
  Future<void> sendOtp(String alias);
  Future<User> signIn(String otp);
  Future<User> signOut();
  Future<User> session();
}

abstract class AuthError extends BaseError {
  @override
  final Object? error;

  AuthError(this.error);
}

class AuthProviderError extends AuthError {
  @override
  bool get reportIfUnhandled => true;

  AuthProviderError(Object error) : super(error);
}

class AuthOtpError extends AuthError {
  AuthOtpError(Object error) : super(error);
}

class AuthUnknownError extends AuthError {
  @override
  bool get reportIfUnhandled => true;
  
  AuthUnknownError(Object error) : super(error);
}
