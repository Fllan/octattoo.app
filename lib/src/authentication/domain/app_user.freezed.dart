// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  UserRoles? get role => throw _privateConstructorUsedError;
  bool? get onboardingCompleted => throw _privateConstructorUsedError;
  bool? get emailVerified => throw _privateConstructorUsedError;
  bool? get isAnonymous => throw _privateConstructorUsedError;
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

  /// Serializes this AppUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {DateTime? createdAt,
      DateTime? updatedAt,
      String uid,
      UserRoles? role,
      bool? onboardingCompleted,
      bool? emailVerified,
      bool? isAnonymous,
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
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? uid = null,
    Object? role = freezed,
    Object? onboardingCompleted = freezed,
    Object? emailVerified = freezed,
    Object? isAnonymous = freezed,
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRoles?,
      onboardingCompleted: freezed == onboardingCompleted
          ? _value.onboardingCompleted
          : onboardingCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAnonymous: freezed == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
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
abstract class _$$AppUserImplCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$AppUserImplCopyWith(
          _$AppUserImpl value, $Res Function(_$AppUserImpl) then) =
      __$$AppUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? createdAt,
      DateTime? updatedAt,
      String uid,
      UserRoles? role,
      bool? onboardingCompleted,
      bool? emailVerified,
      bool? isAnonymous,
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
class __$$AppUserImplCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$AppUserImpl>
    implements _$$AppUserImplCopyWith<$Res> {
  __$$AppUserImplCopyWithImpl(
      _$AppUserImpl _value, $Res Function(_$AppUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? uid = null,
    Object? role = freezed,
    Object? onboardingCompleted = freezed,
    Object? emailVerified = freezed,
    Object? isAnonymous = freezed,
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
    return _then(_$AppUserImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRoles?,
      onboardingCompleted: freezed == onboardingCompleted
          ? _value.onboardingCompleted
          : onboardingCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAnonymous: freezed == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
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
class _$AppUserImpl implements _AppUser {
  _$AppUserImpl(
      {this.createdAt,
      this.updatedAt,
      required this.uid,
      this.role,
      this.onboardingCompleted,
      this.emailVerified,
      this.isAnonymous,
      this.firstname,
      this.lastname,
      this.showPronoun,
      this.pronoun,
      this.email,
      this.phoneNumber,
      this.photoURL,
      this.bio,
      this.street,
      this.city,
      this.province,
      this.country,
      this.postalCode});

  factory _$AppUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserImplFromJson(json);

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String uid;
  @override
  final UserRoles? role;
  @override
  final bool? onboardingCompleted;
  @override
  final bool? emailVerified;
  @override
  final bool? isAnonymous;
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
    return 'AppUser(createdAt: $createdAt, updatedAt: $updatedAt, uid: $uid, role: $role, onboardingCompleted: $onboardingCompleted, emailVerified: $emailVerified, isAnonymous: $isAnonymous, firstname: $firstname, lastname: $lastname, showPronoun: $showPronoun, pronoun: $pronoun, email: $email, phoneNumber: $phoneNumber, photoURL: $photoURL, bio: $bio, street: $street, city: $city, province: $province, country: $country, postalCode: $postalCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.onboardingCompleted, onboardingCompleted) ||
                other.onboardingCompleted == onboardingCompleted) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous) &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        createdAt,
        updatedAt,
        uid,
        role,
        onboardingCompleted,
        emailVerified,
        isAnonymous,
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
        postalCode
      ]);

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      __$$AppUserImplCopyWithImpl<_$AppUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUserImplToJson(
      this,
    );
  }
}

abstract class _AppUser implements AppUser {
  factory _AppUser(
      {final DateTime? createdAt,
      final DateTime? updatedAt,
      required final String uid,
      final UserRoles? role,
      final bool? onboardingCompleted,
      final bool? emailVerified,
      final bool? isAnonymous,
      final String? firstname,
      final String? lastname,
      final bool? showPronoun,
      final String? pronoun,
      final String? email,
      final String? phoneNumber,
      final String? photoURL,
      final String? bio,
      final String? street,
      final String? city,
      final String? province,
      final String? country,
      final String? postalCode}) = _$AppUserImpl;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$AppUserImpl.fromJson;

  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  String get uid;
  @override
  UserRoles? get role;
  @override
  bool? get onboardingCompleted;
  @override
  bool? get emailVerified;
  @override
  bool? get isAnonymous;
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

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
