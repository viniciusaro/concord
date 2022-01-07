import 'package:flutter/material.dart';
import 'package:tokens/tokens.dart';

import 'concord_loading_provider.dart';
import 'concord_theme.dart';

typedef ApplicationLoader<T> = Future<T> Function();
typedef ApplicationWidgetBuilder<T> = Widget Function(T);

/// Created as StatefulWidget to prevent FutureBuilder to rerun
/// on application reload/hot reload.
class ConcordApp<T> extends StatefulWidget {
  final Widget splash;
  final ApplicationLoader<T> applicationLoader;
  final ApplicationWidgetBuilder<T> loadedApplicationBuilder;

  final ConcordTokens theme;
  final WidgetBuilder loadingBuilder;

  const ConcordApp({
    Key? key,
    required this.splash,
    required this.theme,
    required this.applicationLoader,
    required this.loadedApplicationBuilder,
    required this.loadingBuilder,
  }) : super(key: key);

  @override
  State<ConcordApp<T>> createState() => _ConcordAppState<T>();
}

class _ConcordAppState<T> extends State<ConcordApp<T>> {
  late Widget _applicationHostWidget;

  @override
  void initState() {
    super.initState();
    _applicationHostWidget = _buildOnce();
  }

  Widget _buildOnce() {
    return FutureBuilder<T>(
      future: widget.applicationLoader(),
      builder: (_, snapshot) => snapshot.hasData
          ? widget.loadedApplicationBuilder(snapshot.requireData)
          : widget.splash,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConcordTheme(
        tokens: widget.theme,
        child: ConcordLoadingProvider(
          loadingBuilder: widget.loadingBuilder,
          child: _applicationHostWidget,
        ),
      ),
    );
  }
}
