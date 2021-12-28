import 'package:concord_foundation/concord_foundation.dart';

part 'user.freezed.dart';

mixin User {}

@freezed
class AuthenticatedUser with User, _$AuthenticatedUser {
  factory AuthenticatedUser(String id) = _AuthenticatedUser;
}

@freezed
class UnauthenticatedUser with User, _$UnauthenticatedUser {
  factory UnauthenticatedUser() = _UnauthenticatedUser;
}
