import 'package:concord_arch/concord_arch.dart';
import 'package:concord_core/concord_core.dart';

import 'package:login/data.dart';
import 'package:login/team_library.dart';

import 'login_otp_bloc.dart';
import 'login_otp_event.dart';
import 'login_otp_screen.dart';
import 'login_otp_state.dart';

class LoginOtpProvider extends StatefulWidget {
  final Function(User) onLoggedIn;
  final LoginRepository loginRepository;

  const LoginOtpProvider({
    Key? key,
    required this.onLoggedIn,
    required this.loginRepository,
  }) : super(key: key);

  @override
  _LoginOtpProviderState createState() => _LoginOtpProviderState();
}

class _LoginOtpProviderState extends State<LoginOtpProvider> {
  late LoginOtpBloc _bloc;
  final _textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = LoginOtpBloc(widget.loginRepository);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocListener<LoginOtpBloc, LoginOtpState>(
        listener: (context, state) {
          state.user?.value?.let(_handleUserLoggedIn);
        },
        child: BlocBuilder<LoginOtpBloc, LoginOtpState>(
          builder: (context, state) {
            return LoginOtpScreen(
              state: state,
              textFieldController: _textFieldController,
              onOtpButtonTapped: _handleOtpButtonTap,
            );
          },
        ),
      ),
    );
  }

  void _handleOtpButtonTap() {
    _bloc.add(LoginOtpEventSendOtp(_textFieldController.text));
  }

  void _handleUserLoggedIn(User user) {
    widget.onLoggedIn(user);
  }
}
