import 'package:flutter/material.dart';
import 'package:tokens/tokens.dart';

import 'concord_button_wireframe.dart';
import 'concord_text.dart';
import 'concord_theme.dart';

enum ConcordActionButtomStyle {
  primary,
  secondary,
}

class ConcordActionButton extends StatelessWidget {
  final String title;
  final ConcordActionButtomStyle style;
  final bool loading;
  final VoidCallback onTap;

  const ConcordActionButton({
    Key? key,
    required this.title,
    this.style = ConcordActionButtomStyle.primary,
    this.loading = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ConcordTheme.of(context);
    const height = 50.0;

    final content = ConcordText(
      text: title,
      color: theme.colors.primaryText,
    );

    return ConcordButtonWireframe(
      content: content,
      height: height,
      color: style.color(theme),
      loading: loading,
      onTap: onTap,
    );
  }
}

extension on ConcordActionButtomStyle {
  Color color(ConcordTokens theme) {
    switch (this) {
      case ConcordActionButtomStyle.primary:
        return theme.colors.primaryAction;
      case ConcordActionButtomStyle.secondary:
        return theme.colors.secondaryAction;
    }
  }
}
