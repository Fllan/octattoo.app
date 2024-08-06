// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workplace.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkplaceImpl _$$WorkplaceImplFromJson(Map<String, dynamic> json) =>
    _$WorkplaceImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String,
      managedBy: json['managedBy'] as String?,
      permanentTattooArtists: (json['permanentTattooArtists'] as List<dynamic>?)
          ?.map((e) => TattooArtist.fromJson(e as Map<String, dynamic>))
          .toList(),
      guestTattooArtists: (json['guestTattooArtists'] as List<dynamic>?)
          ?.map((e) => TattooArtist.fromJson(e as Map<String, dynamic>))
          .toList(),
      street: json['street'] as String,
      city: json['city'] as String,
      province: json['province'] as String,
      country: json['country'] as String,
      postalCode: json['postalCode'] as String,
    );

Map<String, dynamic> _$$WorkplaceImplToJson(_$WorkplaceImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'createdBy': instance.createdBy,
      'managedBy': instance.managedBy,
      'permanentTattooArtists': instance.permanentTattooArtists,
      'guestTattooArtists': instance.guestTattooArtists,
      'street': instance.street,
      'city': instance.city,
      'province': instance.province,
      'country': instance.country,
      'postalCode': instance.postalCode,
    };
