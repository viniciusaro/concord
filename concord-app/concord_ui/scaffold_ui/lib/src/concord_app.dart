import 'package:flutter/material.dart';
import 'package:di/di.dart';

class ConcordApp extends StatefulWidget {
  final AggregateRegister register;
  final Widget child;

  const ConcordApp({
    Key? key,
    required this.register,
    required this.child,
  }) : super(key: key);

  @override
  _ConcordAppState createState() => _ConcordAppState();
}

class _ConcordAppState extends State<ConcordApp> {
  @override
  void initState() {
    super.initState();
    widget.register.register();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: widget.child);
  }
}
