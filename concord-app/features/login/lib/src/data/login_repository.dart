import 'package:shared_models/shared_models.dart';

abstract class LoginRepository {
  Future<AuthenticatedUser> signIn(String otp);
}
