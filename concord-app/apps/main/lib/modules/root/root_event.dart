import 'package:concord_core/concord_core.dart';

abstract class RootEvent {}

class RootEventStart implements RootEvent {}

class RootEventLoggedIn implements RootEvent {
  final User user;
  RootEventLoggedIn(this.user);
}

class RootEventLogout implements RootEvent {}
