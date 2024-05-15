// lib/core/models/tattoo_artist.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tattoo_artist.freezed.dart';
part 'tattoo_artist.g.dart';

@freezed
class TattooArtist with _$TattooArtist {
  factory TattooArtist({
    required String uid,
    required DateTime createdAt,
  }) = _TattooArtist;

  factory TattooArtist.fromJson(Map<String, dynamic> json) =>
      _$TattooArtistFromJson(json);
}
