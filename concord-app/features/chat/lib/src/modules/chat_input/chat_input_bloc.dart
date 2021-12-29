import 'package:concord_arch/concord_arch.dart';
import 'package:concord_core/concord_core.dart';
import 'package:chat/data.dart';

import 'chat_input_event.dart';
import 'chat_input_state.dart';

class ChatInputBloc extends Bloc<ChatInputEvent, ChatInputState> {
  final ChatRepository _chatRepository;

  ChatInputBloc(this._chatRepository) : super(ChatInputState());

  @override
  Stream<ChatInputState> mapEventToState(ChatInputEvent event) async* {
    if (event is ChatInputEventSend) {
      try {
        yield state.copyWith(
          loading: true,
          error: false,
          clearText: TransientValue(true),
        );
        await _chatRepository.send(
          "61CKHq63L5a7EGxBxJZD",
          ChatMessageSend(message: event.text),
        );
      } catch (e) {
        yield state.copyWith(error: true);
      } finally {
        yield state.copyWith(loading: false);
      }
    }
  }
}
