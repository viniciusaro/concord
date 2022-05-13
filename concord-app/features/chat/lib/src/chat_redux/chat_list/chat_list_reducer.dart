import 'package:redux/redux.dart';

import '../chat_state.dart';
import 'chat_list_actions.dart';

final chatListReducer = combineReducers<ChatState>([
  TypedReducer<ChatState, ChatActionLoaded>(_onLoaded),
]);

ChatState _onLoaded(ChatState state, ChatActionLoaded action) {
  return state.copyWith(chats: action.chats);
}
