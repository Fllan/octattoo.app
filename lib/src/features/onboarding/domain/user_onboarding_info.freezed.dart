// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_onboarding_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserOnboardingInfo _$UserOnboardingInfoFromJson(Map<String, dynamic> json) {
  return _UserOnboardingInfo.fromJson(json);
}

/// @nodoc
mixin _$UserOnboardingInfo {
  String get artistName => throw _privateConstructorUsedError;
  String get pronoun => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserOnboardingInfoCopyWith<UserOnboardingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserOnboardingInfoCopyWith<$Res> {
  factory $UserOnboardingInfoCopyWith(
          UserOnboardingInfo value, $Res Function(UserOnboardingInfo) then) =
      _$UserOnboardingInfoCopyWithImpl<$Res, UserOnboardingInfo>;
  @useResult
  $Res call(
      {String artistName, String pronoun, String firstName, String lastName});
}

/// @nodoc
class _$UserOnboardingInfoCopyWithImpl<$Res, $Val extends UserOnboardingInfo>
    implements $UserOnboardingInfoCopyWith<$Res> {
  _$UserOnboardingInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artistName = null,
    Object? pronoun = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_value.copyWith(
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      pronoun: null == pronoun
          ? _value.pronoun
          : pronoun // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserOnboardingInfoImplCopyWith<$Res>
    implements $UserOnboardingInfoCopyWith<$Res> {
  factory _$$UserOnboardingInfoImplCopyWith(_$UserOnboardingInfoImpl value,
          $Res Function(_$UserOnboardingInfoImpl) then) =
      __$$UserOnboardingInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String artistName, String pronoun, String firstName, String lastName});
}

/// @nodoc
class __$$UserOnboardingInfoImplCopyWithImpl<$Res>
    extends _$UserOnboardingInfoCopyWithImpl<$Res, _$UserOnboardingInfoImpl>
    implements _$$UserOnboardingInfoImplCopyWith<$Res> {
  __$$UserOnboardingInfoImplCopyWithImpl(_$UserOnboardingInfoImpl _value,
      $Res Function(_$UserOnboardingInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artistName = null,
    Object? pronoun = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_$UserOnboardingInfoImpl(
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      pronoun: null == pronoun
          ? _value.pronoun
          : pronoun // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserOnboardingInfoImpl implements _UserOnboardingInfo {
  _$UserOnboardingInfoImpl(
      {this.artistName = '',
      this.pronoun = '',
      this.firstName = '',
      this.lastName = ''});

  factory _$UserOnboardingInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserOnboardingInfoImplFromJson(json);

  @override
  @JsonKey()
  final String artistName;
  @override
  @JsonKey()
  final String pronoun;
  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String lastName;

  @override
  String toString() {
    return 'UserOnboardingInfo(artistName: $artistName, pronoun: $pronoun, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserOnboardingInfoImpl &&
            (identical(other.artistName, artistName) ||
                other.artistName == artistName) &&
            (identical(other.pronoun, pronoun) || other.pronoun == pronoun) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, artistName, pronoun, firstName, lastName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserOnboardingInfoImplCopyWith<_$UserOnboardingInfoImpl> get copyWith =>
      __$$UserOnboardingInfoImplCopyWithImpl<_$UserOnboardingInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserOnboardingInfoImplToJson(
      this,
    );
  }
}

abstract class _UserOnboardingInfo implements UserOnboardingInfo {
  factory _UserOnboardingInfo(
      {final String artistName,
      final String pronoun,
      final String firstName,
      final String lastName}) = _$UserOnboardingInfoImpl;

  factory _UserOnboardingInfo.fromJson(Map<String, dynamic> json) =
      _$UserOnboardingInfoImpl.fromJson;

  @override
  String get artistName;
  @override
  String get pronoun;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  @JsonKey(ignore: true)
  _$$UserOnboardingInfoImplCopyWith<_$UserOnboardingInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
