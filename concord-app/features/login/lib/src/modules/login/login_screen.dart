import 'package:login/src/modules/login/login_state.dart';
import 'package:login/team_library.dart';

class LoginScreen extends StatelessWidget {
  final LoginState state;
  final Function(String) onLoginButtonTapped;

  const LoginScreen({
    Key? key,
    required this.state,
    required this.onLoginButtonTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConcordScaffold(
      loading: state.submitting,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ConcordActionButton(
            title: "Login com Vini",
            onTap: () => onLoginButtonTapped("vini"),
            loading: state.submitting,
          ),
          const ConcordSpace(),
          ConcordActionButton(
            title: "Login com Cris",
            onTap: () => onLoginButtonTapped("cris"),
            loading: state.submitting,
          ),
          const SafeArea(child: SizedBox(), top: false),
        ],
      ),
    );
  }
}
