import 'package:concord_ui/concord_ui.dart';

class ChatListItem extends StatelessWidget {
  final VoidCallback onTap;

  const ChatListItem({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConcordContainer(
      onTap: onTap,
      padding: ConcordPadding.p2,
      child: Row(
        children: [
          const Expanded(child: ConcordText(text: "Conversa")),
          ConcordIconButton(
            icon: Icons.arrow_forward,
            style: ConcordIconButtonStyle.tertiary,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
