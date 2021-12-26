import 'package:{{ $org }}_arch/concord_arch.dart';
import 'package:{{ $package }}/data.dart';
import 'package:flutter/widgets.dart';

import '{{snakeCase name}}_bloc.dart';
import '{{snakeCase name}}_screen.dart';
import '{{snakeCase name}}_state.dart';

class {{pascalCase name}}Provider extends StatefulWidget {
  final {{pascalCase name}}Repository {{camelCase name}}Repository;

  const {{pascalCase name}}Provider({
    Key? key,
    required this.{{camelCase name}}Repository,
  }) : super(key: key);

  @override
  _{{pascalCase name}}ProviderState createState() => _{{pascalCase name}}ProviderState();
}

class _{{pascalCase name}}ProviderState extends State<{{pascalCase name}}Provider> {
  late {{pascalCase name}}Bloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = {{pascalCase name}}Bloc(widget.{{camelCase name}}Repository);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocBuilder<{{pascalCase name}}Bloc, {{pascalCase name}}State>(builder: (context, state) {
        return const {{pascalCase name}}Screen();
      }),
    );
  }
}
