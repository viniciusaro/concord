import 'package:concord_core/concord_core.dart';
import 'package:concord_foundation/concord_foundation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool loading,
    @Default(false) bool submitting,
    @Default(null) Object? error,
    @Default(null) AuthenticatedUser? user,
  }) = _LoginState;
}
