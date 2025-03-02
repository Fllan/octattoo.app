import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:octattoo_app/src/app/availabilities/domain/time_slot.dart';

part 'day_week.freezed.dart';
part 'day_week.g.dart';

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
