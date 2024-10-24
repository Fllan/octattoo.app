import 'package:freezed_annotation/freezed_annotation.dart';

part 'tattoo_artist.freezed.dart';
part 'tattoo_artist.g.dart';

@freezed
class TattooArtist with _$TattooArtist {
  factory TattooArtist({
    required String tattooArtistId,
    required String artistName,
    @Default(false) bool showDisplayName,
    required String displayName,
    @Default(false) bool showPronoun,
    required String pronoun,
    required List<String> availabilitiesId,
  }) = _TattooArtist;

  factory TattooArtist.fromJson(Map<String, dynamic> json) =>
      _$TattooArtistFromJson(json);
}
