// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tattoo_artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TattooArtistImpl _$$TattooArtistImplFromJson(Map<String, dynamic> json) =>
    _$TattooArtistImpl(
      uid: json['uid'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TattooArtistImplToJson(_$TattooArtistImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'createdAt': instance.createdAt.toIso8601String(),
    };
