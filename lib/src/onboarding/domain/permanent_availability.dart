import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'permanent_availability.freezed.dart';
part 'permanent_availability.g.dart';

@freezed
class TimeSlot with _$TimeSlot {
  factory TimeSlot({
    required DateTime startHour,
    required DateTime endHour,
  }) = _TimeSlot;

  /// Creates a new [TimeSlot] from a JSON map.
  factory TimeSlot.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotFromJson(json);
}

@freezed
class DayWeek with _$DayWeek {
  factory DayWeek({
    required String dayName,
    required List<TimeSlot> slots,
  }) = _DayWeek;

  /// Creates a new [DayWeek] from a JSON map.
  factory DayWeek.fromJson(Map<String, dynamic> json) =>
      _$DayWeekFromJson(json);
}

@freezed
class PermanentAvailability with _$PermanentAvailability {
  factory PermanentAvailability({
    required String permanentAvailabilityId,
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
