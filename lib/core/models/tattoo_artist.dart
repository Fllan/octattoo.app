import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:octattoo_app_mvp/core/models/document_reference_converter.dart';

part 'tattoo_artist.freezed.dart';
part 'tattoo_artist.g.dart';

/// A class that represents a tattoo artist.
@freezed
class TattooArtist with _$TattooArtist {
  /// Creates a new [TattooArtist].
  @DocumentReferenceConverter()
  factory TattooArtist({
    required String userRef,
    required String artistName,
    required bool showRealNames,
    required String? firstname,
    required String? lastname,
    required bool showPronoun,
    required String? pronoun,
    required DateTime updatedAt,
    required DateTime createdAt,
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
