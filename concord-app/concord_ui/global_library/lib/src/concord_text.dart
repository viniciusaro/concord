import 'package:scaffold_library/scaffold_library.dart';

class ConcordText extends StatelessWidget {
  final String text;
  final Color? color;

  const ConcordText({
    Key? key,
    required this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ConcordTheme.of(context);

    return Text(
      text,
      style: TextStyle(color: color ?? theme.colors.primaryText),
    );
  }
}
