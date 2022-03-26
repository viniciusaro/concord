import 'package:chat_team_library/chat_team_library.dart';

import 'chat_state.dart';

class ChatScreen extends StatelessWidget {
  final ChatState state;
  final ChatMessageRenderer renderer;

  final Widget inputWidget;

  const ChatScreen({
    Key? key,
    required this.state,
    required this.renderer,
    required this.inputWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messages = state.messages?.map(renderer.render).toList() ?? [];

    final list = ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) => messages[index],
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      reverse: true,
      padding: EdgeInsets.zero,
    );

    final body = Column(
      children: [
        Expanded(child: list),
        inputWidget,
      ],
    );

    return ConcordScaffold(
      appBar: const ConcordAppBar(title: "Conversa"),
      loading: state.loading,
      error: state.error,
      body: body,
    );
  }
}
