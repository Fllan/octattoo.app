// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tattoo_artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TattooArtistImpl _$$TattooArtistImplFromJson(Map<String, dynamic> json) =>
    _$TattooArtistImpl(
      userRef: const DocumentReferenceConverter()
          .fromJson(json['userRef'] as Map<String, dynamic>),
      artistName: json['artistName'] as String,
      showRealNames: json['showRealNames'] as bool,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      showPronoun: json['showPronoun'] as bool,
      pronoun: json['pronoun'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TattooArtistImplToJson(_$TattooArtistImpl instance) =>
    <String, dynamic>{
      'userRef': const DocumentReferenceConverter().toJson(instance.userRef),
      'artistName': instance.artistName,
      'showRealNames': instance.showRealNames,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'showPronoun': instance.showPronoun,
      'pronoun': instance.pronoun,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
