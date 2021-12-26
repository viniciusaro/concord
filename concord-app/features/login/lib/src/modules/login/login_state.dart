import 'package:concord_foundation/concord_foundation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool loading,
    required Object error,
  }) = _LoginState;
}
