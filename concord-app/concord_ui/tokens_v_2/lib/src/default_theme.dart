import 'package:flutter/material.dart';

import 'colors.dart';
import 'tokens.dart';

final defaultConcordThemeV2 = ConcordTokens(
  colors,
  grid,
);

const grid = 8;

final colors = ConcordColors(
  primaryV2: const Color(0xff6699cc),
  primaryTextV2: const Color(0xffffffff),
  primaryActionV2: const Color(0xff6699cc),
  primaryBackgroundV2: const Color(0xff3a3a3a),
  secondaryV2: const Color(0xff282828),
  secondaryTextV2: const Color(0xffffffff),
  secondaryActionV2: const Color(0xfff6b362),
  secondaryBackgroundV2: const Color(0xff8fb28b),
  tertiaryV2: const Color(0xff8fb28b),
  tertiaryTextV2: const Color(0xffee6a6e),
  tertiaryActionV2: const Color(0xff3a3a3a),
  tertiaryBackgroundV2: const Color(0xfff6b362),
);
