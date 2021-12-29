import 'package:scaffold_library/scaffold_library.dart';

class ConcordTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool enabled;

  const ConcordTextField({
    Key? key,
    this.controller,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ConcordTheme.of(context);

    const enabledBorder = OutlineInputBorder(
      gapPadding: 1,
      borderRadius: BorderRadius.all(Radius.circular(0)),
    );

    const focusedBorder = OutlineInputBorder(
      gapPadding: 1,
      borderRadius: BorderRadius.all(Radius.circular(0)),
    );

    return TextField(
      enabled: enabled,
      style: TextStyle(
        color: theme.colors.primaryText,
      ),
      decoration: InputDecoration(
        fillColor: theme.colors.primaryBackground,
        filled: true,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
      ),
      controller: controller,
    );
  }
}
