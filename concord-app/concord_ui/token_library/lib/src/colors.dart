import 'package:flutter/material.dart';
import 'package:serialization/serialization.dart';

part 'colors.freezed.dart';

@freezed
class ConcordColors with _$ConcordColors {
  factory ConcordColors({
    required Color primary,
    required Color secondary,
    required Color tertiary,
  }) = _ConcordColors;
}
