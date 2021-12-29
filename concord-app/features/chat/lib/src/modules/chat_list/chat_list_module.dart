import 'package:chat/data.dart';

import '../chat/chat_module.dart';

import 'chat_list_provider.dart';

class ChatListModule {
  final ChatRepository _chatRepository;
  final ChatModule _chatModule;

  ChatListModule(
    this._chatRepository,
    this._chatModule,
  );

  ChatListProvider build() {
    return ChatListProvider(
      chatRepository: _chatRepository,
      chatModule: _chatModule,
    );
  }
}
