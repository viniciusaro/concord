import 'package:chat/team_library.dart';

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

    final logoutButton = ConcordPrimaryIconButton(
      icon: Icons.settings,
      onTap: () =>
          ConcordLogoutProvider.of(context)?.onLogoutButtonTapped(context),
    );

    final body = Column(
      children: [
        Expanded(child: list),
        const ConcordSpace(),
        inputWidget,
      ],
    );

    return ConcordScaffold(
      appBar: ConcordAppBar(title: "Conversa", actions: [logoutButton]),
      loading: state.loading,
      error: state.error,
      body: body,
    );
  }
}
