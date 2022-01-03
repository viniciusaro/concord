import 'package:chat_data/chat_data.dart';

import '../chat_input/chat_input_module.dart';
import 'chat_provider.dart';

class ChatModule {
  final ChatRepository _chatRepository;
  final ChatInputModule _chatInputModule;

  ChatModule(
    this._chatRepository,
    this._chatInputModule,
  );

  ChatProvider build({required String id}) {
    return ChatProvider(
      id: id,
      chatRepository: _chatRepository,
      chatInputModule: _chatInputModule,
    );
  }
}
