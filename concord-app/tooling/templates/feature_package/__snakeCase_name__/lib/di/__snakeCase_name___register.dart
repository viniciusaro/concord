import 'package:{{ $org }}_foundation/{{ $org }}_foundation.dart';

import '../src/data/{{ snakeCase name }}_repository_impl.dart';
import '../src/modules/{{ snakeCase name }}/{{ snakeCase name }}_module.dart';

class {{pascalCase name}}Register with Register {
  @override
  void register(Getter get, Setter set) {
    set(() => {{pascalCase name}}Module(get()));
    set(() => {{pascalCase name}}RepositoryImpl() as {{pascalCase name}}Repository);
  }
}
