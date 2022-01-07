import 'package:chat_data/chat_data.dart';
import 'package:concord_arch/concord_arch.dart';

import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final String id;
  final ChatRepository _chatRepository;

  ChatBloc(this.id, this._chatRepository) : super(ChatState()) {
    on<ChatEventStart>((event, emit) {
      return emit.eachState(_chatRepository
          .messages(id)
          .map((messages) => state.copyWith(messages: messages)));
    });
  }
}
