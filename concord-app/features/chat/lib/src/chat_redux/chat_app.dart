import 'package:chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'chat_list/chat_list_middleware.dart';
import 'chat_list/chat_list_provider.dart';
import 'chat_list/chat_list_reducer.dart';
import 'chat_state.dart';

class ChatApp extends StatefulWidget {
  final ChatRepository chatRepository;

  const ChatApp({Key? key, required this.chatRepository}) : super(key: key);

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  late Store<ChatState> store;

  @override
  void initState() {
    super.initState();

    store = Store(
      combineReducers([
        chatListReducer,
      ]),
      middleware: [
        ChatListMiddleware(widget.chatRepository),
      ],
      initialState: ChatState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: const ChatListProvider(),
    );
  }
}
