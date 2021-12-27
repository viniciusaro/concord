import 'package:concord_foundation/concord_foundation.dart';
import 'package:shared_models/shared_models.dart';

abstract class AuthClient {
  Future<AuthenticatedUser> signIn(String customToken);
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
