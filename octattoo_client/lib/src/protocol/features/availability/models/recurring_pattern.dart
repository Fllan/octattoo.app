/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../../features/availability/models/availability.dart' as _i2;
import '../../../features/availability/models/recurring_type.dart' as _i3;

/// A RecurringPattern is a description of the recurrence
abstract class RecurringPattern implements _i1.SerializableModel {
  RecurringPattern._({
    this.id,
    required this.availabilityId,
    this.availability,
    required this.recurringType,
    this.separationCount,
    this.dayOfWeek,
    this.weekOfMonth,
    this.dayOfMonth,
    this.monthOfYear,
  });

  factory RecurringPattern({
    int? id,
    required int availabilityId,
    _i2.Availability? availability,
    required _i3.RecurringType recurringType,
    int? separationCount,
    int? dayOfWeek,
    int? weekOfMonth,
    int? dayOfMonth,
    int? monthOfYear,
  }) = _RecurringPatternImpl;

  factory RecurringPattern.fromJson(Map<String, dynamic> jsonSerialization) {
    return RecurringPattern(
      id: jsonSerialization['id'] as int?,
      availabilityId: jsonSerialization['availabilityId'] as int,
      availability: jsonSerialization['availability'] == null
          ? null
          : _i2.Availability.fromJson(
              (jsonSerialization['availability'] as Map<String, dynamic>)),
      recurringType: _i3.RecurringType.fromJson(
          (jsonSerialization['recurringType'] as String)),
      separationCount: jsonSerialization['separationCount'] as int?,
      dayOfWeek: jsonSerialization['dayOfWeek'] as int?,
      weekOfMonth: jsonSerialization['weekOfMonth'] as int?,
      dayOfMonth: jsonSerialization['dayOfMonth'] as int?,
      monthOfYear: jsonSerialization['monthOfYear'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int availabilityId;

  _i2.Availability? availability;

  _i3.RecurringType recurringType;

  /// If recurringType.daily and separationCount = 2 it means every 2 days
  int? separationCount;

  /// 1 for monday, 2 for tuesday, ...
  int? dayOfWeek;

  /// 1 for the first week, -1 for the last week of the month, ...
  int? weekOfMonth;

  /// 1 for the first day, -1 for the last day of the month, ...
  int? dayOfMonth;

  /// 1 for january, 2 for february, ...
  int? monthOfYear;

  /// Returns a shallow copy of this [RecurringPattern]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RecurringPattern copyWith({
    int? id,
    int? availabilityId,
    _i2.Availability? availability,
    _i3.RecurringType? recurringType,
    int? separationCount,
    int? dayOfWeek,
    int? weekOfMonth,
    int? dayOfMonth,
    int? monthOfYear,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'availabilityId': availabilityId,
      if (availability != null) 'availability': availability?.toJson(),
      'recurringType': recurringType.toJson(),
      if (separationCount != null) 'separationCount': separationCount,
      if (dayOfWeek != null) 'dayOfWeek': dayOfWeek,
      if (weekOfMonth != null) 'weekOfMonth': weekOfMonth,
      if (dayOfMonth != null) 'dayOfMonth': dayOfMonth,
      if (monthOfYear != null) 'monthOfYear': monthOfYear,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RecurringPatternImpl extends RecurringPattern {
  _RecurringPatternImpl({
    int? id,
    required int availabilityId,
    _i2.Availability? availability,
    required _i3.RecurringType recurringType,
    int? separationCount,
    int? dayOfWeek,
    int? weekOfMonth,
    int? dayOfMonth,
    int? monthOfYear,
  }) : super._(
          id: id,
          availabilityId: availabilityId,
          availability: availability,
          recurringType: recurringType,
          separationCount: separationCount,
          dayOfWeek: dayOfWeek,
          weekOfMonth: weekOfMonth,
          dayOfMonth: dayOfMonth,
          monthOfYear: monthOfYear,
        );

  /// Returns a shallow copy of this [RecurringPattern]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RecurringPattern copyWith({
    Object? id = _Undefined,
    int? availabilityId,
    Object? availability = _Undefined,
    _i3.RecurringType? recurringType,
    Object? separationCount = _Undefined,
    Object? dayOfWeek = _Undefined,
    Object? weekOfMonth = _Undefined,
    Object? dayOfMonth = _Undefined,
    Object? monthOfYear = _Undefined,
  }) {
    return RecurringPattern(
      id: id is int? ? id : this.id,
      availabilityId: availabilityId ?? this.availabilityId,
      availability: availability is _i2.Availability?
          ? availability
          : this.availability?.copyWith(),
      recurringType: recurringType ?? this.recurringType,
      separationCount:
          separationCount is int? ? separationCount : this.separationCount,
      dayOfWeek: dayOfWeek is int? ? dayOfWeek : this.dayOfWeek,
      weekOfMonth: weekOfMonth is int? ? weekOfMonth : this.weekOfMonth,
      dayOfMonth: dayOfMonth is int? ? dayOfMonth : this.dayOfMonth,
      monthOfYear: monthOfYear is int? ? monthOfYear : this.monthOfYear,
    );
  }
}
