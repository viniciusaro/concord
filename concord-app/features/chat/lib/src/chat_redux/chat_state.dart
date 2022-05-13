import 'package:chat_data/chat_data.dart';
import 'package:concord_foundation/serialization.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  factory ChatState({
    @Default(null) List<Chat> chats,
    @Default(null) Map<Chat, ChatMessage>? messages,
  }) = _ChatState;
}
