// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      uid: json['uid'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      role: $enumDecode(_$UserRolesEnumMap, json['role']),
      hasCompletedOnboarding: json['hasCompletedOnboarding'] as bool,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'role': _$UserRolesEnumMap[instance.role]!,
      'hasCompletedOnboarding': instance.hasCompletedOnboarding,
    };

const _$UserRolesEnumMap = {
  UserRoles.artist: 'artist',
  UserRoles.customer: 'customer',
};
