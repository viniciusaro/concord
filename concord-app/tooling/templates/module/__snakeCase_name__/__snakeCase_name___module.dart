import 'package:{{ snakeCase $package }}_data/{{ snakeCase $package }}_data.dart';

import '{{ snakeCase name }}_provider.dart';

class {{ pascalCase name }}Module {
  final {{ pascalCase $repo }}Repository _{{ camelCase $repo }}Repository;

  {{ pascalCase name }}Module(
    this._{{ camelCase $repo }}Repository,
  );

  {{ pascalCase name }}Provider build() {
    return {{ pascalCase name }}Provider(
      {{ camelCase $repo }}Repository: _{{ camelCase $repo }}Repository,
    );
  }
}
