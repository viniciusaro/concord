import 'package:scaffold_library/scaffold_library.dart';

import 'concord_button_wireframe.dart';
import 'concord_text.dart';

class ConcordPrimaryActionButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onTap;

  const ConcordPrimaryActionButton({
    Key? key,
    required this.title,
    this.loading = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ConcordTheme.of(context);
    const height = 50.0;

    final content = ConcordText(
      text: title,
      color: theme.colors.primaryText,
    );

    return ConcordButtonWireframe(
      content: content,
      height: height,
      color: theme.colors.primaryAction,
      loading: loading,
      onTap: onTap,
    );
  }
}
