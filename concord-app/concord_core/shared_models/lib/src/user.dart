import 'package:concord_foundation/serialization.dart';

part 'user.freezed.dart';

mixin User {
  String? get id;
}

@freezed
class AuthenticatedUser with User, _$AuthenticatedUser {
  factory AuthenticatedUser(String id) = _AuthenticatedUser;
}

@freezed
class UnauthenticatedUser with User, _$UnauthenticatedUser {
  factory UnauthenticatedUser({String? id}) = _UnauthenticatedUser;
}
