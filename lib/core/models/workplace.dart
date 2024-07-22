import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:octattoo_app_mvp/core/constants/worplace_types.dart';
import 'package:octattoo_app_mvp/core/models/document_reference_converter.dart';
import 'package:octattoo_app_mvp/core/models/tattoo_artist.dart';

part 'workplace.freezed.dart';
part 'workplace.g.dart';

/// A class that represents a workplace.
@freezed
class Workplace with _$Workplace {
  /// Creates a new [Workplace]
  @DocumentReferenceConverter()
  factory Workplace({
    required String id,
    required String name,
    required String description,
    required WorkplaceTypes type,
    required DateTime updatedAt,
    required DateTime createdAt,
    required DocumentReference createdBy,
    required List<TattooArtist> permanentTattooArtists,
    required List<TattooArtist> guestTattooArtists,
    required String street,
    required String city,
    required String province,
    required String country,
    required String postalCode,
  }) = _Workplace;

  /// Creates a new [Workplace] from a JSON map.
  factory Workplace.fromJson(Map<String, dynamic> json) =>
      _$WorkplaceFromJson(json);
}
