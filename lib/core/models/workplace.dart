import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:octattoo_app_mvp/core/models/tattoo_artist.dart';

part 'workplace.freezed.dart';
part 'workplace.g.dart';

/// A class that represents a workplace.
@freezed
class Workplace with _$Workplace {
  /// Creates a new [Workplace]
  factory Workplace({
    required String name,
    required String? description,
    required DateTime? updatedAt,
    required DateTime createdAt,
    required String createdBy,
    required String? managedBy,
    required List<TattooArtist>? permanentTattooArtists,
    required List<TattooArtist>? guestTattooArtists,
    required String street,
    required String city,
    required String province,
    required String country,
    required String postalCode,
  }) = _Workplace;

  /// Creates a new [Workplace] from a JSON map.
  factory Workplace.fromJson(Map<String, dynamic> json) =>
      _$WorkplaceFromJson(json);

  /// Creates a new [Workplace] from a Firestore document snapshot.
  factory Workplace.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? option) =>
      Workplace.fromJson(snapshot.data() as Map<String, dynamic>);

  /// Converts this [Workplace] to a JSON map.
  static Map<String, Object?> toFirestore(Workplace workplace) =>
      workplace.toJson();
}
