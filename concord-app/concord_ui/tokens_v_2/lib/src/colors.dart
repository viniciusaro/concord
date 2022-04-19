import 'package:flutter/material.dart';
import 'package:serialization/serialization.dart';

part 'colors.freezed.dart';

@freezed
class ConcordColors with _$ConcordColors {
  factory ConcordColors({
    required Color primaryV2,
    required Color primaryTextV2,
    required Color primaryActionV2,
    required Color primaryBackgroundV2,
    required Color secondaryV2,
    required Color secondaryTextV2,
    required Color secondaryActionV2,
    required Color secondaryBackgroundV2,
    required Color tertiaryV2,
    required Color tertiaryTextV2,
    required Color tertiaryActionV2,
    required Color tertiaryBackgroundV2,
  }) = _ConcordColors;
}
