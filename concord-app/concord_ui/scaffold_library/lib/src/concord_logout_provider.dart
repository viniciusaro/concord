import 'package:flutter/material.dart';

typedef LogoutCallback = void Function(BuildContext context);

class ConcordLogoutProvider extends StatelessWidget {
  final Widget child;
  final LogoutCallback onLogoutButtonTapped;

  const ConcordLogoutProvider({
    Key? key,
    required this.child,
    required this.onLogoutButtonTapped,
  }) : super(key: key);

  static ConcordLogoutProvider? of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<ConcordLogoutProvider>();
  }

  @override
  Widget build(BuildContext context) => child;
}
