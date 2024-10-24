// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tattoo_artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TattooArtistImpl _$$TattooArtistImplFromJson(Map<String, dynamic> json) =>
    _$TattooArtistImpl(
      tattooArtistId: json['tattooArtistId'] as String,
      artistName: json['artistName'] as String,
      showDisplayName: json['showDisplayName'] as bool? ?? false,
      displayName: json['displayName'] as String,
      showPronoun: json['showPronoun'] as bool? ?? false,
      pronoun: json['pronoun'] as String,
      availabilitiesId: (json['availabilitiesId'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$TattooArtistImplToJson(_$TattooArtistImpl instance) =>
    <String, dynamic>{
      'tattooArtistId': instance.tattooArtistId,
      'artistName': instance.artistName,
      'showDisplayName': instance.showDisplayName,
      'displayName': instance.displayName,
      'showPronoun': instance.showPronoun,
      'pronoun': instance.pronoun,
      'availabilitiesId': instance.availabilitiesId,
    };
