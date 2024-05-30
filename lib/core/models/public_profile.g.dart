// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublicProfileImpl _$$PublicProfileImplFromJson(Map<String, dynamic> json) =>
    _$PublicProfileImpl(
      id: json['id'] as String,
      tattooArtistRef: const DocumentReferenceConverter()
          .fromJson(json['tattooArtistRef'] as Map<String, dynamic>),
      artistName: json['artistName'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      pronoun: json['pronoun'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PublicProfileImplToJson(_$PublicProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tattooArtistRef':
          const DocumentReferenceConverter().toJson(instance.tattooArtistRef),
      'artistName': instance.artistName,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'pronoun': instance.pronoun,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
