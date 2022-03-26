import 'package:chat_team_library/chat_team_library.dart';

import 'chat_input_state.dart';

class ChatInputScreen extends StatelessWidget {
  final ChatInputState state;
  final TextEditingController textFieldController;
  final VoidCallback onSendTapped;

  const ChatInputScreen({
    Key? key,
    required this.state,
    required this.textFieldController,
    required this.onSendTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ConcordTheme.of(context);
    final textField = ConcordTextField(controller: textFieldController);

    final sendButton = ConcordIconButton(
      icon: Icons.send,
      onTap: onSendTapped,
    );

    final body = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(child: textField),
        const ConcordSpace(axis: Axis.vertical, padding: ConcordPadding.p1),
        sendButton,
      ],
    );

    return ConcordContainer(
      color: theme.colors.secondary,
      child: SafeArea(
        top: false,
        child: body,
      ),
    );
  }
}
