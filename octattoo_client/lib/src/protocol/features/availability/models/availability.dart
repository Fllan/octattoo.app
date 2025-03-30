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
import '../../../features/user/models/user.dart' as _i2;
import '../../../features/workplace/models/workplace.dart' as _i3;
import '../../../features/availability/models/availability_type.dart' as _i4;

/// An Availability is a timeframe set by a User to manage the TattooArtist availabilities
abstract class Availability implements _i1.SerializableModel {
  Availability._({
    this.id,
    required this.createdById,
    this.createdBy,
    required this.createdAt,
    this.workplaceId,
    this.workplace,
    required this.startDate,
    this.endDate,
    required this.startTime,
    this.endTime,
    required this.isFullDay,
    required this.isRecurring,
    required this.type,
    this.title,
  });

  factory Availability({
    int? id,
    required int createdById,
    _i2.User? createdBy,
    required DateTime createdAt,
    int? workplaceId,
    _i3.Workplace? workplace,
    required DateTime startDate,
    DateTime? endDate,
    required DateTime startTime,
    DateTime? endTime,
    required bool isFullDay,
    required bool isRecurring,
    required _i4.AvailabilityType type,
    String? title,
  }) = _AvailabilityImpl;

  factory Availability.fromJson(Map<String, dynamic> jsonSerialization) {
    return Availability(
      id: jsonSerialization['id'] as int?,
      createdById: jsonSerialization['createdById'] as int,
      createdBy: jsonSerialization['createdBy'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['createdBy'] as Map<String, dynamic>)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      workplaceId: jsonSerialization['workplaceId'] as int?,
      workplace: jsonSerialization['workplace'] == null
          ? null
          : _i3.Workplace.fromJson(
              (jsonSerialization['workplace'] as Map<String, dynamic>)),
      startDate:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startDate']),
      endDate: jsonSerialization['endDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['endDate']),
      startTime:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startTime']),
      endTime: jsonSerialization['endTime'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['endTime']),
      isFullDay: jsonSerialization['isFullDay'] as bool,
      isRecurring: jsonSerialization['isRecurring'] as bool,
      type:
          _i4.AvailabilityType.fromJson((jsonSerialization['type'] as String)),
      title: jsonSerialization['title'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int createdById;

  _i2.User? createdBy;

  DateTime createdAt;

  int? workplaceId;

  _i3.Workplace? workplace;

  DateTime startDate;

  DateTime? endDate;

  DateTime startTime;

  DateTime? endTime;

  bool isFullDay;

  bool isRecurring;

  _i4.AvailabilityType type;

  String? title;

  /// Returns a shallow copy of this [Availability]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Availability copyWith({
    int? id,
    int? createdById,
    _i2.User? createdBy,
    DateTime? createdAt,
    int? workplaceId,
    _i3.Workplace? workplace,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? startTime,
    DateTime? endTime,
    bool? isFullDay,
    bool? isRecurring,
    _i4.AvailabilityType? type,
    String? title,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'createdById': createdById,
      if (createdBy != null) 'createdBy': createdBy?.toJson(),
      'createdAt': createdAt.toJson(),
      if (workplaceId != null) 'workplaceId': workplaceId,
      if (workplace != null) 'workplace': workplace?.toJson(),
      'startDate': startDate.toJson(),
      if (endDate != null) 'endDate': endDate?.toJson(),
      'startTime': startTime.toJson(),
      if (endTime != null) 'endTime': endTime?.toJson(),
      'isFullDay': isFullDay,
      'isRecurring': isRecurring,
      'type': type.toJson(),
      if (title != null) 'title': title,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AvailabilityImpl extends Availability {
  _AvailabilityImpl({
    int? id,
    required int createdById,
    _i2.User? createdBy,
    required DateTime createdAt,
    int? workplaceId,
    _i3.Workplace? workplace,
    required DateTime startDate,
    DateTime? endDate,
    required DateTime startTime,
    DateTime? endTime,
    required bool isFullDay,
    required bool isRecurring,
    required _i4.AvailabilityType type,
    String? title,
  }) : super._(
          id: id,
          createdById: createdById,
          createdBy: createdBy,
          createdAt: createdAt,
          workplaceId: workplaceId,
          workplace: workplace,
          startDate: startDate,
          endDate: endDate,
          startTime: startTime,
          endTime: endTime,
          isFullDay: isFullDay,
          isRecurring: isRecurring,
          type: type,
          title: title,
        );

  /// Returns a shallow copy of this [Availability]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Availability copyWith({
    Object? id = _Undefined,
    int? createdById,
    Object? createdBy = _Undefined,
    DateTime? createdAt,
    Object? workplaceId = _Undefined,
    Object? workplace = _Undefined,
    DateTime? startDate,
    Object? endDate = _Undefined,
    DateTime? startTime,
    Object? endTime = _Undefined,
    bool? isFullDay,
    bool? isRecurring,
    _i4.AvailabilityType? type,
    Object? title = _Undefined,
  }) {
    return Availability(
      id: id is int? ? id : this.id,
      createdById: createdById ?? this.createdById,
      createdBy:
          createdBy is _i2.User? ? createdBy : this.createdBy?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      workplaceId: workplaceId is int? ? workplaceId : this.workplaceId,
      workplace:
          workplace is _i3.Workplace? ? workplace : this.workplace?.copyWith(),
      startDate: startDate ?? this.startDate,
      endDate: endDate is DateTime? ? endDate : this.endDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime is DateTime? ? endTime : this.endTime,
      isFullDay: isFullDay ?? this.isFullDay,
      isRecurring: isRecurring ?? this.isRecurring,
      type: type ?? this.type,
      title: title is String? ? title : this.title,
    );
  }
}
