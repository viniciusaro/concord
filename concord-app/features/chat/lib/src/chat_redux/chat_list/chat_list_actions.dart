import 'package:chat_data/chat_data.dart';

class ChatAction {}

class ChatActionLoadChats {}

class ChatActionLoaded {
  final List<Chat> chats;
  ChatActionLoaded(this.chats);
}
