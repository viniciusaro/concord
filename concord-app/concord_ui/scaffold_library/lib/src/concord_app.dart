import 'package:flutter/material.dart';
import 'package:scaffold_library/src/concord_loading_provider.dart';
import 'package:scaffold_library/src/concord_theme.dart';
import 'package:token_library/token_library.dart';

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
    final loadingSetup = ConcordLoadingProvider(
      child: child,
      loadingBuilder: loadingBuilder,
    );

    return MaterialApp(
      home: ConcordTheme(
        tokens: theme,
        child: loadingSetup,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
