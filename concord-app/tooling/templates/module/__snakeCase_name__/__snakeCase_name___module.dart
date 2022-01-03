import 'package:{{ $package }}_data/{{ $package }}_data.dart';

import '{{ snakeCase name }}_provider.dart';

class {{ pascalCase name }}Module {
  final {{ pascalCase name }}Repository _{{camelCase name}}Repository;

  {{ pascalCase name }}Module(
    this._{{camelCase name}}Repository,
  );

  {{ pascalCase name }}Provider build() {
    return {{ pascalCase name }}Provider(
      {{camelCase name}}Repository: _{{camelCase name}}Repository,
    );
  }
}
