import 'package:chat_data/chat_data.dart';
import 'package:redux/redux.dart';

import '../chat_state.dart';
import 'chat_list_actions.dart';

class ChatListMiddleware extends MiddlewareClass<ChatState> {
  final ChatRepository _chatRepository;

  ChatListMiddleware(this._chatRepository);

  @override
  call(Store<ChatState> store, dynamic action, NextDispatcher next) {
    if (action is ChatActionLoadChats) {
      _chatRepository.chats().listen((chats) {
        store.dispatch(ChatActionLoaded(chats));
      });
    }
  }
}
