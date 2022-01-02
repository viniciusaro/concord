import 'package:flutter/material.dart';

class ConcordLoadingProvider extends StatelessWidget {
  final Widget child;
  final WidgetBuilder loadingBuilder;

  const ConcordLoadingProvider({
    Key? key,
    required this.child,
    required this.loadingBuilder,
  }) : super(key: key);

  static ConcordLoadingProvider of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<ConcordLoadingProvider>()!;
  }

  @override
  Widget build(BuildContext context) => child;
}
