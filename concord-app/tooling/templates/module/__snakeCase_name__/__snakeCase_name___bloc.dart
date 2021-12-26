import 'package:concord_arch/concord_arch.dart';
import 'package:{{ $package }}/data.dart';

import '{{snakeCase name}}_event.dart';
import '{{snakeCase name}}_state.dart';

class {{pascalCase name}}Bloc extends Bloc<{{pascalCase name}}Event, {{pascalCase name}}State> {
  final {{pascalCase name}}Repository _{{camelCase name}}Repository;

  {{pascalCase name}}Bloc(this._{{camelCase name}}Repository) : super({{pascalCase name}}State());

  @override
  Stream<{{pascalCase name}}State> mapEventToState({{pascalCase name}}Event event) async* {
    if (event is {{pascalCase name}}EventStart) {
      // handle
    }
  }
}
