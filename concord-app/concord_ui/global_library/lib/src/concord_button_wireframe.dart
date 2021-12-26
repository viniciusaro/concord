import 'package:scaffold_ui/scaffold_ui.dart';

class ConcordButtonWireframe extends StatelessWidget {
  final Widget content;

  const ConcordButtonWireframe({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConcordContainer(
      child: Center(child: content),
      padding: ConcordPadding.p1,
      edges: ConcordEdges.topBottom,
    );
  }
}
