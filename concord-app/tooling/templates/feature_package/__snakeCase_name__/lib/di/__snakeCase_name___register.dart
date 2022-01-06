import 'package:{{ $org }}_foundation/di.dart';
import 'package:{{ snakeCase name }}_data/{{ snakeCase name }}_data.dart';

// import '../src/{{ snakeCase name }}/{{ snakeCase name }}_module.dart';

class {{ pascalCase name }}Register with Register {
  @override
  void register(Getter get, Setter set, SingletonSetter setSingleton) {
    // set(() => {{ pascalCase name }}Module(get()));
    set(() => {{ pascalCase name }}RepositoryImpl() as {{ pascalCase name }}Repository);
  }
}
