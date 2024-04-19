// lib/core/models/tattoo_artist.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'tattoo_artist.freezed.dart';
part 'tattoo_artist.g.dart';

// Custom converter for DocumentReference
class DocumentReferenceConverter implements JsonConverter<DocumentReference, Map<String, dynamic>> {
  const DocumentReferenceConverter();

  @override
  DocumentReference fromJson(Map<String, dynamic> json) {
    return FirebaseFirestore.instance.doc(json['path'] as String);
  }

  @override
  Map<String, dynamic> toJson(DocumentReference object) {
    return {"path": object.path};
  }
}

@freezed
class TattooArtist with _$TattooArtist {
  @DocumentReferenceConverter()
  factory TattooArtist({
    required DocumentReference userRef,
    required DateTime createdAt,
  }) = _TattooArtist;

  factory TattooArtist.fromJson(Map<String, dynamic> json) =>
      _$TattooArtistFromJson(json);
}
