abstract class LoginEvent {}

class LoginEventSignIn implements LoginEvent {
  final String otp;
  LoginEventSignIn(this.otp);
}
