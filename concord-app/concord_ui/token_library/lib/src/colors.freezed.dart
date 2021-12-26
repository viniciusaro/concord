// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'colors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ConcordColorsTearOff {
  const _$ConcordColorsTearOff();

  _ConcordColors call(
      {required Color primary,
      required Color secondary,
      required Color tertiary}) {
    return _ConcordColors(
      primary: primary,
      secondary: secondary,
      tertiary: tertiary,
    );
  }
}

/// @nodoc
const $ConcordColors = _$ConcordColorsTearOff();

/// @nodoc
mixin _$ConcordColors {
  Color get primary => throw _privateConstructorUsedError;
  Color get secondary => throw _privateConstructorUsedError;
  Color get tertiary => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConcordColorsCopyWith<ConcordColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConcordColorsCopyWith<$Res> {
  factory $ConcordColorsCopyWith(
          ConcordColors value, $Res Function(ConcordColors) then) =
      _$ConcordColorsCopyWithImpl<$Res>;
  $Res call({Color primary, Color secondary, Color tertiary});
}

/// @nodoc
class _$ConcordColorsCopyWithImpl<$Res>
    implements $ConcordColorsCopyWith<$Res> {
  _$ConcordColorsCopyWithImpl(this._value, this._then);

  final ConcordColors _value;
  // ignore: unused_field
  final $Res Function(ConcordColors) _then;

  @override
  $Res call({
    Object? primary = freezed,
    Object? secondary = freezed,
    Object? tertiary = freezed,
  }) {
    return _then(_value.copyWith(
      primary: primary == freezed
          ? _value.primary
          : primary // ignore: cast_nullable_to_non_nullable
              as Color,
      secondary: secondary == freezed
          ? _value.secondary
          : secondary // ignore: cast_nullable_to_non_nullable
              as Color,
      tertiary: tertiary == freezed
          ? _value.tertiary
          : tertiary // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
abstract class _$ConcordColorsCopyWith<$Res>
    implements $ConcordColorsCopyWith<$Res> {
  factory _$ConcordColorsCopyWith(
          _ConcordColors value, $Res Function(_ConcordColors) then) =
      __$ConcordColorsCopyWithImpl<$Res>;
  @override
  $Res call({Color primary, Color secondary, Color tertiary});
}

/// @nodoc
class __$ConcordColorsCopyWithImpl<$Res>
    extends _$ConcordColorsCopyWithImpl<$Res>
    implements _$ConcordColorsCopyWith<$Res> {
  __$ConcordColorsCopyWithImpl(
      _ConcordColors _value, $Res Function(_ConcordColors) _then)
      : super(_value, (v) => _then(v as _ConcordColors));

  @override
  _ConcordColors get _value => super._value as _ConcordColors;

  @override
  $Res call({
    Object? primary = freezed,
    Object? secondary = freezed,
    Object? tertiary = freezed,
  }) {
    return _then(_ConcordColors(
      primary: primary == freezed
          ? _value.primary
          : primary // ignore: cast_nullable_to_non_nullable
              as Color,
      secondary: secondary == freezed
          ? _value.secondary
          : secondary // ignore: cast_nullable_to_non_nullable
              as Color,
      tertiary: tertiary == freezed
          ? _value.tertiary
          : tertiary // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$_ConcordColors with DiagnosticableTreeMixin implements _ConcordColors {
  _$_ConcordColors(
      {required this.primary, required this.secondary, required this.tertiary});

  @override
  final Color primary;
  @override
  final Color secondary;
  @override
  final Color tertiary;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConcordColors(primary: $primary, secondary: $secondary, tertiary: $tertiary)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConcordColors'))
      ..add(DiagnosticsProperty('primary', primary))
      ..add(DiagnosticsProperty('secondary', secondary))
      ..add(DiagnosticsProperty('tertiary', tertiary));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConcordColors &&
            const DeepCollectionEquality().equals(other.primary, primary) &&
            const DeepCollectionEquality().equals(other.secondary, secondary) &&
            const DeepCollectionEquality().equals(other.tertiary, tertiary));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(primary),
      const DeepCollectionEquality().hash(secondary),
      const DeepCollectionEquality().hash(tertiary));

  @JsonKey(ignore: true)
  @override
  _$ConcordColorsCopyWith<_ConcordColors> get copyWith =>
      __$ConcordColorsCopyWithImpl<_ConcordColors>(this, _$identity);
}

abstract class _ConcordColors implements ConcordColors {
  factory _ConcordColors(
      {required Color primary,
      required Color secondary,
      required Color tertiary}) = _$_ConcordColors;

  @override
  Color get primary;
  @override
  Color get secondary;
  @override
  Color get tertiary;
  @override
  @JsonKey(ignore: true)
  _$ConcordColorsCopyWith<_ConcordColors> get copyWith =>
      throw _privateConstructorUsedError;
}
