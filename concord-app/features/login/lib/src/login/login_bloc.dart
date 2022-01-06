import 'package:concord_arch/concord_arch.dart';
import 'package:concord_foundation/types.dart';
import 'package:login_data/login_data.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;

  LoginBloc(this._loginRepository) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginEventSignIn) {
      yield state.copyWith(submitting: true);

      yield* _loginRepository
          .sendOtp(event.alias)
          .fold(
            onSuccess: (_) => state.copyWith(success: TransientValue(true)),
            onError: (e) => state.copyWith(error: e),
            always: () => state.copyWith(submitting: false),
          )
          .debug();
    }
  }
}
