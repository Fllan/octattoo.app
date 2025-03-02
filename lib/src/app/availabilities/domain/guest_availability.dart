import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:octattoo_app/src/app/availabilities/domain/guest_day.dart';

part 'guest_availability.freezed.dart';
part 'guest_availability.g.dart';

@freezed
class GuestAvailability with _$GuestAvailability {
  factory GuestAvailability({
    required String? id,
    required String workplaceId,
    required List<GuestDay> guestDays,
  }) = _GuestAvailability;

  /// Creates a new [GuestAvailability] from a JSON map.
  factory GuestAvailability.fromJson(Map<String, dynamic> json) =>
      _$GuestAvailabilityFromJson(json);

  /// Creates a new [GuestAvailability] from a Firestore document snapshot.
  factory GuestAvailability.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? option) =>
      GuestAvailability.fromJson(snapshot.data() as Map<String, dynamic>);

  /// Converts this [GuestAvailability] to a JSON map.
  static Map<String, Object?> toFirestore(
          GuestAvailability guestAvailability) =>
      guestAvailability.toJson();
}
