import 'package:concord_foundation/concord_foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'concord_container.dart';
export 'concord_padding.dart';
import 'concord_theme.dart';

enum ConcordScaffoldStatusBarStyle {
  light,
  dark,
}

class ConcordScaffold extends StatelessWidget {
  final Widget body;
  final WidgetBuilder? loadingBuilder;
  final WidgetBuilder? errorBuilder;

  final bool loading;
  final BaseException? exception;

  final double grid;
  final ConcordPadding padding;
  final ConcordEdges edges;
  final Color? color;
  final ConcordScaffoldStatusBarStyle statusBarStyle;

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
    this.color,
    this.statusBarStyle = ConcordScaffoldStatusBarStyle.light,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: statusBarStyle.overlay,
        child: ConcordContainer(
          padding: padding,
          edges: edges,
          color: color ?? ConcordTheme.of(context).colors.primary,
          child: _bodyWidget(context),
        ),
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

extension on ConcordScaffoldStatusBarStyle {
  SystemUiOverlayStyle get overlay {
    switch (this) {
      case ConcordScaffoldStatusBarStyle.light:
        return SystemUiOverlayStyle.light;
      case ConcordScaffoldStatusBarStyle.dark:
        return SystemUiOverlayStyle.dark;
    }
  }
}
