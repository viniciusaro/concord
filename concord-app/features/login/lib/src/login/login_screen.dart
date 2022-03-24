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
      body: Flexible(
        child: ConcordTextField(
          autofocus: true,
          controller: textFieldController,
        ),
      ),
    );
  }
}
