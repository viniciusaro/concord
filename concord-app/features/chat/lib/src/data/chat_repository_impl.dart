import 'package:concord_core/concord_core.dart';

import 'chat_repository.dart';
import 'models/chat_collection.dart';
import 'models/chat_message.dart';
import 'models/chat_message_send.dart';

export 'chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRealtimeResource _chatRealtimeResource;
  final ChatCollectionRealtimeResource _chatCollectionRealtimeResource;

  ChatRepositoryImpl(
    this._chatRealtimeResource,
    this._chatCollectionRealtimeResource,
  );

  @override
  Stream<List<ChatCollection>> chats() {
    return _chatCollectionRealtimeResource.documents(ChatCollection.fromMap);
  }

  @override
  Stream<List<ChatMessage>> messages(String id) {
    return _chatRealtimeResource.documents(id, ChatMessage.fromMap);
  }

  @override
  Future<void> send(String id, ChatMessageSend message) {
    return _chatRealtimeResource
        .write(id, message, ChatMessageSend.toMap)
        .mapError((e) => ChatRepositorySendError(e));
  }
}
