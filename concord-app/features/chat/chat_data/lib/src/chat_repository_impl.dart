import 'package:concord_core/realtime.dart';
import 'package:concord_foundation/types.dart';

import 'chat_repository.dart';

import 'models/chat.dart';
import 'models/chat_message.dart';
import 'models/chat_message_send.dart';

export 'chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatMessageRealtimeResource _chatMessageResource;
  final ChatListRealtimeResource _chatListResource;

  ChatRepositoryImpl(
    this._chatMessageResource,
    this._chatListResource,
  );

  @override
  Stream<List<Chat>> chats() {
    return _chatListResource.documents(Chat.fromMap);
  }

  @override
  Stream<List<ChatMessage>> messages(String chatId) {
    return _chatMessageResource.documents(chatId, ChatMessage.fromMap);
  }

  @override
  Future<void> send(String chatId, ChatMessageSend message) {
    return _chatMessageResource
        .write(chatId, message, ChatMessageSend.toMap)
        .mapError((e) => ChatRepositorySendException(e));
  }
}
