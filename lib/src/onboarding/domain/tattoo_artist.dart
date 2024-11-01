import 'package:cloud_firestore/cloud_firestore.dart';
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

  /// Creates a new [TattooArtist] from a JSON map.
  factory TattooArtist.fromJson(Map<String, dynamic> json) =>
      _$TattooArtistFromJson(json);

  /// Creates a new [TattooArtist] from a Firestore document snapshot.
  factory TattooArtist.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? option) =>
      TattooArtist.fromJson(snapshot.data() as Map<String, dynamic>);

  /// Converts this [TattooArtist] to a JSON map.
  static Map<String, Object?> toFirestore(TattooArtist tattooArtist) =>
      tattooArtist.toJson();
}
