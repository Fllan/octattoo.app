import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _Workplace;

  /// Creates a new [Workplace] from a JSON map.
  factory Workplace.fromJson(Map<String, dynamic> json) =>
      _$WorkplaceFromJson(json);

  /// Creates a new [Workplace] from a Firestore document snapshot.
  factory Workplace.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? option) =>
      Workplace.fromJson(snapshot.data() as Map<String, dynamic>);

  /// Converts this [Workplace] to a JSON map.
  Map<String, Object?> toFirestore() => toJson();
}
