import 'package:concord_foundation/serialization.dart';
import 'package:concord_foundation/types.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool loading,
    @Default(false) bool submitting,
    @Default(null) Object? error,
    @Default(null) TransientValue<bool>? success,
  }) = _LoginState;
}
