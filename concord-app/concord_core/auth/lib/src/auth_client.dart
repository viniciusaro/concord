import 'package:concord_foundation/concord_foundation.dart';
import 'package:shared_models/shared_models.dart';

class InvalidCredentialsException extends BaseException {}

abstract class AuthClient {
  Future<AuthenticatedUser> signIn(String customToken);
}
