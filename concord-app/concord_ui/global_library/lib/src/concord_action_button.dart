import 'package:scaffold_library/scaffold_library.dart';

import 'concord_button_wireframe.dart';
import 'concord_text.dart';

class ConcordActionButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;

  const ConcordActionButton({
    Key? key,
    required this.title,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = ConcordText(text: title);

    return ConcordButtonWireframe(
      content: content,
      color: color,
      onTap: onTap,
    );
  }
}
