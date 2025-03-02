import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:octattoo_app/src/app/availabilities/domain/day_week.dart';

part 'permanent_availability.freezed.dart';
part 'permanent_availability.g.dart';

@freezed
class PermanentAvailability with _$PermanentAvailability {
  factory PermanentAvailability({
    required String? id,
    required String workplaceId,
    required DateTime startDate,
    required bool hasNoEndDate,
    DateTime? endDate,
    required List<DayWeek> weekdays,
  }) = _PermanentAvailability;

  /// Creates a new [PermanentAvailability] from a JSON map.
  factory PermanentAvailability.fromJson(Map<String, dynamic> json) =>
      _$PermanentAvailabilityFromJson(json);

  /// Creates a new [PermanentAvailability] from a Firestore document snapshot.
  factory PermanentAvailability.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? option) =>
      PermanentAvailability.fromJson(snapshot.data() as Map<String, dynamic>);

  /// Converts this [PermanentAvailability] to a JSON map.
  static Map<String, Object?> toFirestore(
          PermanentAvailability permanentAvailability) =>
      permanentAvailability.toJson();
}
