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
      createdBy: const DocumentReferenceConverter()
          .fromJson(json['createdBy'] as Map<String, dynamic>),
      managedBy: _$JsonConverterFromJson<Map<String, dynamic>,
              DocumentReference<Object?>>(
          json['managedBy'], const DocumentReferenceConverter().fromJson),
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
      'createdBy':
          const DocumentReferenceConverter().toJson(instance.createdBy),
      'managedBy': _$JsonConverterToJson<Map<String, dynamic>,
              DocumentReference<Object?>>(
          instance.managedBy, const DocumentReferenceConverter().toJson),
      'permanentTattooArtists': instance.permanentTattooArtists,
      'guestTattooArtists': instance.guestTattooArtists,
      'street': instance.street,
      'city': instance.city,
      'province': instance.province,
      'country': instance.country,
      'postalCode': instance.postalCode,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
