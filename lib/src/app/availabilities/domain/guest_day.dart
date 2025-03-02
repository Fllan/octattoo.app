import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:octattoo_app/src/app/availabilities/domain/time_slot.dart';

part 'guest_day.freezed.dart';
part 'guest_day.g.dart';

@freezed
class GuestDay with _$GuestDay {
  factory GuestDay({
    required DateTime day,
    required List<TimeSlot> slots,
  }) = _GuestDay;

  /// Creates a new [GuestDay] from a JSON map.
  factory GuestDay.fromJson(Map<String, dynamic> json) =>
      _$GuestDayFromJson(json);
}
