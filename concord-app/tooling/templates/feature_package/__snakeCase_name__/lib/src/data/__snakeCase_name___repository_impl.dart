import 'package:{{ $org }}_core/{{ $org }}_core.dart';

import '{{snakeCase name}}_repository.dart';
import 'models/{{snakeCase name}}.dart';

export '{{snakeCase name}}_repository.dart';

class {{pascalCase name}}RepositoryImpl implements {{pascalCase name}}Repository {
  @override
  Stream<{{pascalCase name}}> {{camelCase name}}() {
    throw UnimplementedError();
  }
}
