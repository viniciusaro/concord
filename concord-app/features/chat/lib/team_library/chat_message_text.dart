import 'package:chat/data.dart';
import 'package:concord_ui/concord_ui.dart';

class ChatMessageText extends StatelessWidget {
  final ChatMessage message;
  const ChatMessageText({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = ConcordText(text: message.message);

    final alignment =
        message.isMe ? Alignment.centerRight : Alignment.centerLeft;

    final color = message.isMe
        ? ConcordTheme.of(context).colors.secondary
        : ConcordTheme.of(context).colors.tertiary;

    return Align(
      alignment: alignment,
      child: ConcordContainer(
        child: text,
        padding: ConcordPadding.p2,
        color: color,
      ),
    );
  }
}
