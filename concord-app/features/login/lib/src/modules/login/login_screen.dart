import 'package:login/team_library.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback onLoginButtonTapped;

  const LoginScreen({
    Key? key,
    required this.onLoginButtonTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConcordScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConcordActionButton(
            title: "Login com Vini",
            color: Colors.blue,
            onTap: onLoginButtonTapped,
          ),
        ],
      ),
    );
  }
}
