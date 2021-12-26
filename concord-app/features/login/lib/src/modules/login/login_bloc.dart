import 'package:concord_arch/concord_arch.dart';
import 'package:login/data.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // ignore: unused_field
  final LoginRepository _loginRepository;

  LoginBloc(this._loginRepository) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) {
    return const Stream.empty();
  }
}
