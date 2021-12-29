import 'package:concord_arch/concord_arch.dart';
import 'package:concord_core/concord_core.dart';
import 'package:login/data.dart';
import 'package:flutter/widgets.dart';
import 'package:login/src/modules/login/login_event.dart';

import 'login_bloc.dart';
import 'login_screen.dart';
import 'login_state.dart';

class LoginProvider extends StatefulWidget {
  final Function(User) onLoggedIn;
  final LoginRepository loginRepository;

  const LoginProvider({
    Key? key,
    required this.onLoggedIn,
    required this.loginRepository,
  }) : super(key: key);

  @override
  _LoginProviderState createState() => _LoginProviderState();
}

class _LoginProviderState extends State<LoginProvider> {
  late LoginBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = LoginBloc(widget.loginRepository);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          state.user?.let(widget.onLoggedIn);
        },
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          return LoginScreen(
            state: state,
            onLoginButtonTapped: _handleLoginTap,
          );
        }),
      ),
    );
  }

  void _handleLoginTap(String otp) {
    _bloc.add(LoginEventSignIn(otp));
  }
}
