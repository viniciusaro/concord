import 'dart:math';

import 'package:concord_ui/scaffold.dart';

class ConcordContainer extends StatelessWidget {
  final Widget? child;

  final ConcordPadding padding;

  final Color? color;
  final bool shrinkWrap;
  final VoidCallback? onTap;

  const ConcordContainer({
    Key? key,
    this.child,
    this.padding = ConcordPadding.p1,
    this.color,
    this.shrinkWrap = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ConcordTheme.of(context);

    return Container(
      color: color,
      child: _bodyWidget(theme),
    );
  }

  Widget? _bodyWidget(ConcordTokens theme) {
    final child = this.child;

    if (child != null) {
      return _wrapperWidget(
        _shrinkWrapWidget(child),
        theme,
      );
    }
    return null;
  }

  Widget _wrapperWidget(Widget child, ConcordTokens theme) {
    return onTap == null
        ? _paddingWidget(child, theme)
        : RawMaterialButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            fillColor: color,
            elevation: 0,
            highlightElevation: 0,
            onPressed: onTap,
            child: _paddingWidget(child, theme),
            constraints: const BoxConstraints(minHeight: 0, minWidth: 0),
          );
  }

  Widget _paddingWidget(Widget child, ConcordTokens theme) {
    final grid = theme.grid;

    final edgeInsets = EdgeInsets.only(
      left: max(grid * padding.left, 0),
      top: max(grid * padding.top, 0),
      right: max(grid * padding.right, 0),
      bottom: max(grid * padding.bottom, 0),
    );

    return Padding(
      padding: edgeInsets,
      child: child,
    );
  }

  Widget _shrinkWrapWidget(Widget child) {
    return child;
  }
}
