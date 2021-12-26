import 'package:concord_arch/concord_arch.dart';
import 'package:chat_data/data.dart';

import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  // ignore: unused_field
  final ChatRepository _chatRepository;

  ChatBloc(this._chatRepository) : super(ChatState());

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) {
    return const Stream.empty();
  }
}
