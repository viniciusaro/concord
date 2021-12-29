import 'package:chat/team_library.dart';
import 'package:chat/team_library/chat_list_item.dart';

import 'chat_list_state.dart';

class ChatListScreen extends StatelessWidget {
  final ChatListState state;
  final Function(int) onChatItemTap;

  const ChatListScreen({
    Key? key,
    required this.state,
    required this.onChatItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = ListView.builder(
      itemCount: state.chats.length,
      itemBuilder: (context, index) => ChatListItem(
        onTap: () => onChatItemTap(index),
      ),
    );

    final logoutButton = ConcordPrimaryIconButton(
      icon: Icons.settings,
      onTap: () =>
          ConcordLogoutProvider.of(context)?.onLogoutButtonTapped(context),
    );

    return ConcordScaffold(
      appBar: ConcordAppBar(
        title: "Conversas",
        actions: [logoutButton],
        canPop: false,
      ),
      loading: state.loading,
      error: state.error,
      body: list,
    );
  }
}