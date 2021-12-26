import 'package:login/src/modules/login/login_state.dart';
import 'package:login/team_library.dart';

class LoginScreen extends StatelessWidget {
  final LoginState state;
  final VoidCallback onLoginButtonTapped;

  const LoginScreen({
    Key? key,
    required this.state,
    required this.onLoginButtonTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConcordScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConcordPrimaryActionButton(
            title: "Login com Vini",
            onTap: onLoginButtonTapped,
            loading: state.submitting,
          ),
        ],
      ),
    );
  }
}
