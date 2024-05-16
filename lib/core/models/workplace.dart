import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:octattoo_app/core/models/document_reference_converter.dart';
import 'package:octattoo_app/core/models/tattoo_artist.dart';

part 'workplace.freezed.dart';
part 'workplace.g.dart';

@freezed
class Workplace with _$Workplace {
  @DocumentReferenceConverter()
  factory Workplace({
    required String id,
    required String name,
    required DateTime updatedAt,
    required DateTime createdAt,
    required DocumentReference createdBy,
    required List<TattooArtist> permanentTattooArtists,
    required List<TattooArtist> guestTattooArtists,
  }) = _Workplace;

  factory Workplace.fromJson(Map<String, dynamic> json) =>
      _$WorkplaceFromJson(json);
}
