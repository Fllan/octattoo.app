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
  String get id => throw _privateConstructorUsedError;
  DocumentReference<Object?> get userRef => throw _privateConstructorUsedError;
  String get artistName => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  String get pronoun => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
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
  $Res call(
      {String id,
      DocumentReference<Object?> userRef,
      String artistName,
      String firstname,
      String lastname,
      String pronoun,
      DateTime updatedAt,
      DateTime createdAt});
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
    Object? id = null,
    Object? userRef = null,
    Object? artistName = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? pronoun = null,
    Object? updatedAt = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userRef: null == userRef
          ? _value.userRef
          : userRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      pronoun: null == pronoun
          ? _value.pronoun
          : pronoun // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
  $Res call(
      {String id,
      DocumentReference<Object?> userRef,
      String artistName,
      String firstname,
      String lastname,
      String pronoun,
      DateTime updatedAt,
      DateTime createdAt});
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
    Object? id = null,
    Object? userRef = null,
    Object? artistName = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? pronoun = null,
    Object? updatedAt = null,
    Object? createdAt = null,
  }) {
    return _then(_$TattooArtistImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userRef: null == userRef
          ? _value.userRef
          : userRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      pronoun: null == pronoun
          ? _value.pronoun
          : pronoun // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
  _$TattooArtistImpl(
      {required this.id,
      required this.userRef,
      required this.artistName,
      required this.firstname,
      required this.lastname,
      required this.pronoun,
      required this.updatedAt,
      required this.createdAt});

  factory _$TattooArtistImpl.fromJson(Map<String, dynamic> json) =>
      _$$TattooArtistImplFromJson(json);

  @override
  final String id;
  @override
  final DocumentReference<Object?> userRef;
  @override
  final String artistName;
  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String pronoun;
  @override
  final DateTime updatedAt;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'TattooArtist(id: $id, userRef: $userRef, artistName: $artistName, firstname: $firstname, lastname: $lastname, pronoun: $pronoun, updatedAt: $updatedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TattooArtistImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userRef, userRef) || other.userRef == userRef) &&
            (identical(other.artistName, artistName) ||
                other.artistName == artistName) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.pronoun, pronoun) || other.pronoun == pronoun) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userRef, artistName,
      firstname, lastname, pronoun, updatedAt, createdAt);

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
      {required final String id,
      required final DocumentReference<Object?> userRef,
      required final String artistName,
      required final String firstname,
      required final String lastname,
      required final String pronoun,
      required final DateTime updatedAt,
      required final DateTime createdAt}) = _$TattooArtistImpl;

  factory _TattooArtist.fromJson(Map<String, dynamic> json) =
      _$TattooArtistImpl.fromJson;

  @override
  String get id;
  @override
  DocumentReference<Object?> get userRef;
  @override
  String get artistName;
  @override
  String get firstname;
  @override
  String get lastname;
  @override
  String get pronoun;
  @override
  DateTime get updatedAt;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$TattooArtistImplCopyWith<_$TattooArtistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
