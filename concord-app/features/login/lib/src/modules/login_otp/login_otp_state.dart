import 'package:concord_core/concord_core.dart';

part 'login_otp_state.freezed.dart';

@freezed
class LoginOtpState with _$LoginOtpState {
  LoginOtpState._();

  factory LoginOtpState({
    @Default(false) bool submitting,
    @Default(null) Object? error,
    @Default(null) TransientValue<User>? user,
  }) = _LoginOtpState;
}
