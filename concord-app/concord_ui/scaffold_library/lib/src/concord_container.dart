import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'concord_padding.dart';

export 'concord_padding.dart';

class ConcordContainer extends StatelessWidget {
  final Widget child;

  final double grid;
  final ConcordPadding padding;
  final ConcordEdges edges;

  final Color? color;
  final bool shrinkWrap;
  final VoidCallback? onTap;

  const ConcordContainer({
    Key? key,
    required this.child,
    this.grid = 8,
    this.padding = ConcordPadding.p0,
    this.edges = ConcordEdges.all,
    this.color,
    this.shrinkWrap = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final edgeInsets = EdgeInsets.only(
      left: grid * padding.left - edges.leftDiscount,
      top: grid * padding.top - edges.topDiscount,
      right: grid * padding.right - edges.rightDiscount,
      bottom: grid * padding.bottom - edges.leftDiscount,
    );

    return Container(
      color: color,
      child: Padding(
        padding: edgeInsets,
        child: _bodyWidget(),
      ),
    );
  }

  Widget _bodyWidget() {
    return _onTapWidget(
      _shrinkWrapWidget(child),
    );
  }

  Widget _onTapWidget(Widget child) {
    return onTap == null
        ? child
        : RawMaterialButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            fillColor: color,
            elevation: 0,
            highlightElevation: 0,
            onPressed: onTap,
            child: child,
            constraints: const BoxConstraints(minHeight: 0, minWidth: 0),
          );
  }

  Widget _shrinkWrapWidget(Widget child) {
    return shrinkWrap ? Wrap(children: [child]) : child;
  }
}
