// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'id_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IdToken _$IdTokenFromJson(Map<String, dynamic> json) {
  return _IdToken.fromJson(json);
}

/// @nodoc
mixin _$IdToken {
  String get idToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdTokenCopyWith<IdToken> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdTokenCopyWith<$Res> {
  factory $IdTokenCopyWith(IdToken value, $Res Function(IdToken) then) =
      _$IdTokenCopyWithImpl<$Res>;
  $Res call({String idToken});
}

/// @nodoc
class _$IdTokenCopyWithImpl<$Res> implements $IdTokenCopyWith<$Res> {
  _$IdTokenCopyWithImpl(this._value, this._then);

  final IdToken _value;
  // ignore: unused_field
  final $Res Function(IdToken) _then;

  @override
  $Res call({
    Object? idToken = freezed,
  }) {
    return _then(_value.copyWith(
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_IdTokenCopyWith<$Res> implements $IdTokenCopyWith<$Res> {
  factory _$$_IdTokenCopyWith(
          _$_IdToken value, $Res Function(_$_IdToken) then) =
      __$$_IdTokenCopyWithImpl<$Res>;
  @override
  $Res call({String idToken});
}

/// @nodoc
class __$$_IdTokenCopyWithImpl<$Res> extends _$IdTokenCopyWithImpl<$Res>
    implements _$$_IdTokenCopyWith<$Res> {
  __$$_IdTokenCopyWithImpl(_$_IdToken _value, $Res Function(_$_IdToken) _then)
      : super(_value, (v) => _then(v as _$_IdToken));

  @override
  _$_IdToken get _value => super._value as _$_IdToken;

  @override
  $Res call({
    Object? idToken = freezed,
  }) {
    return _then(_$_IdToken(
      idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IdToken with DiagnosticableTreeMixin implements _IdToken {
  const _$_IdToken(this.idToken);

  factory _$_IdToken.fromJson(Map<String, dynamic> json) =>
      _$$_IdTokenFromJson(json);

  @override
  final String idToken;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IdToken(idToken: $idToken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IdToken'))
      ..add(DiagnosticsProperty('idToken', idToken));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IdToken &&
            const DeepCollectionEquality().equals(other.idToken, idToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(idToken));

  @JsonKey(ignore: true)
  @override
  _$$_IdTokenCopyWith<_$_IdToken> get copyWith =>
      __$$_IdTokenCopyWithImpl<_$_IdToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IdTokenToJson(this);
  }
}

abstract class _IdToken implements IdToken {
  const factory _IdToken(final String idToken) = _$_IdToken;

  factory _IdToken.fromJson(Map<String, dynamic> json) = _$_IdToken.fromJson;

  @override
  String get idToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_IdTokenCopyWith<_$_IdToken> get copyWith =>
      throw _privateConstructorUsedError;
}
