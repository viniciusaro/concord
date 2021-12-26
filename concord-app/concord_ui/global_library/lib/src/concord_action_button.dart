import 'package:flutter/widgets.dart';

import 'concord_button_wireframe.dart';
import 'concord_text.dart';

class ConcordActionButton extends StatelessWidget {
  final String title;

  const ConcordActionButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = ConcordText(text: title);
    return ConcordButtonWireframe(content: content);
  }
}
