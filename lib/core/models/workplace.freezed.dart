// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workplace.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Workplace _$WorkplaceFromJson(Map<String, dynamic> json) {
  return _Workplace.fromJson(json);
}

/// @nodoc
mixin _$Workplace {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DocumentReference<Object?> get createdBy =>
      throw _privateConstructorUsedError;
  List<TattooArtist> get permanentTattooArtists =>
      throw _privateConstructorUsedError;
  List<TattooArtist> get guestTattooArtists =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkplaceCopyWith<Workplace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkplaceCopyWith<$Res> {
  factory $WorkplaceCopyWith(Workplace value, $Res Function(Workplace) then) =
      _$WorkplaceCopyWithImpl<$Res, Workplace>;
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime updatedAt,
      DateTime createdAt,
      DocumentReference<Object?> createdBy,
      List<TattooArtist> permanentTattooArtists,
      List<TattooArtist> guestTattooArtists});
}

/// @nodoc
class _$WorkplaceCopyWithImpl<$Res, $Val extends Workplace>
    implements $WorkplaceCopyWith<$Res> {
  _$WorkplaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? updatedAt = null,
    Object? createdAt = null,
    Object? createdBy = null,
    Object? permanentTattooArtists = null,
    Object? guestTattooArtists = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      permanentTattooArtists: null == permanentTattooArtists
          ? _value.permanentTattooArtists
          : permanentTattooArtists // ignore: cast_nullable_to_non_nullable
              as List<TattooArtist>,
      guestTattooArtists: null == guestTattooArtists
          ? _value.guestTattooArtists
          : guestTattooArtists // ignore: cast_nullable_to_non_nullable
              as List<TattooArtist>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkplaceImplCopyWith<$Res>
    implements $WorkplaceCopyWith<$Res> {
  factory _$$WorkplaceImplCopyWith(
          _$WorkplaceImpl value, $Res Function(_$WorkplaceImpl) then) =
      __$$WorkplaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime updatedAt,
      DateTime createdAt,
      DocumentReference<Object?> createdBy,
      List<TattooArtist> permanentTattooArtists,
      List<TattooArtist> guestTattooArtists});
}

/// @nodoc
class __$$WorkplaceImplCopyWithImpl<$Res>
    extends _$WorkplaceCopyWithImpl<$Res, _$WorkplaceImpl>
    implements _$$WorkplaceImplCopyWith<$Res> {
  __$$WorkplaceImplCopyWithImpl(
      _$WorkplaceImpl _value, $Res Function(_$WorkplaceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? updatedAt = null,
    Object? createdAt = null,
    Object? createdBy = null,
    Object? permanentTattooArtists = null,
    Object? guestTattooArtists = null,
  }) {
    return _then(_$WorkplaceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      permanentTattooArtists: null == permanentTattooArtists
          ? _value._permanentTattooArtists
          : permanentTattooArtists // ignore: cast_nullable_to_non_nullable
              as List<TattooArtist>,
      guestTattooArtists: null == guestTattooArtists
          ? _value._guestTattooArtists
          : guestTattooArtists // ignore: cast_nullable_to_non_nullable
              as List<TattooArtist>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@DocumentReferenceConverter()
class _$WorkplaceImpl implements _Workplace {
  _$WorkplaceImpl(
      {required this.id,
      required this.name,
      required this.updatedAt,
      required this.createdAt,
      required this.createdBy,
      required final List<TattooArtist> permanentTattooArtists,
      required final List<TattooArtist> guestTattooArtists})
      : _permanentTattooArtists = permanentTattooArtists,
        _guestTattooArtists = guestTattooArtists;

  factory _$WorkplaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkplaceImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime updatedAt;
  @override
  final DateTime createdAt;
  @override
  final DocumentReference<Object?> createdBy;
  final List<TattooArtist> _permanentTattooArtists;
  @override
  List<TattooArtist> get permanentTattooArtists {
    if (_permanentTattooArtists is EqualUnmodifiableListView)
      return _permanentTattooArtists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permanentTattooArtists);
  }

  final List<TattooArtist> _guestTattooArtists;
  @override
  List<TattooArtist> get guestTattooArtists {
    if (_guestTattooArtists is EqualUnmodifiableListView)
      return _guestTattooArtists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guestTattooArtists);
  }

  @override
  String toString() {
    return 'Workplace(id: $id, name: $name, updatedAt: $updatedAt, createdAt: $createdAt, createdBy: $createdBy, permanentTattooArtists: $permanentTattooArtists, guestTattooArtists: $guestTattooArtists)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkplaceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            const DeepCollectionEquality().equals(
                other._permanentTattooArtists, _permanentTattooArtists) &&
            const DeepCollectionEquality()
                .equals(other._guestTattooArtists, _guestTattooArtists));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      updatedAt,
      createdAt,
      createdBy,
      const DeepCollectionEquality().hash(_permanentTattooArtists),
      const DeepCollectionEquality().hash(_guestTattooArtists));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkplaceImplCopyWith<_$WorkplaceImpl> get copyWith =>
      __$$WorkplaceImplCopyWithImpl<_$WorkplaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkplaceImplToJson(
      this,
    );
  }
}

abstract class _Workplace implements Workplace {
  factory _Workplace(
      {required final String id,
      required final String name,
      required final DateTime updatedAt,
      required final DateTime createdAt,
      required final DocumentReference<Object?> createdBy,
      required final List<TattooArtist> permanentTattooArtists,
      required final List<TattooArtist> guestTattooArtists}) = _$WorkplaceImpl;

  factory _Workplace.fromJson(Map<String, dynamic> json) =
      _$WorkplaceImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get updatedAt;
  @override
  DateTime get createdAt;
  @override
  DocumentReference<Object?> get createdBy;
  @override
  List<TattooArtist> get permanentTattooArtists;
  @override
  List<TattooArtist> get guestTattooArtists;
  @override
  @JsonKey(ignore: true)
  _$$WorkplaceImplCopyWith<_$WorkplaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
