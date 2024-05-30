// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workplace.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkplaceImpl _$$WorkplaceImplFromJson(Map<String, dynamic> json) =>
    _$WorkplaceImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy: const DocumentReferenceConverter()
          .fromJson(json['createdBy'] as Map<String, dynamic>),
      permanentTattooArtists: (json['permanentTattooArtists'] as List<dynamic>)
          .map((e) => TattooArtist.fromJson(e as Map<String, dynamic>))
          .toList(),
      guestTattooArtists: (json['guestTattooArtists'] as List<dynamic>)
          .map((e) => TattooArtist.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkplaceImplToJson(_$WorkplaceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'createdBy':
          const DocumentReferenceConverter().toJson(instance.createdBy),
      'permanentTattooArtists': instance.permanentTattooArtists,
      'guestTattooArtists': instance.guestTattooArtists,
    };
