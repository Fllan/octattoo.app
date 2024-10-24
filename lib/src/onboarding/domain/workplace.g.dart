// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workplace.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkplaceImpl _$$WorkplaceImplFromJson(Map<String, dynamic> json) =>
    _$WorkplaceImpl(
      creatorUid: json['creatorUid'] as String,
      managerUid: json['managerUid'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      name: json['name'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      province: json['province'] as String,
      country: json['country'] as String,
      postalCode: json['postalCode'] as String,
    );

Map<String, dynamic> _$$WorkplaceImplToJson(_$WorkplaceImpl instance) =>
    <String, dynamic>{
      'creatorUid': instance.creatorUid,
      'managerUid': instance.managerUid,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'name': instance.name,
      'street': instance.street,
      'city': instance.city,
      'province': instance.province,
      'country': instance.country,
      'postalCode': instance.postalCode,
    };
