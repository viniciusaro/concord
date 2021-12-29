import 'dart:math';

import 'package:scaffold_library/scaffold_library.dart';
import 'package:token_library/token_library.dart';

export 'concord_padding.dart';

class ConcordContainer extends StatelessWidget {
  final Widget? child;

  final ConcordPadding padding;
  final ConcordEdges edges;

  final Color? color;
  final bool shrinkWrap;
  final VoidCallback? onTap;

  const ConcordContainer({
    Key? key,
    this.child,
    this.padding = ConcordPadding.p1,
    this.edges = ConcordEdges.all,
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
      left: max(grid * padding.left - edges.leftDiscount, 0),
      top: max(grid * padding.top - edges.topDiscount, 0),
      right: max(grid * padding.right - edges.rightDiscount, 0),
      bottom: max(grid * padding.bottom - edges.leftDiscount, 0),
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
