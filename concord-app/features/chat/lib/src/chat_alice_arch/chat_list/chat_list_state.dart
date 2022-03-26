import 'package:chat_data/chat_data.dart';
import 'package:concord_foundation/serialization.dart';
import 'package:concord_foundation/types.dart';

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
