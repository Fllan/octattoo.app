// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tattoo_artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TattooArtistImpl _$$TattooArtistImplFromJson(Map<String, dynamic> json) =>
    _$TattooArtistImpl(
      id: json['id'] as String,
      userRef: const DocumentReferenceConverter()
          .fromJson(json['userRef'] as Map<String, dynamic>),
      artistName: json['artistName'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      pronoun: json['pronoun'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TattooArtistImplToJson(_$TattooArtistImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userRef': const DocumentReferenceConverter().toJson(instance.userRef),
      'artistName': instance.artistName,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'pronoun': instance.pronoun,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
