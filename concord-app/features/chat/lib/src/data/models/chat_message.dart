import 'package:concord_core/concord_core.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

@freezed
class ChatMessage with _$ChatMessage {
  factory ChatMessage(
    String id,
    String message,
  ) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  static ChatMessage fromMap(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}
