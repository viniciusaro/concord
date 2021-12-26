import 'models/chat.dart';

abstract class ChatRepository {
  Stream<Chat> chat();
}
