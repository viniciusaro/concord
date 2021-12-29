import 'package:flutter/material.dart';
import 'package:token_library/src/colors.dart';
import 'package:token_library/token_library.dart';

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
  secondaryText: const Color(0xffee6a6e),
  secondaryAction: const Color(0xfff6b362),
  tertiary: const Color(0xff8fb28b),
  tertiaryAction: const Color(0xffffffff),
);
