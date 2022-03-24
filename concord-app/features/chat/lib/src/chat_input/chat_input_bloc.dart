import 'package:chat_data/chat_data.dart';
import 'package:concord_arch/concord_arch.dart';
import 'package:concord_foundation/types.dart';

import 'chat_input_event.dart';
import 'chat_input_state.dart';

class ChatInputBloc extends Bloc<ChatInputEvent, ChatInputState> {
  final String id;
  final ChatRepository _chatRepository;

  ChatInputBloc(this.id, this._chatRepository) : super(ChatInputState()) {
    on<ChatInputEventSend>((event, emit) {
      emit(state.copyWith(
        loading: true,
        error: false,
        clearText: TransientValue(true),
      ));

      final messageSend = ChatMessageSend(message: event.text);
      return emit.eachState(_chatRepository.send(id, messageSend).eval(
            onError: (e) => state.copyWith(error: true),
            always: () => state.copyWith(loading: false),
          ));
    });
  }
}
