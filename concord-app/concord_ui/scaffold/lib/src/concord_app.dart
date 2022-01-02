import 'package:flutter/material.dart';
import 'package:tokens/tokens.dart';

import 'concord_loading_provider.dart';
import 'concord_theme.dart';

class ConcordApp extends StatelessWidget {
  final Widget child;
  final ConcordTokens theme;
  final WidgetBuilder loadingBuilder;

  const ConcordApp({
    Key? key,
    required this.theme,
    required this.child,
    required this.loadingBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConcordTheme(
        tokens: theme,
        child: ConcordLoadingProvider(
          loadingBuilder: loadingBuilder,
          child: child,
        ),
      ),
    );
  }
}
