import 'package:flutter/material.dart';

class ConcordLoadingProvider extends InheritedWidget {
  final WidgetBuilder loadingBuilder;

  const ConcordLoadingProvider({
    Key? key,
    required Widget child,
    required this.loadingBuilder,
  }) : super(key: key, child: child);

  static ConcordLoadingProvider of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ConcordLoadingProvider>()!;
  }

  @override
  bool updateShouldNotify(covariant ConcordLoadingProvider oldWidget) {
    return loadingBuilder != oldWidget.loadingBuilder;
  }
}
