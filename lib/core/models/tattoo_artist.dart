import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:octattoo_app/core/models/document_reference_converter.dart';

part 'tattoo_artist.freezed.dart';
part 'tattoo_artist.g.dart';

@freezed
class TattooArtist with _$TattooArtist {
  @DocumentReferenceConverter()
  factory TattooArtist({
    required String id,
    required DocumentReference userRef,
    required String artistName,
    required String firstname,
    required String lastname,
    required String pronoun,
    required DateTime updatedAt,
    required DateTime createdAt,
  }) = _TattooArtist;

  factory TattooArtist.fromJson(Map<String, dynamic> json) =>
      _$TattooArtistFromJson(json);
}
