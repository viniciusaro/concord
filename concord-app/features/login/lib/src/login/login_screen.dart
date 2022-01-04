import 'package:login_team_library/login_team_library.dart';

import 'login_state.dart';

class LoginScreen extends StatelessWidget {
  final LoginState state;
  final TextEditingController textFieldController;
  final VoidCallback onLoginButtonTapped;

  const LoginScreen({
    Key? key,
    required this.state,
    required this.textFieldController,
    required this.onLoginButtonTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConcordScaffold(
      loading: state.submitting,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ConcordTextField(
            autofocus: true,
            controller: textFieldController,
          ),
          ConcordActionButton(
            title: "Entrar",
            onTap: onLoginButtonTapped,
            loading: state.submitting,
          ),
          const SafeArea(child: SizedBox(), top: false),
        ],
      ),
    );
  }
}
