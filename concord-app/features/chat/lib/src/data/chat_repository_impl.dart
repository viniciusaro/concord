import 'chat_repository.dart';
import 'models/chat.dart';

export 'chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  @override
  Stream<Chat> chat() {
    throw UnimplementedError();
  }
}
