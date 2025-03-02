import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_slot.freezed.dart';
part 'time_slot.g.dart';

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
