import 'package:concord_arch/concord_arch.dart';
import 'package:concord_core/shared_models.dart';
import 'package:concord_foundation/types.dart';
import 'package:login_data/login_data.dart';

import 'login_root_event.dart';
import 'login_root_state.dart';

class LoginRootBloc extends Bloc<LoginRootEvent, LoginRootState> {
  final LoginRepository _loginRepository;

  LoginRootBloc(User user, this._loginRepository)
      : super(LoginRootState(user: user)) {
    on<LoginRootEventLoggedIn>((event, emit) {
      emit(state.copyWith(user: event.user));
    });

    on<LoginRootEventLogout>((event, emit) {
      return emit.eachState(_loginRepository.signOut().eval(
            onSuccess: (user) => state.copyWith(user: user),
            onError: ((e) => state.copyWith(error: e)),
          ));
    });
  }
}
