import 'package:global_library/src/concord_button_wireframe.dart';
import 'package:scaffold_library/scaffold_library.dart';

class ConcordPrimaryIconButton extends StatelessWidget {
  final bool loading;
  final VoidCallback onTap;
  final IconData icon;

  const ConcordPrimaryIconButton({
    Key? key,
    this.loading = false,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = Icon(icon);
    const height = 36.0;
    const width = 36.0;
    final theme = ConcordTheme.of(context);

    return ConcordButtonWireframe(
      content: content,
      color: theme.colors.primaryAction,
      loading: loading,
      onTap: onTap,
      height: height,
      width: width,
    );
  }
}
