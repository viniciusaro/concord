import 'package:chat/chat.dart';
import 'package:playground/playground.dart';

class PlaygroundLoader with RootLoader<void> {
  @override
  Future<void> load() => Future.value();
}
void main() {
  runApp(
    ConcordAppPlayground(
      home: playgroundLocator.get<ChatListModule>().build(),
      applicationLoader: () => load(
        rootLoader: PlaygroundLoader(),
        serviceLocator: playgroundLocator,
        registersBuilder: (_) => [
          ChatRegister(),
        ],
      ),
    ),
  );
}
