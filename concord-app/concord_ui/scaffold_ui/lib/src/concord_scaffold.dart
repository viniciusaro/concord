import 'package:concord_foundation/concord_foundation.dart';
import 'package:flutter/material.dart';

import 'concord_container.dart';
import 'concord_padding.dart';
export 'concord_padding.dart';

class ConcordScaffold extends StatelessWidget {
  final Widget body;
  final WidgetBuilder? loadingBuilder;
  final WidgetBuilder? errorBuilder;

  final bool loading;
  final BaseException? exception;

  final double grid;
  final ConcordPadding padding;
  final ConcordEdges edges;

  const ConcordScaffold({
    Key? key,
    required this.body,
    this.loadingBuilder,
    this.errorBuilder,
    this.loading = false,
    this.exception,
    this.grid = 8,
    this.padding = ConcordPadding.p0,
    this.edges = ConcordEdges.leftRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcordContainer(
        padding: padding,
        edges: edges,
        child: _bodyWidget(context),
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return loading
        ? _loadingWidget(context)
        : exception != null
            ? _errorWidget(context)
            : body;
  }

  Widget _loadingWidget(BuildContext context) {
    return loadingBuilder?.call(context) ?? Container();
  }

  Widget _errorWidget(BuildContext context) {
    return errorBuilder?.call(context) ?? Container();
  }
}
