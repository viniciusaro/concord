import 'package:flutter/material.dart';

import 'colors.dart';
import 'tokens.dart';

final defaultConcordTheme = ConcordTokens(
  colors,
  grid,
);

const grid = 8;

final colors = ConcordColors(
  primary: const Color(0xff6699cc),
  primaryText: const Color(0xffffffff),
  primaryAction: const Color(0xff6699cc),
  primaryBackground: const Color(0xff3a3a3a),
  secondary: const Color(0xff282828),
  secondaryText: const Color(0xffffffff),
  secondaryAction: const Color(0xfff6b362),
  secondaryBackground: const Color(0xff8fb28b),
  tertiary: const Color(0xff8fb28b),
  tertiaryText: const Color(0xffee6a6e),
  tertiaryAction: const Color(0xff3a3a3a),
  tertiaryBackground: const Color(0xfff6b362),
);
