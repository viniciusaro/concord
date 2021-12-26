import 'package:loading_indicator/loading_indicator.dart';
import 'package:scaffold_library/scaffold_library.dart';

class ConcordButtonWireframe extends StatelessWidget {
  final Widget content;
  final Color color;
  final bool loading;
  final VoidCallback onTap;
  final double height;

  const ConcordButtonWireframe({
    Key? key,
    required this.content,
    required this.color,
    required this.loading,
    required this.onTap,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = loading
        ? const LoadingIndicator(indicatorType: Indicator.ballScale)
        : content;

    return SizedBox(
      height: height,
      child: ConcordContainer(
        child: Center(child: body),
        color: color,
        padding: ConcordPadding.p0,
        edges: ConcordEdges.topBottom,
        onTap: onTap,
      ),
    );
  }
}
