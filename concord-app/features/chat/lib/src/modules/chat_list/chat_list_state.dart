import 'package:concord_foundation/concord_foundation.dart';

import 'package:chat/data.dart';

part 'chat_list_state.freezed.dart';

@freezed
class ChatListState with _$ChatListState {
  factory ChatListState({
    @Default(false) bool loading,
    @Default(null) Object? error,
    @Default([]) List<Chat> chats,
    TransientValue<Chat>? selectedChat,
  }) = _ChatListState;
}
