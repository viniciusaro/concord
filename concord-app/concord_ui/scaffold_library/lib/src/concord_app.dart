import 'package:flutter/material.dart';

class ConcordApp extends StatelessWidget {
  final Widget child;

  const ConcordApp({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: child);
  }
}
