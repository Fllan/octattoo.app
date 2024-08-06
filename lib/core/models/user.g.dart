// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      role: $enumDecode(_$UserRolesEnumMap, json['role']),
      hasCompletedOnboarding: json['hasCompletedOnboarding'] as bool,
      hasAnonymousAccount: json['hasAnonymousAccount'] as bool,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      showPronoun: json['showPronoun'] as bool,
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

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'role': _$UserRolesEnumMap[instance.role]!,
      'hasCompletedOnboarding': instance.hasCompletedOnboarding,
      'hasAnonymousAccount': instance.hasAnonymousAccount,
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
  UserRoles.artist: 'artist',
  UserRoles.customer: 'customer',
};
