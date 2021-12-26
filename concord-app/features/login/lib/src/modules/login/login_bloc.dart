import 'package:concord_arch/concord_arch.dart';
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
        final user = await _loginRepository.signIn("vini");
        yield state.copyWith(user: user, submitting: false);
      } catch (e) {
        yield state.copyWith(error: e);
      }
    }
  }
}
