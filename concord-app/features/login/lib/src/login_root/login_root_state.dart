import 'package:concord_core/shared_models.dart';
import 'package:concord_foundation/serialization.dart';

part 'login_root_state.freezed.dart';

@freezed
class LoginRootState with _$LoginRootState {
  LoginRootState._();

  factory LoginRootState({
    required User user,
    @Default(false) bool loading,
    @Default(null) Object? error,
  }) = _LoginRootState;

  bool get isLoggedIn => user is AuthenticatedUser;
}
