import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';

part 'workplace.freezed.dart';
part 'workplace.g.dart';

@freezed
class Workplace with _$Workplace {
  const Workplace._();

  factory Workplace({
    required String id,
    required String creatorUid,
    required String managerUid,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String name,
    required String street,
    required String city,
    required String province,
    required String country,
    required String postalCode,
    @HighlightedStringConverter() HighlightedString? highlightedName,
  }) = _Workplace;

  /// Creates a new [Workplace] from a JSON map.
  factory Workplace.fromJson(Map<String, dynamic> json) =>
      _$WorkplaceFromJson(json);

  /// Creates a new [Workplace] from a Firestore document snapshot.
  factory Workplace.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? option) =>
      Workplace.fromJson(snapshot.data() as Map<String, dynamic>);

  factory Workplace.fromHit(Hit hit) => Workplace(
        id: hit['objectID'] as String,
        creatorUid: hit['creatorUid'] as String,
        managerUid: hit['managerUid'] as String,
        createdAt: DateTime.parse(hit['createdAt'] as String),
        updatedAt: DateTime.parse(hit['updatedAt'] as String),
        name: hit['name'] as String,
        street: hit['street'] as String,
        city: hit['city'] as String,
        province: hit['province'] as String,
        country: hit['country'] as String,
        postalCode: hit['postalCode'] as String,
        highlightedName: hit.getHighlightedString('name'),
      );

  /// Converts this [Workplace] to a JSON map.
  Map<String, Object?> toFirestore() => toJson();
}

class HighlightedStringConverter
    extends JsonConverter<HighlightedString?, String?> {
  const HighlightedStringConverter();

  @override
  HighlightedString? fromJson(String? json) {
    return json != null ? HighlightedString.of(json) : null;
  }

  @override
  String? toJson(HighlightedString? object) {
    return object?.toString();
  }
}
