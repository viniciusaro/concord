import 'package:concord_arch/concord_arch.dart';
import 'package:concord_core/shared_models.dart';
import 'package:login_data/login_data.dart';

import 'login_root_event.dart';
import 'login_root_state.dart';

class LoginRootBloc extends Bloc<LoginRootEvent, LoginRootState> {
  final LoginRepository _loginRepository;

  LoginRootBloc(User user, this._loginRepository)
      : super(LoginRootState(user: user));

  @override
  Stream<LoginRootState> mapEventToState(LoginRootEvent event) async* {
    if (event is LoginRootEventStart) {
      try {
        final user = await _loginRepository.session();
        yield state.copyWith(user: user);
      } catch (e) {
        yield state.copyWith(error: e);
      }
    }
    if (event is LoginRootEventLoggedIn) {
      yield state.copyWith(user: event.user);
    }
    if (event is LoginRootEventLogout) {
      try {
        final user = await _loginRepository.signOut();
        yield state.copyWith(user: user);
      } catch (e) {
        yield state.copyWith(error: e);
      }
    }
  }
}
