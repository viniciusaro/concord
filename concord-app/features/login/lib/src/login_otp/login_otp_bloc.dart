import 'package:concord_arch/concord_arch.dart';
import 'package:concord_foundation/types.dart';
import 'package:login_data/login_data.dart';

import 'login_otp_event.dart';
import 'login_otp_state.dart';

class LoginOtpBloc extends Bloc<LoginOtpEvent, LoginOtpState> {
  final LoginRepository _loginRepository;

  LoginOtpBloc(this._loginRepository) : super(LoginOtpState()) {
    on<LoginOtpEventSendOtp>((event, emit) {
      emit(state.copyWith(submitting: true));

      return emit.eachState(_loginRepository.signIn(event.otp).fold(
            onSuccess: (user) => state.copyWith(user: TransientValue(user)),
            onError: (e) => state.copyWith(error: e),
            always: () => state.copyWith(submitting: false),
          ));
    });
  }
}
