import 'package:chat_data/chat_data.dart';
import 'package:concord_foundation/serialization.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  factory ChatState({
    @Default(false) bool loading,
    @Default(null) Object? error,
    @Default(null) List<ChatMessage>? messages,
  }) = _ChatState;
}
