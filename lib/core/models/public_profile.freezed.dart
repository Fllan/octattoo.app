// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'public_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PublicProfile _$PublicProfileFromJson(Map<String, dynamic> json) {
  return _PublicProfile.fromJson(json);
}

/// @nodoc
mixin _$PublicProfile {
  String get uid => throw _privateConstructorUsedError;
  String get artistName => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  String get pronoun => throw _privateConstructorUsedError;
  DocumentReference<Object?> get tattooArtistRef =>
      throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicProfileCopyWith<PublicProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicProfileCopyWith<$Res> {
  factory $PublicProfileCopyWith(
          PublicProfile value, $Res Function(PublicProfile) then) =
      _$PublicProfileCopyWithImpl<$Res, PublicProfile>;
  @useResult
  $Res call(
      {String uid,
      String artistName,
      String firstname,
      String lastname,
      String pronoun,
      DocumentReference<Object?> tattooArtistRef,
      DateTime createdAt});
}

/// @nodoc
class _$PublicProfileCopyWithImpl<$Res, $Val extends PublicProfile>
    implements $PublicProfileCopyWith<$Res> {
  _$PublicProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? artistName = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? pronoun = null,
    Object? tattooArtistRef = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
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
      tattooArtistRef: null == tattooArtistRef
          ? _value.tattooArtistRef
          : tattooArtistRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PublicProfileImplCopyWith<$Res>
    implements $PublicProfileCopyWith<$Res> {
  factory _$$PublicProfileImplCopyWith(
          _$PublicProfileImpl value, $Res Function(_$PublicProfileImpl) then) =
      __$$PublicProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String artistName,
      String firstname,
      String lastname,
      String pronoun,
      DocumentReference<Object?> tattooArtistRef,
      DateTime createdAt});
}

/// @nodoc
class __$$PublicProfileImplCopyWithImpl<$Res>
    extends _$PublicProfileCopyWithImpl<$Res, _$PublicProfileImpl>
    implements _$$PublicProfileImplCopyWith<$Res> {
  __$$PublicProfileImplCopyWithImpl(
      _$PublicProfileImpl _value, $Res Function(_$PublicProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? artistName = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? pronoun = null,
    Object? tattooArtistRef = null,
    Object? createdAt = null,
  }) {
    return _then(_$PublicProfileImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
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
      tattooArtistRef: null == tattooArtistRef
          ? _value.tattooArtistRef
          : tattooArtistRef // ignore: cast_nullable_to_non_nullable
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
class _$PublicProfileImpl implements _PublicProfile {
  _$PublicProfileImpl(
      {required this.uid,
      required this.artistName,
      required this.firstname,
      required this.lastname,
      required this.pronoun,
      required this.tattooArtistRef,
      required this.createdAt});

  factory _$PublicProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicProfileImplFromJson(json);

  @override
  final String uid;
  @override
  final String artistName;
  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String pronoun;
  @override
  final DocumentReference<Object?> tattooArtistRef;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'PublicProfile(uid: $uid, artistName: $artistName, firstname: $firstname, lastname: $lastname, pronoun: $pronoun, tattooArtistRef: $tattooArtistRef, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicProfileImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.artistName, artistName) ||
                other.artistName == artistName) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.pronoun, pronoun) || other.pronoun == pronoun) &&
            (identical(other.tattooArtistRef, tattooArtistRef) ||
                other.tattooArtistRef == tattooArtistRef) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, artistName, firstname,
      lastname, pronoun, tattooArtistRef, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicProfileImplCopyWith<_$PublicProfileImpl> get copyWith =>
      __$$PublicProfileImplCopyWithImpl<_$PublicProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicProfileImplToJson(
      this,
    );
  }
}

abstract class _PublicProfile implements PublicProfile {
  factory _PublicProfile(
      {required final String uid,
      required final String artistName,
      required final String firstname,
      required final String lastname,
      required final String pronoun,
      required final DocumentReference<Object?> tattooArtistRef,
      required final DateTime createdAt}) = _$PublicProfileImpl;

  factory _PublicProfile.fromJson(Map<String, dynamic> json) =
      _$PublicProfileImpl.fromJson;

  @override
  String get uid;
  @override
  String get artistName;
  @override
  String get firstname;
  @override
  String get lastname;
  @override
  String get pronoun;
  @override
  DocumentReference<Object?> get tattooArtistRef;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$PublicProfileImplCopyWith<_$PublicProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}