// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      uid: json['uid'] as String,
      role: $enumDecode(_$UserRolesEnumMap, json['role']),
      onboardingCompleted: json['onboardingCompleted'] as bool? ?? false,
      emailVerified: json['emailVerified'] as bool? ?? false,
      isAnonymous: json['isAnonymous'] as bool,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'uid': instance.uid,
      'role': _$UserRolesEnumMap[instance.role]!,
      'onboardingCompleted': instance.onboardingCompleted,
      'emailVerified': instance.emailVerified,
      'isAnonymous': instance.isAnonymous,
      'email': instance.email,
    };

const _$UserRolesEnumMap = {
  UserRoles.admin: 'admin',
  UserRoles.artist: 'artist',
  UserRoles.customer: 'customer',
};
