import 'package:concord_foundation/serialization.dart';
import 'package:concord_foundation/types.dart';

part 'chat_input_state.freezed.dart';

@freezed
class ChatInputState with _$ChatInputState {
  ChatInputState._();

  factory ChatInputState({
    @Default(false) bool loading,
    @Default(null) Object? error,
    TransientValue<bool>? clearText,
  }) = _ChatInputState;

  bool get enabled => loading == false || error == true;
}
