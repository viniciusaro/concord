import 'package:{{ $org }}_core/{{ $org }}_core.dart';

part '{{ snakeCase name }}.freezed.dart';
part '{{ snakeCase name }}.g.dart';

@freezed
class {{ pascalCase name }} with _${{ pascalCase name }} {
  factory {{ pascalCase name }}(String id) = _{{ pascalCase name }};

  factory {{ pascalCase name }}.fromJson(Map<String, dynamic> json) =>
      _${{ pascalCase name }}FromJson(json);

  static {{ pascalCase name }} fromMap(Map<String, dynamic> json) =>
      _${{ pascalCase name }}FromJson(json);

  static Map<String, dynamic> toMap({{ pascalCase name }} instance) =>
      instance.toJson();
}
