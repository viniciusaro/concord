import 'package:flutter/material.dart';

typedef LogoutCallback = void Function(BuildContext context);

class ConcordLogoutProvider extends InheritedWidget {
  final LogoutCallback onLogoutButtonTapped;

  const ConcordLogoutProvider({
    Key? key,
    required Widget child,
    required this.onLogoutButtonTapped,
  }) : super(key: key, child: child);

  static ConcordLogoutProvider? of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<ConcordLogoutProvider>();
  }

  @override
  bool updateShouldNotify(covariant ConcordLogoutProvider oldWidget) {
    return onLogoutButtonTapped != oldWidget.onLogoutButtonTapped;
  }
}
