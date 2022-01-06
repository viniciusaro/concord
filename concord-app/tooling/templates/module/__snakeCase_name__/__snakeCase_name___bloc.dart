import 'package:{{ snakeCase $org }}_arch/{{ snakeCase $org }}_arch.dart';
import 'package:{{ snakeCase $package }}_data/{{ snakeCase $package }}_data.dart';

import '{{ snakeCase name }}_event.dart';
import '{{ snakeCase name }}_state.dart';

class {{ pascalCase name }}Bloc extends Bloc<{{ pascalCase name }}Event, {{ pascalCase name }}State> {
  final {{ pascalCase $repo }}Repository _{{ camelCase $repo }}Repository;

  {{ pascalCase name }}Bloc(this._{{ camelCase $repo }}Repository) : super({{ pascalCase name }}State());

  @override
  Stream<{{ pascalCase name }}State> mapEventToState({{ pascalCase name }}Event event) async* {
    if (event is {{ pascalCase name }}EventStart) {
      // handle
    }
  }
}
