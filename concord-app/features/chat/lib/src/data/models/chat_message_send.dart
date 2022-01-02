import 'package:concord_foundation/serialization.dart';

import 'chat_message_type.dart';

part 'chat_message_send.freezed.dart';
part 'chat_message_send.g.dart';

@freezed
class ChatMessageSend with _$ChatMessageSend {
  factory ChatMessageSend({
    required String message,
    @Default(ChatMessageType.text) ChatMessageType type,
  }) = _ChatMessageSend;

  factory ChatMessageSend.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageSendFromJson(json);

  static Map<String, dynamic> toMap(ChatMessageSend message) =>
      message.toJson();
}
