import 'package:flutter/widgets.dart';

import 'concord_padding.dart';

export 'concord_padding.dart';

class ConcordContainer extends StatelessWidget {
  final Widget child;

  final double grid;
  final ConcordPadding padding;
  final ConcordEdges edges;

  final bool shrinkWrap;

  const ConcordContainer({
    Key? key,
    required this.child,
    this.grid = 8,
    this.padding = ConcordPadding.p0,
    this.edges = ConcordEdges.all,
    this.shrinkWrap = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final edgeInsets = EdgeInsets.only(
      left: grid * padding.left - edges.leftDiscount,
      top: grid * padding.top - edges.topDiscount,
      right: grid * padding.right - edges.rightDiscount,
      bottom: grid * padding.bottom - edges.leftDiscount,
    );

    return Padding(
      padding: edgeInsets,
      child: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return shrinkWrap ? Wrap(children: [child]) : child;
  }
}
