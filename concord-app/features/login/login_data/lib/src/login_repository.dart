import 'package:concord_core/shared_models.dart';

abstract class LoginRepository {
  Future<void> sendOtp(String alias);
  Future<User> signIn(String otp);
  Future<User> signOut();
  Future<User> session();
}
