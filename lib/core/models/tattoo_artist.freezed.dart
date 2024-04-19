// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tattoo_artist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TattooArtist _$TattooArtistFromJson(Map<String, dynamic> json) {
  return _TattooArtist.fromJson(json);
}

/// @nodoc
mixin _$TattooArtist {
  DocumentReference<Object?> get userRef => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TattooArtistCopyWith<TattooArtist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TattooArtistCopyWith<$Res> {
  factory $TattooArtistCopyWith(
          TattooArtist value, $Res Function(TattooArtist) then) =
      _$TattooArtistCopyWithImpl<$Res, TattooArtist>;
  @useResult
  $Res call({DocumentReference<Object?> userRef, DateTime createdAt});
}

/// @nodoc
class _$TattooArtistCopyWithImpl<$Res, $Val extends TattooArtist>
    implements $TattooArtistCopyWith<$Res> {
  _$TattooArtistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRef = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      userRef: null == userRef
          ? _value.userRef
          : userRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TattooArtistImplCopyWith<$Res>
    implements $TattooArtistCopyWith<$Res> {
  factory _$$TattooArtistImplCopyWith(
          _$TattooArtistImpl value, $Res Function(_$TattooArtistImpl) then) =
      __$$TattooArtistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DocumentReference<Object?> userRef, DateTime createdAt});
}

/// @nodoc
class __$$TattooArtistImplCopyWithImpl<$Res>
    extends _$TattooArtistCopyWithImpl<$Res, _$TattooArtistImpl>
    implements _$$TattooArtistImplCopyWith<$Res> {
  __$$TattooArtistImplCopyWithImpl(
      _$TattooArtistImpl _value, $Res Function(_$TattooArtistImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRef = null,
    Object? createdAt = null,
  }) {
    return _then(_$TattooArtistImpl(
      userRef: null == userRef
          ? _value.userRef
          : userRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@DocumentReferenceConverter()
class _$TattooArtistImpl implements _TattooArtist {
  _$TattooArtistImpl({required this.userRef, required this.createdAt});

  factory _$TattooArtistImpl.fromJson(Map<String, dynamic> json) =>
      _$$TattooArtistImplFromJson(json);

  @override
  final DocumentReference<Object?> userRef;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'TattooArtist(userRef: $userRef, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TattooArtistImpl &&
            (identical(other.userRef, userRef) || other.userRef == userRef) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userRef, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TattooArtistImplCopyWith<_$TattooArtistImpl> get copyWith =>
      __$$TattooArtistImplCopyWithImpl<_$TattooArtistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TattooArtistImplToJson(
      this,
    );
  }
}

abstract class _TattooArtist implements TattooArtist {
  factory _TattooArtist(
      {required final DocumentReference<Object?> userRef,
      required final DateTime createdAt}) = _$TattooArtistImpl;

  factory _TattooArtist.fromJson(Map<String, dynamic> json) =
      _$TattooArtistImpl.fromJson;

  @override
  DocumentReference<Object?> get userRef;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$TattooArtistImplCopyWith<_$TattooArtistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
