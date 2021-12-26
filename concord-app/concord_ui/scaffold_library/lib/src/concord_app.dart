import 'package:flutter/material.dart';
import 'package:scaffold_library/src/concord_theme.dart';
import 'package:token_library/token_library.dart';

class ConcordApp extends StatelessWidget {
  final Widget child;
  final ConcordTokens theme;

  const ConcordApp({
    Key? key,
    required this.theme,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConcordTheme(
        tokens: theme,
        child: child,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
