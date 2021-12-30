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
    final horizontalPadding = (padding.top + padding.bottom) / 2;
    final verticalPadding = (padding.left + padding.right) / 2;

    final theme = ConcordTheme.of(context);
    final width = axis == Axis.vertical ? horizontalPadding * theme.grid : 0.0;
    final heigth = axis == Axis.horizontal ? verticalPadding * theme.grid : 0.0;
    return SizedBox(width: width, height: heigth);
  }
}
