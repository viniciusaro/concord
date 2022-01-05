import 'package:concord_arch/concord_arch.dart';
import 'package:concord_core/shared_models.dart';
import 'package:login_data/login_data.dart';
import 'package:login_team_library/login_team_library.dart';

import '../login/login_module.dart';

import 'login_root_bloc.dart';
import 'login_root_event.dart';
import 'login_root_module.dart';
import 'login_root_state.dart';

class LoginRootProvider extends StatefulWidget {
  final User user;
  final LoginRepository loginRepository;

  final LoggedInModuleBuilder loggedInModuleBuilder;
  final LoginModule loginModule;

  const LoginRootProvider({
    Key? key,
    required this.user,
    required this.loggedInModuleBuilder,
    required this.loginModule,
    required this.loginRepository,
  }) : super(key: key);

  @override
  _LoginRootProviderState createState() => _LoginRootProviderState();
}

class _LoginRootProviderState extends State<LoginRootProvider> {
  late LoginRootBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = LoginRootBloc(widget.user, widget.loginRepository);
    _bloc.add(LoginRootEventStart());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocBuilder<LoginRootBloc, LoginRootState>(
        builder: (context, state) {
          return ConcordLogoutProvider(
            onLogoutButtonTapped: _handleLogoutButtonTap,
            child: state.isLoggedIn
                ? widget.loggedInModuleBuilder(state.user).asNav()
                : widget.loginModule.build(onLoggedIn: _handleLoggedIn).asNav(),
          );
        },
      ),
    );
  }

  void _handleLoggedIn(User user) {
    _bloc.add(LoginRootEventLoggedIn(user));
  }

  void _handleLogoutButtonTap(BuildContext context) {
    _bloc.add(LoginRootEventLogout());
  }
}

extension on Widget {
  Navigator asNav() {
    return Navigator(
      key: UniqueKey(),
      onGenerateRoute: (_) => MaterialPageRoute(builder: (_) => this),
    );
  }
}
