import 'dart:async';

import 'package:concord_arch/concord_arch.dart';
import 'package:chat/data.dart';
import 'package:concord_core/concord_core.dart';

import 'chat_list_event.dart';
import 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final ChatRepository _chatRepository;

  StreamSubscription<List<Chat>>? _chatsSubscription;

  ChatListBloc(this._chatRepository) : super(ChatListState());

  @override
  Stream<ChatListState> mapEventToState(ChatListEvent event) async* {
    if (event is ChatListEventStart) {
      _listenToChats();
    }
    if (event is ChatListEventItemTap) {
      yield state.copyWith(
        selectedChat: TransientValue(state.chats[event.index]),
      );
    }
    if (event is _ChatListEventState) {
      yield event.state;
    }
  }

  void _listenToChats() {
    _chatsSubscription?.cancel();
    _chatsSubscription = _chatRepository.chats().listen((chats) {
      add(_ChatListEventState(state.copyWith(chats: chats)));
    });
  }

  @override
  Future<void> close() {
    _chatsSubscription?.cancel();
    return super.close();
  }
}

class _ChatListEventState extends ChatListEvent {
  final ChatListState state;
  _ChatListEventState(this.state);
}
