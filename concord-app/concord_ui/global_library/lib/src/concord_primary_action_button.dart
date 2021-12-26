import 'package:scaffold_library/scaffold_library.dart';

import 'concord_button_wireframe.dart';
import 'concord_text.dart';

class ConcordPrimaryActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ConcordPrimaryActionButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ConcordTheme.of(context);

    final content = ConcordText(
      text: title,
      color: theme.colors.secondaryText,
    );

    return ConcordButtonWireframe(
      content: content,
      color: theme.colors.primaryAction,
      onTap: onTap,
    );
  }
}
