import 'package:chat_data/chat_data.dart';
import 'package:concord_arch/concord_arch.dart';
import 'package:concord_foundation/types.dart';

import 'chat_list_event.dart';
import 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final ChatRepository _chatRepository;

  ChatListBloc(this._chatRepository) : super(ChatListState()) {
    on<ChatListEventStart>((event, emit) {
      return emit.eachState(
        _chatRepository.chats().map((chats) => state.copyWith(chats: chats)),
      );
    });

    on<ChatListEventItemTap>((event, emit) {
      return emit(state.copyWith(
        selectedChat: TransientValue(state.chats[event.index]),
      ));
    });
  }
}
