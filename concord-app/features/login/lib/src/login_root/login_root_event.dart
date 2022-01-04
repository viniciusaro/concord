import 'package:concord_core/shared_models.dart';

abstract class LoginRootEvent {}

class LoginRootEventStart implements LoginRootEvent {}

class LoginRootEventLoggedIn implements LoginRootEvent {
  final User user;
  LoginRootEventLoggedIn(this.user);
}

class LoginRootEventLogout implements LoginRootEvent {}
