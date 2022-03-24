import 'package:concord_foundation/exceptions.dart';
import 'package:shared_models/shared_models.dart';

abstract class AuthClient {
  Future<void> sendOtp(String alias);
  Future<User> signIn(String otp);
  Future<User> signOut();
  Future<User> session();
}

class AuthException extends BaseException {
  AuthException(Object error) : super(error);
}

class AuthProviderException extends AuthException {
  AuthProviderException(Object error) : super(error);
}

class AuthOtpException extends AuthException {
  AuthOtpException(Object error) : super(error);
}

class AuthUnknownException extends AuthException {
  AuthUnknownException(Object error) : super(error);
}
