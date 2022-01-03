import 'package:chat_data/chat_data.dart';
import 'package:concord_ui/global.dart';

import 'chat_message_text.dart';

class ChatMessageRenderer {
  final Widget Function(ChatMessage) render;

  ChatMessageRenderer._(this.render);

  factory ChatMessageRenderer.text() => ChatMessageRenderer._(
        (message) => ChatMessageText(message: message),
      );

  factory ChatMessageRenderer.image() => ChatMessageRenderer._(
        (message) => ChatMessageText(message: message),
      );

  factory ChatMessageRenderer.fromMessage() {
    return ChatMessageRenderer._((message) {
      switch (message.type) {
        case ChatMessageType.text:
          return ChatMessageRenderer.text().render(message);
        case ChatMessageType.image:
          return ChatMessageRenderer.image().render(message);
      }
    });
  }
}
