import 'package:scaffold_library/scaffold_library.dart';

import 'concord_primary_icon_button.dart';
import 'concord_text.dart';

class ConcordAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool? canPop;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const ConcordAppBar({
    Key? key,
    required this.title,
    this.canPop,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ConcordTheme.of(context);
    final navigator = Navigator.of(context);

    final title = ConcordText(text: this.title);

    final backButton = ConcordPrimaryIconButton(
      onTap: () => navigator.pop(),
      icon: Icons.arrow_back_sharp,
    );

    final leading = canPop != false && navigator.canPop()
        ? Center(child: backButton)
        : const SizedBox();

    final actions =
        this.actions?.map((action) => Center(child: action)).toList();

    return AppBar(
      title: title,
      leading: leading,
      actions: actions,
      backgroundColor: theme.colors.secondary,
    );
  }
}