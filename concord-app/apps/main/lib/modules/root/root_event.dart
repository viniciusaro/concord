import 'package:concord_core/shared_models.dart';

abstract class RootEvent {}

class RootEventStart implements RootEvent {}

class RootEventLoggedIn implements RootEvent {
  final User user;
  RootEventLoggedIn(this.user);
}

class RootEventLogout implements RootEvent {}
