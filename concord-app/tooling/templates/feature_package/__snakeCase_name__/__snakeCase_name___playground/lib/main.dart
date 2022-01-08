import 'package:{{ snakeCase name }}/{{ snakeCase name }}.dart';
import 'package:playground/playground.dart';

class PlaygroundLoader with RootLoader<void> {
  @override
  Future<void> load() => Future.value();
}

void main() {
  runApp(
    ConcordAppPlayground(
      home: playgroundLocator.get<{{ pascalCase name }}Module>().build(),
      applicationLoader: () => load(
        rootLoader: PlaygroundLoader(),
        serviceLocator: playgroundLocator,
        registersBuilder: (_) => [
          {{ pascalCase name }}Register(),
        ],
      ),
    ),
  );
}
