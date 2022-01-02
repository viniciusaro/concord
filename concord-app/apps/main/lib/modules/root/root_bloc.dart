import 'package:concord_arch/concord_arch.dart';
import 'package:concord_core/concord_core.dart';
import 'package:login/data.dart';

import 'root_event.dart';
import 'root_state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  final LoginRepository _loginRepository;

  RootBloc(User user, this._loginRepository) : super(RootState(user: user));

  @override
  Stream<RootState> mapEventToState(RootEvent event) async* {
    if (event is RootEventStart) {
      try {
        final user = await _loginRepository.session();
        yield state.copyWith(user: user);
      } catch (e) {
        yield state.copyWith(error: e);
      }
    }
    if (event is RootEventLoggedIn) {
      yield state.copyWith(user: event.user);
    }
    if (event is RootEventLogout) {
      try {
        final user = await _loginRepository.signOut();
        yield state.copyWith(user: user);
      } catch (e) {
        yield state.copyWith(error: e);
      }
    }
  }
}
