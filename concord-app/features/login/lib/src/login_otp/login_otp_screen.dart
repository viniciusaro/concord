import 'package:login_team_library/login_team_library.dart';

import 'login_otp_state.dart';

class LoginOtpScreen extends StatelessWidget {
  final LoginOtpState state;
  final TextEditingController textFieldController;
  final VoidCallback onOtpButtonTapped;

  const LoginOtpScreen({
    Key? key,
    required this.state,
    required this.textFieldController,
    required this.onOtpButtonTapped,
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
            title: "Enviar",
            onTap: onOtpButtonTapped,
            loading: state.submitting,
          ),
          const SafeArea(child: SizedBox(), top: false),
        ],
      ),
    );
  }
}
