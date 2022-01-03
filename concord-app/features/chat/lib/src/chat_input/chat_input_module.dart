import 'package:chat_data/chat_data.dart';

import 'chat_input_provider.dart';

class ChatInputModule {
  final ChatRepository _chatRepository;

  ChatInputModule(
    this._chatRepository,
  );

  ChatInputProvider build({required String id}) {
    return ChatInputProvider(
      id: id,
      chatRepository: _chatRepository,
    );
  }
}
