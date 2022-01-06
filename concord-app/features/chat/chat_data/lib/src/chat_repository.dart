import 'package:concord_foundation/exceptions.dart';

import 'models/chat.dart';
import 'models/chat_message.dart';
import 'models/chat_message_send.dart';

abstract class ChatRepository {
  Stream<List<Chat>> chats();
  Stream<List<ChatMessage>> messages(String chatId);
  Future<void> send(String chatId, ChatMessageSend message);
}

class ChatRepositorySendError extends BaseError {
  @override
  bool get reportIfUnhandled => true;

  @override
  final Object? error;
  ChatRepositorySendError(this.error);
}
