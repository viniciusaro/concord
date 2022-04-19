import 'package:concord_ui/tokens.dart';
import 'package:flutter/material.dart';

class ConcordTheme extends InheritedTheme {
  final ConcordTokens tokens;

  const ConcordTheme({
    Key? key,
    required this.tokens,
    required Widget child,
  }) : super(key: key, child: child);

  static ConcordTokens of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<ConcordTheme>();
    return theme?.tokens ?? defaultConcordTheme;
  }

  @override
  bool updateShouldNotify(covariant ConcordTheme oldWidget) {
    return oldWidget.tokens != tokens;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ConcordTheme(tokens: tokens, child: child);
  }
}
