import 'package:concord_arch/concord_arch.dart';
import 'package:concord_foundation/concord_foundation.dart';

import 'package:chat/data.dart';
import 'package:chat/team_library.dart';
import '../chat/chat_module.dart';

import 'chat_list_bloc.dart';
import 'chat_list_event.dart';
import 'chat_list_screen.dart';
import 'chat_list_state.dart';

class ChatListProvider extends StatefulWidget {
  final ChatRepository chatRepository;

  final ChatModule chatModule;

  const ChatListProvider({
    Key? key,
    required this.chatRepository,
    required this.chatModule,
  }) : super(key: key);

  @override
  _ChatListProviderState createState() => _ChatListProviderState();
}

class _ChatListProviderState extends State<ChatListProvider> {
  late ChatListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ChatListBloc(widget.chatRepository);
    _bloc.add(ChatListEventStart());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocListener<ChatListBloc, ChatListState>(
        listener: (context, state) {
          state.selectedChat?.value?.let(_handleChatTap);
        },
        child: BlocBuilder<ChatListBloc, ChatListState>(
          builder: (context, state) {
            return ChatListScreen(
              state: state,
              onChatItemTap: _handleChatItemTap,
            );
          },
        ),
      ),
    );
  }

  void _handleChatItemTap(int index) {
    _bloc.add(ChatListEventItemTap(index));
  }

  void _handleChatTap(Chat chat) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => widget.chatModule.build(id: chat.id),
      ),
    );
  }
}
