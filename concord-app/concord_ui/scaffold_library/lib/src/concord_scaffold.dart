import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scaffold_library/src/concord_loading_provider.dart';

import 'concord_container.dart';
export 'concord_padding.dart';
import 'concord_theme.dart';

enum ConcordScaffoldStatusBarStyle {
  light,
  dark,
}

class ConcordScaffold extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final WidgetBuilder? loadingBuilder;
  final WidgetBuilder? errorBuilder;

  final bool loading;
  final Object? error;

  final double grid;
  final ConcordPadding padding;
  final Color? color;
  final ConcordScaffoldStatusBarStyle statusBarStyle;

  const ConcordScaffold({
    Key? key,
    this.body,
    this.appBar,
    this.loadingBuilder,
    this.errorBuilder,
    this.loading = false,
    this.error,
    this.grid = 8,
    this.padding = ConcordPadding.p0,
    this.color,
    this.statusBarStyle = ConcordScaffoldStatusBarStyle.light,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color =
        this.color ?? ConcordTheme.of(context).colors.primaryBackground;

    return Scaffold(
      appBar: appBar,
      backgroundColor: color,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: statusBarStyle.overlay,
        child: ConcordContainer(
          padding: padding,
          child: _bodyWidget(context),
        ),
      ),
    );
  }

  Widget? _bodyWidget(BuildContext context) {
    return loading
        ? _loadingWidget(context)
        : error != null
            ? _errorWidget(context)
            : body;
  }

  Widget _loadingWidget(BuildContext context) {
    return Center(
      child: loadingBuilder?.call(context) ??
          ConcordLoadingProvider.of(context)?.loadingBuilder(context) ??
          Container(),
    );
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
