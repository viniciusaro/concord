import 'package:scaffold_library/scaffold_library.dart';

class ConcordButtonWireframe extends StatelessWidget {
  final Widget content;
  final Color color;
  final VoidCallback onTap;

  const ConcordButtonWireframe({
    Key? key,
    required this.content,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConcordContainer(
      child: Center(child: content),
      color: color,
      padding: ConcordPadding.p1,
      edges: ConcordEdges.topBottom,
      onTap: onTap,
    );
  }
}
