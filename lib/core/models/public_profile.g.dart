// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublicProfileImpl _$$PublicProfileImplFromJson(Map<String, dynamic> json) =>
    _$PublicProfileImpl(
      artistName: json['artistName'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      pronoun: json['pronoun'] as String,
      tattooArtistRef: const DocumentReferenceConverter()
          .fromJson(json['tattooArtistRef'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PublicProfileImplToJson(_$PublicProfileImpl instance) =>
    <String, dynamic>{
      'artistName': instance.artistName,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'pronoun': instance.pronoun,
      'tattooArtistRef':
          const DocumentReferenceConverter().toJson(instance.tattooArtistRef),
      'createdAt': instance.createdAt.toIso8601String(),
    };
