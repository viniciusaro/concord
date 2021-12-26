import 'package:{{ $org }}_foundation/{{ $org }}_foundation.dart';

part '{{ snakeCase name }}.freezed.dart';

@freezed
class {{ pascalCase name }}State with _${{ pascalCase name }}State {
  factory {{ pascalCase name }}State({
    @Default(false) bool loading,
    required Object error,
  }) = _{{ pascalCase name }}State;
}
