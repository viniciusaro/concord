import 'package:concord_arch/concord_arch.dart';
import 'package:concord_foundation/types.dart';
import 'package:login/data.dart';

import 'login_otp_event.dart';
import 'login_otp_state.dart';

class LoginOtpBloc extends Bloc<LoginOtpEvent, LoginOtpState> {
  final LoginRepository _loginRepository;

  LoginOtpBloc(this._loginRepository) : super(LoginOtpState());

  @override
  Stream<LoginOtpState> mapEventToState(LoginOtpEvent event) async* {
    if (event is LoginOtpEventSendOtp) {
      yield state.copyWith(submitting: true);
      try {
        final user = await _loginRepository.signIn(event.otp);
        yield state.copyWith(user: TransientValue(user));
      } catch (e) {
        yield state.copyWith(error: e);
      } finally {
        yield state.copyWith(submitting: false);
      }
    }
  }
}
