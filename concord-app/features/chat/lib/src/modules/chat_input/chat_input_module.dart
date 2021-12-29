import 'package:chat/data.dart';

import 'chat_input_provider.dart';

class ChatInputModule {
  final ChatRepository _chatRepository;

  ChatInputModule(
    this._chatRepository,
  );

  ChatInputProvider build() {
    return ChatInputProvider(
      chatRepository: _chatRepository,
    );
  }
}
