import 'package:flutter/material.dart';
import 'package:tokens/tokens.dart';

import 'concord_button_wireframe.dart';
import 'concord_theme.dart';

enum ConcordIconButtonStyle {
  primary,
  secondary,
  tertiary,
}

class ConcordIconButton extends StatelessWidget {
  final IconData icon;
  final ConcordIconButtonStyle style;
  final bool loading;
  final VoidCallback onTap;

  const ConcordIconButton({
    Key? key,
    required this.icon,
    this.style = ConcordIconButtonStyle.tertiary,
    this.loading = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ConcordTheme.of(context);
    final content = Icon(icon, color: style.tintColor(theme));
    const height = 36.0;
    const width = 36.0;

    return ConcordButtonWireframe(
      content: content,
      color: style.backgroundColor(theme),
      loading: loading,
      onTap: onTap,
      height: height,
      width: width,
    );
  }
}

extension on ConcordIconButtonStyle {
  Color backgroundColor(ConcordTokens theme) {
    switch (this) {
      case ConcordIconButtonStyle.primary:
        return theme.colors.primaryAction;
      case ConcordIconButtonStyle.secondary:
        return theme.colors.secondaryAction;
      case ConcordIconButtonStyle.tertiary:
        return theme.colors.tertiaryAction;
    }
  }

  Color tintColor(ConcordTokens theme) {
    switch (this) {
      case ConcordIconButtonStyle.primary:
        return theme.colors.primaryText;
      case ConcordIconButtonStyle.secondary:
        return theme.colors.secondaryText;
      case ConcordIconButtonStyle.tertiary:
        return theme.colors.tertiaryText;
    }
  }
}
