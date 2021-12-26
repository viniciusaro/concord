import 'package:chat_data/data.dart';

import 'chat_provider.dart';

class ChatModule {
  final ChatRepository _chatRepository;

  ChatModule(
    this._chatRepository,
  );

  ChatProvider build() {
    return ChatProvider(
      chatRepository: _chatRepository,
    );
  }
}
