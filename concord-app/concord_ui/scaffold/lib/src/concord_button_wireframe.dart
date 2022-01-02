import 'package:flutter/material.dart';
import 'package:scaffold/src/concord_loading_provider.dart';

import 'concord_container.dart';
import 'concord_padding.dart';

class ConcordButtonWireframe extends StatelessWidget {
  final Widget content;
  final Color color;
  final bool loading;
  final VoidCallback onTap;
  final double height;
  final double? width;
  final bool enabled;

  const ConcordButtonWireframe({
    Key? key,
    required this.content,
    required this.color,
    required this.loading,
    required this.onTap,
    required this.height,
    this.width,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = loading
        ? ConcordLoadingProvider.of(context).loadingBuilder(context)
        : content;

    return SizedBox(
      height: height,
      width: width,
      child: ConcordContainer(
        child: Center(child: body),
        color: color,
        padding: ConcordPadding.p0,
        onTap: enabled ? onTap : null,
      ),
    );
  }
}
