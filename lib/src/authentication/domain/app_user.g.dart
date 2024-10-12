// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      uid: json['uid'] as String,
      role: $enumDecodeNullable(_$UserRolesEnumMap, json['role']),
      onboardingCompleted: json['onboardingCompleted'] as bool?,
      emailVerified: json['emailVerified'] as bool?,
      isAnonymous: json['isAnonymous'] as bool?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      showPronoun: json['showPronoun'] as bool?,
      pronoun: json['pronoun'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      photoURL: json['photoURL'] as String?,
      bio: json['bio'] as String?,
      street: json['street'] as String?,
      city: json['city'] as String?,
      province: json['province'] as String?,
      country: json['country'] as String?,
      postalCode: json['postalCode'] as String?,
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'uid': instance.uid,
      'role': _$UserRolesEnumMap[instance.role],
      'onboardingCompleted': instance.onboardingCompleted,
      'emailVerified': instance.emailVerified,
      'isAnonymous': instance.isAnonymous,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'showPronoun': instance.showPronoun,
      'pronoun': instance.pronoun,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'photoURL': instance.photoURL,
      'bio': instance.bio,
      'street': instance.street,
      'city': instance.city,
      'province': instance.province,
      'country': instance.country,
      'postalCode': instance.postalCode,
    };

const _$UserRolesEnumMap = {
  UserRoles.admin: 'admin',
  UserRoles.artist: 'artist',
  UserRoles.customer: 'customer',
};
