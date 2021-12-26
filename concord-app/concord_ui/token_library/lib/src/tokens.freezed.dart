// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tokens.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ConcordTokensTearOff {
  const _$ConcordTokensTearOff();

  _ConcordTokens call(ConcordColors colors) {
    return _ConcordTokens(
      colors,
    );
  }
}

/// @nodoc
const $ConcordTokens = _$ConcordTokensTearOff();

/// @nodoc
mixin _$ConcordTokens {
  ConcordColors get colors => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConcordTokensCopyWith<ConcordTokens> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConcordTokensCopyWith<$Res> {
  factory $ConcordTokensCopyWith(
          ConcordTokens value, $Res Function(ConcordTokens) then) =
      _$ConcordTokensCopyWithImpl<$Res>;
  $Res call({ConcordColors colors});

  $ConcordColorsCopyWith<$Res> get colors;
}

/// @nodoc
class _$ConcordTokensCopyWithImpl<$Res>
    implements $ConcordTokensCopyWith<$Res> {
  _$ConcordTokensCopyWithImpl(this._value, this._then);

  final ConcordTokens _value;
  // ignore: unused_field
  final $Res Function(ConcordTokens) _then;

  @override
  $Res call({
    Object? colors = freezed,
  }) {
    return _then(_value.copyWith(
      colors: colors == freezed
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as ConcordColors,
    ));
  }

  @override
  $ConcordColorsCopyWith<$Res> get colors {
    return $ConcordColorsCopyWith<$Res>(_value.colors, (value) {
      return _then(_value.copyWith(colors: value));
    });
  }
}

/// @nodoc
abstract class _$ConcordTokensCopyWith<$Res>
    implements $ConcordTokensCopyWith<$Res> {
  factory _$ConcordTokensCopyWith(
          _ConcordTokens value, $Res Function(_ConcordTokens) then) =
      __$ConcordTokensCopyWithImpl<$Res>;
  @override
  $Res call({ConcordColors colors});

  @override
  $ConcordColorsCopyWith<$Res> get colors;
}

/// @nodoc
class __$ConcordTokensCopyWithImpl<$Res>
    extends _$ConcordTokensCopyWithImpl<$Res>
    implements _$ConcordTokensCopyWith<$Res> {
  __$ConcordTokensCopyWithImpl(
      _ConcordTokens _value, $Res Function(_ConcordTokens) _then)
      : super(_value, (v) => _then(v as _ConcordTokens));

  @override
  _ConcordTokens get _value => super._value as _ConcordTokens;

  @override
  $Res call({
    Object? colors = freezed,
  }) {
    return _then(_ConcordTokens(
      colors == freezed
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as ConcordColors,
    ));
  }
}

/// @nodoc

class _$_ConcordTokens with DiagnosticableTreeMixin implements _ConcordTokens {
  _$_ConcordTokens(this.colors);

  @override
  final ConcordColors colors;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConcordTokens(colors: $colors)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConcordTokens'))
      ..add(DiagnosticsProperty('colors', colors));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConcordTokens &&
            const DeepCollectionEquality().equals(other.colors, colors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(colors));

  @JsonKey(ignore: true)
  @override
  _$ConcordTokensCopyWith<_ConcordTokens> get copyWith =>
      __$ConcordTokensCopyWithImpl<_ConcordTokens>(this, _$identity);
}

abstract class _ConcordTokens implements ConcordTokens {
  factory _ConcordTokens(ConcordColors colors) = _$_ConcordTokens;

  @override
  ConcordColors get colors;
  @override
  @JsonKey(ignore: true)
  _$ConcordTokensCopyWith<_ConcordTokens> get copyWith =>
      throw _privateConstructorUsedError;
}
