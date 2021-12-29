import 'package:concord_core/concord_core.dart';

import 'chat_message_type.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

@freezed
class ChatMessage with _$ChatMessage {
  ChatMessage._();

  factory ChatMessage({
    required String message,
    required String userId,
    required String senderId,
    @Default(ChatMessageType.text) ChatMessageType type,
  }) = _ChatMessage;

  bool get isMe => userId == senderId;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  static Map<String, dynamic> toMap(ChatMessage message) => message.toJson();

  static ChatMessage fromMap(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}
