import 'package:flutter/material.dart';
import 'package:serialization/serialization.dart';

part 'colors.freezed.dart';

@freezed
class ConcordColors with _$ConcordColors {
  factory ConcordColors({
    required Color primary,
    required Color primaryText,
    required Color primaryAction,
    required Color primaryBackground,
    required Color secondary,
    required Color secondaryText,
    required Color secondaryAction,
    required Color secondaryBackground,
    required Color tertiary,
    required Color tertiaryText,
    required Color tertiaryAction,
    required Color tertiaryBackground,
  }) = _ConcordColors;
}
