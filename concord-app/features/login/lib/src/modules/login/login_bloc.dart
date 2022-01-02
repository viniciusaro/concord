import 'package:concord_arch/concord_arch.dart';
import 'package:concord_foundation/types.dart';
import 'package:login/data.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;

  LoginBloc(this._loginRepository) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginEventSignIn) {
      yield state.copyWith(submitting: true);
      try {
        await _loginRepository.sendOtp(event.alias);
        yield state.copyWith(success: TransientValue(true));
      } catch (e) {
        yield state.copyWith(error: e);
      } finally {
        yield state.copyWith(submitting: false);
      }
    }
  }
}
