import 'package:serialization/serialization.dart';

import 'colors.dart';

part 'tokens.freezed.dart';

@freezed
class ConcordTokens with _$ConcordTokens {
  factory ConcordTokens(ConcordColors colors) = _ConcordTokens;
}
