import 'package:chat_data/chat_data.dart';
import 'package:concord_arch/concord_arch.dart';
import 'package:concord_foundation/types.dart';

import 'chat_input_event.dart';
import 'chat_input_state.dart';

class ChatInputBloc extends Bloc<ChatInputEvent, ChatInputState> {
  final String id;
  final ChatRepository _chatRepository;

  ChatInputBloc(this.id, this._chatRepository) : super(ChatInputState());

  @override
  Stream<ChatInputState> mapEventToState(ChatInputEvent event) async* {
    if (event is ChatInputEventSend) {
      yield state.copyWith(
        loading: true,
        error: false,
        clearText: TransientValue(true),
      );

      yield* _chatRepository
          .send(id, ChatMessageSend(message: event.text))
          .fold(
            onError: (e) => state.copyWith(error: true),
            always: () => state.copyWith(loading: false),
          );
    }
  }
}
