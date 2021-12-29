import 'dart:async';

import 'package:concord_arch/concord_arch.dart';
import 'package:chat/data.dart';

import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final String id;
  final ChatRepository _chatRepository;

  StreamSubscription<List<ChatMessage>>? _chatMessageSubscription;

  ChatBloc(this.id, this._chatRepository) : super(ChatState());

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is ChatEventStart) {
      _listenToMessages();
    }
    if (event is _ChatEventState) {
      yield event.state;
    }
  }

  void _listenToMessages() {
    _chatMessageSubscription?.cancel();
    _chatMessageSubscription = _chatRepository.messages(id).listen((messages) {
      add(_ChatEventState(state.copyWith(messages: messages)));
    });
  }

  @override
  Future<void> close() {
    _chatMessageSubscription?.cancel();
    return super.close();
  }
}

class _ChatEventState extends ChatEvent {
  final ChatState state;
  _ChatEventState(this.state);
}
