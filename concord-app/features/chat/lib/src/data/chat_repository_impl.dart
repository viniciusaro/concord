import 'package:chat/src/data/models/chat_collection.dart';
import 'package:concord_core/concord_core.dart';

import 'chat_repository.dart';
import 'models/chat_message.dart';

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
}
