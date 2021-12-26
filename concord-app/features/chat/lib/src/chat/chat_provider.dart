import 'package:concord_arch/concord_arch.dart';
import 'package:chat_data/data.dart';
import 'package:flutter/widgets.dart';

import 'chat_bloc.dart';
import 'chat_screen.dart';
import 'chat_state.dart';

class ChatProvider extends StatefulWidget {
  final ChatRepository chatRepository;

  const ChatProvider({
    Key? key,
    required this.chatRepository,
  }) : super(key: key);

  @override
  _ChatProviderState createState() => _ChatProviderState();
}

class _ChatProviderState extends State<ChatProvider> {
  late ChatBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ChatBloc(widget.chatRepository);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
        return const ChatScreen();
      }),
    );
  }
}
