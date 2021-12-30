abstract class LoginEvent {}

class LoginEventSignIn implements LoginEvent {
  final String alias;
  LoginEventSignIn(this.alias);
}
