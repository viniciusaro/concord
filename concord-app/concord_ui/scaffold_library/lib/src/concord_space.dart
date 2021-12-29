import 'package:scaffold_library/scaffold_library.dart';

class ConcordSpace extends StatelessWidget {
  final ConcordPadding padding;
  final Axis axis;

  const ConcordSpace({
    Key? key,
    this.padding = ConcordPadding.p1,
    this.axis = Axis.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ConcordTheme.of(context);
    final width = axis == Axis.vertical ? padding.value * theme.grid : 0.0;
    final heigth = axis == Axis.horizontal ? padding.value * theme.grid : 0.0;
    return SizedBox(width: width, height: heigth);
  }
}
