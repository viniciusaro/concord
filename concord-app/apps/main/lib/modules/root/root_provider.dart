import 'package:concord_arch/concord_arch.dart';
import 'package:concord_core/concord_core.dart';
import 'package:concord_ui/concord_ui.dart';

import 'package:chat/chat.dart';
import 'package:login/login.dart';

import 'root_bloc.dart';
import 'root_event.dart';
import 'root_state.dart';

class RootProvider extends StatefulWidget {
  final User user;

  final AuthClient authClient;
  final LoginModule loginModule;
  final ChatModule chatModule;

  const RootProvider({
    Key? key,
    required this.user,
    required this.authClient,
    required this.loginModule,
    required this.chatModule,
  }) : super(key: key);

  @override
  _RootProviderState createState() => _RootProviderState();
}

class _RootProviderState extends State<RootProvider> {
  late RootBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = RootBloc(widget.user, widget.authClient);
    _bloc.add(RootEventStart());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocBuilder<RootBloc, RootState>(
        builder: (context, state) {
          final child = state.isLoggedIn == true
              ? widget.chatModule.build()
              : widget.loginModule.build(onLoggedIn: _handleLoggedIn);

          return ConcordLogoutProvider(
            child: child,
            onLogoutButtonTapped: _handleLogoutButtonTap,
          );
        },
      ),
    );
  }

  void _handleLoggedIn(User user) {
    _bloc.add(RootEventLoggedIn(user));
  }

  void _handleLogoutButtonTap(BuildContext context) {
    _bloc.add(RootEventLogout());
  }
}
