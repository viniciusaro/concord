import 'package:{{ $package }}/team_library.dart';

import '{{ snakeCase name }}_state.dart';

class {{ pascalCase name }}Screen extends StatelessWidget {
  final {{ pascalCase name }}State state;

  const {{ pascalCase name }}Screen({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConcordScaffold(
      loading: state.loading,
      error: state.error,
    );
  }
}
