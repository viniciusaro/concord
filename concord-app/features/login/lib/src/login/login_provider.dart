import 'package:concord_arch/concord_arch.dart';
import 'package:concord_core/shared_models.dart';
import 'package:concord_foundation/types.dart';

import 'package:login_data/login_data.dart';
import 'package:login_team_library/login_team_library.dart';
import 'package:url_launcher/url_launcher.dart';

import '../login_otp/login_otp_module.dart';
import 'login_bloc.dart';
import 'login_screen.dart';
import 'login_state.dart';

class LoginProvider extends StatefulWidget {
  final Function(User) onLoggedIn;
  final LoginRepository loginRepository;

  final LoginOtpModule loginOtpModule;

  const LoginProvider({
    Key? key,
    required this.onLoggedIn,
    required this.loginRepository,
    required this.loginOtpModule,
  }) : super(key: key);

  @override
  _LoginProviderState createState() => _LoginProviderState();
}

class _LoginProviderState extends State<LoginProvider> {
  late LoginBloc _bloc;
  final _textFieldController = TextEditingController();

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
          state.success?.let((_) => _handleOtpSuccess());
        },
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          return LoginScreen(
            state: state,
            textFieldController: _textFieldController,
            onLoginButtonTapped: _handleLoginTap,
          );
        }),
      ),
    );
  }

  void _handleLoginTap() {
    launch("www.google.com.br");
    // _bloc.add(LoginEventSignIn(_textFieldController.text));
  }

  void _handleOtpSuccess() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => widget.loginOtpModule.build(
          onLoggedIn: widget.onLoggedIn,
        ),
      ),
    );
  }
}
