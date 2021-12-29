import 'package:concord_core/concord_core.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool loading,
    @Default(false) bool submitting,
    @Default(null) Object? error,
    @Default(null) User? user,
  }) = _LoginState;
}
