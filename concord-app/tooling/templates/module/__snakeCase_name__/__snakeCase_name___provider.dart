import 'package:{{ snakeCase $org }}_arch/concord_arch.dart';

import 'package:{{ snakeCase $package }}_data/{{ snakeCase $package }}_data.dart';
import 'package:{{ snakeCase $package }}_team_library/{{ snakeCase $package }}_team_library.dart';

import '{{ snakeCase name }}_bloc.dart';
import '{{ snakeCase name }}_event.dart';
import '{{ snakeCase name }}_screen.dart';
import '{{ snakeCase name }}_state.dart';

class {{ pascalCase name }}Provider extends StatefulWidget {
  final {{ pascalCase $repo }}Repository {{ camelCase $repo }}Repository;

  const {{ pascalCase name }}Provider({
    Key? key,
    required this.{{ camelCase $repo }}Repository,
  }) : super(key: key);

  @override
  _{{ pascalCase name }}ProviderState createState() => _{{ pascalCase name }}ProviderState();
}

class _{{ pascalCase name }}ProviderState extends State<{{ pascalCase name }}Provider> {
  late {{ pascalCase name }}Bloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = {{ pascalCase name }}Bloc(widget.{{ camelCase $repo }}Repository);
    _bloc.add({{ pascalCase name }}EventStart());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocListener<{{ pascalCase name }}Bloc, {{ pascalCase name }}State>(
        listener: (context, state) {
          //
        },
        child: BlocBuilder<{{ pascalCase name }}Bloc, {{ pascalCase name }}State>(
          builder: (context, state) {
            return {{ pascalCase name }}Screen(state: state);
          },
        ),
      ),
    );
  }
}
