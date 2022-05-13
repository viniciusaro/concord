import 'package:chat_team_library/chat_team_library.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../chat_state.dart';
import 'chat_list_screen.dart';
import 'chat_list_screen_view_model.dart';

class ChatListProvider extends StatefulWidget {
  const ChatListProvider({Key? key}) : super(key: key);

  @override
  State<ChatListProvider> createState() => _ChatListProviderState();
}

class _ChatListProviderState extends State<ChatListProvider> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ChatState, ChatListScreenViewModel>(
      converter: (store) {
        return ChatListScreenViewModel(store.state.chats);
      },
      builder: (context, viewModel) {
        return ChatListScreen(viewModel: viewModel);
      },
    );
  }
}
