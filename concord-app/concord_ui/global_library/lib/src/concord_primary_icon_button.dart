import 'package:global_library/src/concord_button_wireframe.dart';
import 'package:scaffold_library/scaffold_library.dart';

class ConcordPrimaryIconButton extends StatelessWidget {
  final IconData icon;
  final bool loading;
  final VoidCallback onTap;

  const ConcordPrimaryIconButton({
    Key? key,
    required this.icon,
    this.loading = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ConcordTheme.of(context);
    final content = Icon(icon, color: theme.colors.primaryText);
    const height = 36.0;
    const width = 36.0;

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
