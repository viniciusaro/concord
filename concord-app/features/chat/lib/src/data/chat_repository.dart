import 'package:concord_core/concord_core.dart';

import 'models/chat.dart';
import 'models/chat_message.dart';
import 'models/chat_message_send.dart';

abstract class ChatRepository {
  Stream<List<Chat>> chats();
  Stream<List<ChatMessage>> messages(String id);
  Future<void> send(String id, ChatMessageSend message);
}

class ChatRepositorySendError extends BaseError {
  @override
  bool get reportIfUnhandled => true;
  @override
  final Object? error;
  ChatRepositorySendError(this.error);
}
