import 'package:chat/data.dart';
import 'package:concord_foundation/concord_foundation.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  factory ChatState({
    @Default(false) bool loading,
    @Default(null) Object? error,
    @Default(null) List<ChatMessage>? messages,
  }) = _ChatState;
}
