import 'package:concord_arch/concord_arch.dart';
import 'package:concord_core/concord_core.dart';

import 'root_event.dart';
import 'root_state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  final AuthClient _authClient;

  RootBloc(User user, this._authClient) : super(RootState(user: user));

  @override
  Stream<RootState> mapEventToState(RootEvent event) async* {
    if (event is RootEventStart) {
      try {
        final user = await _authClient.session();
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
        final user = await _authClient.signOut();
        yield state.copyWith(user: user);
      } catch (e) {
        yield state.copyWith(error: e);
      }
    }
  }
}
