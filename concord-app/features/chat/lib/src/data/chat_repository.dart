import 'package:chat/src/data/models/chat_collection.dart';

import 'models/chat_message.dart';

abstract class ChatRepository {
  Stream<List<ChatCollection>> chats();
  Stream<List<ChatMessage>> messages(String id);
}
