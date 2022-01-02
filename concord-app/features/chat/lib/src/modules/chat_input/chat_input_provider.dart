import 'package:chat/data.dart';
import 'package:chat/team_library.dart';
import 'package:concord_arch/concord_arch.dart';
import 'package:concord_foundation/types.dart';

import 'chat_input_bloc.dart';
import 'chat_input_event.dart';
import 'chat_input_screen.dart';
import 'chat_input_state.dart';

class ChatInputProvider extends StatefulWidget {
  final String id;
  final ChatRepository chatRepository;

  const ChatInputProvider({
    Key? key,
    required this.id,
    required this.chatRepository,
  }) : super(key: key);

  @override
  _ChatInputProviderState createState() => _ChatInputProviderState();
}

class _ChatInputProviderState extends State<ChatInputProvider> {
  late ChatInputBloc _bloc;
  final _textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = ChatInputBloc(widget.id, widget.chatRepository);
    _bloc.add(ChatInputEventStart());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocListener<ChatInputBloc, ChatInputState>(
        listener: (context, state) {
          state.clearText?.value?.let(_handleTextClear);
        },
        child: BlocBuilder<ChatInputBloc, ChatInputState>(
          builder: (context, state) {
            return ChatInputScreen(
              state: state,
              textFieldController: _textFieldController,
              onSendTapped: _handleSendTap,
            );
          },
        ),
      ),
    );
  }

  void _handleSendTap() {
    final text = _textFieldController.text;
    _bloc.add(ChatInputEventSend(text));
  }

  void _handleTextClear(bool clear) {
    if (clear == true) {
      _textFieldController.clear();
    }
  }
}
