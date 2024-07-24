// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  UserRoles get role => throw _privateConstructorUsedError;
  bool? get hasCompletedOnboarding => throw _privateConstructorUsedError;
  bool? get hasAnonymousAccount => throw _privateConstructorUsedError;
  String? get firstname => throw _privateConstructorUsedError;
  String? get lastname => throw _privateConstructorUsedError;
  bool? get showPronoun => throw _privateConstructorUsedError;
  String? get pronoun => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get photoURL => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get street => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get province => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get postalCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {DateTime createdAt,
      DateTime? updatedAt,
      UserRoles role,
      bool? hasCompletedOnboarding,
      bool? hasAnonymousAccount,
      String? firstname,
      String? lastname,
      bool? showPronoun,
      String? pronoun,
      String? email,
      String? phoneNumber,
      String? photoURL,
      String? bio,
      String? street,
      String? city,
      String? province,
      String? country,
      String? postalCode});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? role = null,
    Object? hasCompletedOnboarding = freezed,
    Object? hasAnonymousAccount = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? showPronoun = freezed,
    Object? pronoun = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? photoURL = freezed,
    Object? bio = freezed,
    Object? street = freezed,
    Object? city = freezed,
    Object? province = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRoles,
      hasCompletedOnboarding: freezed == hasCompletedOnboarding
          ? _value.hasCompletedOnboarding
          : hasCompletedOnboarding // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasAnonymousAccount: freezed == hasAnonymousAccount
          ? _value.hasAnonymousAccount
          : hasAnonymousAccount // ignore: cast_nullable_to_non_nullable
              as bool?,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      showPronoun: freezed == showPronoun
          ? _value.showPronoun
          : showPronoun // ignore: cast_nullable_to_non_nullable
              as bool?,
      pronoun: freezed == pronoun
          ? _value.pronoun
          : pronoun // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime createdAt,
      DateTime? updatedAt,
      UserRoles role,
      bool? hasCompletedOnboarding,
      bool? hasAnonymousAccount,
      String? firstname,
      String? lastname,
      bool? showPronoun,
      String? pronoun,
      String? email,
      String? phoneNumber,
      String? photoURL,
      String? bio,
      String? street,
      String? city,
      String? province,
      String? country,
      String? postalCode});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? role = null,
    Object? hasCompletedOnboarding = freezed,
    Object? hasAnonymousAccount = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? showPronoun = freezed,
    Object? pronoun = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? photoURL = freezed,
    Object? bio = freezed,
    Object? street = freezed,
    Object? city = freezed,
    Object? province = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
  }) {
    return _then(_$UserImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRoles,
      hasCompletedOnboarding: freezed == hasCompletedOnboarding
          ? _value.hasCompletedOnboarding
          : hasCompletedOnboarding // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasAnonymousAccount: freezed == hasAnonymousAccount
          ? _value.hasAnonymousAccount
          : hasAnonymousAccount // ignore: cast_nullable_to_non_nullable
              as bool?,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      showPronoun: freezed == showPronoun
          ? _value.showPronoun
          : showPronoun // ignore: cast_nullable_to_non_nullable
              as bool?,
      pronoun: freezed == pronoun
          ? _value.pronoun
          : pronoun // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  _$UserImpl(
      {required this.createdAt,
      required this.updatedAt,
      required this.role,
      required this.hasCompletedOnboarding,
      required this.hasAnonymousAccount,
      required this.firstname,
      required this.lastname,
      required this.showPronoun,
      required this.pronoun,
      required this.email,
      required this.phoneNumber,
      required this.photoURL,
      required this.bio,
      required this.street,
      required this.city,
      required this.province,
      required this.country,
      required this.postalCode});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final UserRoles role;
  @override
  final bool? hasCompletedOnboarding;
  @override
  final bool? hasAnonymousAccount;
  @override
  final String? firstname;
  @override
  final String? lastname;
  @override
  final bool? showPronoun;
  @override
  final String? pronoun;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final String? photoURL;
  @override
  final String? bio;
  @override
  final String? street;
  @override
  final String? city;
  @override
  final String? province;
  @override
  final String? country;
  @override
  final String? postalCode;

  @override
  String toString() {
    return 'User(createdAt: $createdAt, updatedAt: $updatedAt, role: $role, hasCompletedOnboarding: $hasCompletedOnboarding, hasAnonymousAccount: $hasAnonymousAccount, firstname: $firstname, lastname: $lastname, showPronoun: $showPronoun, pronoun: $pronoun, email: $email, phoneNumber: $phoneNumber, photoURL: $photoURL, bio: $bio, street: $street, city: $city, province: $province, country: $country, postalCode: $postalCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.hasCompletedOnboarding, hasCompletedOnboarding) ||
                other.hasCompletedOnboarding == hasCompletedOnboarding) &&
            (identical(other.hasAnonymousAccount, hasAnonymousAccount) ||
                other.hasAnonymousAccount == hasAnonymousAccount) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.showPronoun, showPronoun) ||
                other.showPronoun == showPronoun) &&
            (identical(other.pronoun, pronoun) || other.pronoun == pronoun) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      updatedAt,
      role,
      hasCompletedOnboarding,
      hasAnonymousAccount,
      firstname,
      lastname,
      showPronoun,
      pronoun,
      email,
      phoneNumber,
      photoURL,
      bio,
      street,
      city,
      province,
      country,
      postalCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User(
      {required final DateTime createdAt,
      required final DateTime? updatedAt,
      required final UserRoles role,
      required final bool? hasCompletedOnboarding,
      required final bool? hasAnonymousAccount,
      required final String? firstname,
      required final String? lastname,
      required final bool? showPronoun,
      required final String? pronoun,
      required final String? email,
      required final String? phoneNumber,
      required final String? photoURL,
      required final String? bio,
      required final String? street,
      required final String? city,
      required final String? province,
      required final String? country,
      required final String? postalCode}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  UserRoles get role;
  @override
  bool? get hasCompletedOnboarding;
  @override
  bool? get hasAnonymousAccount;
  @override
  String? get firstname;
  @override
  String? get lastname;
  @override
  bool? get showPronoun;
  @override
  String? get pronoun;
  @override
  String? get email;
  @override
  String? get phoneNumber;
  @override
  String? get photoURL;
  @override
  String? get bio;
  @override
  String? get street;
  @override
  String? get city;
  @override
  String? get province;
  @override
  String? get country;
  @override
  String? get postalCode;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
