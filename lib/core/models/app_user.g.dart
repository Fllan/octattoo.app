// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      uid: json['uid'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      role: $enumDecode(_$UserRolesEnumMap, json['role']),
      hasCompletedOnboarding: json['hasCompletedOnboarding'] as bool,
      hasAnonymousAccount: json['hasAnonymousAccount'] as bool,
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'role': _$UserRolesEnumMap[instance.role]!,
      'hasCompletedOnboarding': instance.hasCompletedOnboarding,
      'hasAnonymousAccount': instance.hasAnonymousAccount,
    };

const _$UserRolesEnumMap = {
  UserRoles.artist: 'artist',
  UserRoles.customer: 'customer',
};
