/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import '../../protocol.dart' as _i1;
import 'package:serverpod_client/serverpod_client.dart' as _i2;
import '../../features/tattoo_artist/tattoo_artist.dart' as _i3;
import '../../features/workplace/workplace.dart' as _i4;
import '../../features/availability/availability_type.dart' as _i5;
import '../../features/availability/recurring_pattern.dart' as _i6;
import 'package:octattoo_client/src/protocol/protocol.dart' as _i7;

/// Availability model representing the availability slots of tattoo artists at workplaces
abstract class Availability extends _i1.BaseClass
    implements _i2.SerializableModel {
  Availability._({
    this.id,
    super.createdAt,
    super.updatedAt,
    required this.tattooArtistId,
    this.tattooArtist,
    required this.workplaceId,
    this.workplace,
    required this.startDate,
    required this.endDate,
    required this.type,
    this.recurringPatterns,
  });

  factory Availability({
    _i2.UuidValue? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    required _i2.UuidValue tattooArtistId,
    _i3.TattooArtist? tattooArtist,
    required _i2.UuidValue workplaceId,
    _i4.Workplace? workplace,
    required DateTime startDate,
    required DateTime endDate,
    required _i5.AvailabilityType type,
    List<_i6.RecurringPattern>? recurringPatterns,
  }) = _AvailabilityImpl;

  factory Availability.fromJson(Map<String, dynamic> jsonSerialization) {
    return Availability(
      id: jsonSerialization['id'] == null
          ? null
          : _i2.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      createdAt: _i2.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i2.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      tattooArtistId: _i2.UuidValueJsonExtension.fromJson(
        jsonSerialization['tattooArtistId'],
      ),
      tattooArtist: jsonSerialization['tattooArtist'] == null
          ? null
          : _i7.Protocol().deserialize<_i3.TattooArtist>(
              jsonSerialization['tattooArtist'],
            ),
      workplaceId: _i2.UuidValueJsonExtension.fromJson(
        jsonSerialization['workplaceId'],
      ),
      workplace: jsonSerialization['workplace'] == null
          ? null
          : _i7.Protocol().deserialize<_i4.Workplace>(
              jsonSerialization['workplace'],
            ),
      startDate: _i2.DateTimeJsonExtension.fromJson(
        jsonSerialization['startDate'],
      ),
      endDate: _i2.DateTimeJsonExtension.fromJson(jsonSerialization['endDate']),
      type: _i5.AvailabilityType.fromJson(
        (jsonSerialization['type'] as String),
      ),
      recurringPatterns: jsonSerialization['recurringPatterns'] == null
          ? null
          : _i7.Protocol().deserialize<List<_i6.RecurringPattern>>(
              jsonSerialization['recurringPatterns'],
            ),
    );
  }

  /// Unique identifier
  _i2.UuidValue? id;

  _i2.UuidValue tattooArtistId;

  /// Reference to the tattoo artist associated with the availability
  _i3.TattooArtist? tattooArtist;

  _i2.UuidValue workplaceId;

  /// Reference to the workplace associated with the availability
  _i4.Workplace? workplace;

  DateTime startDate;

  DateTime endDate;

  /// Type of availability
  _i5.AvailabilityType type;

  List<_i6.RecurringPattern>? recurringPatterns;

  /// Returns a shallow copy of this [Availability]
  /// with some or all fields replaced by the given arguments.
  @override
  @_i2.useResult
  Availability copyWith({
    Object? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i2.UuidValue? tattooArtistId,
    _i3.TattooArtist? tattooArtist,
    _i2.UuidValue? workplaceId,
    _i4.Workplace? workplace,
    DateTime? startDate,
    DateTime? endDate,
    _i5.AvailabilityType? type,
    List<_i6.RecurringPattern>? recurringPatterns,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Availability',
      if (id != null) 'id': id?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'tattooArtistId': tattooArtistId.toJson(),
      if (tattooArtist != null) 'tattooArtist': tattooArtist?.toJson(),
      'workplaceId': workplaceId.toJson(),
      if (workplace != null) 'workplace': workplace?.toJson(),
      'startDate': startDate.toJson(),
      'endDate': endDate.toJson(),
      'type': type.toJson(),
      if (recurringPatterns != null)
        'recurringPatterns': recurringPatterns?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
    };
  }

  @override
  String toString() {
    return _i2.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AvailabilityImpl extends Availability {
  _AvailabilityImpl({
    _i2.UuidValue? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    required _i2.UuidValue tattooArtistId,
    _i3.TattooArtist? tattooArtist,
    required _i2.UuidValue workplaceId,
    _i4.Workplace? workplace,
    required DateTime startDate,
    required DateTime endDate,
    required _i5.AvailabilityType type,
    List<_i6.RecurringPattern>? recurringPatterns,
  }) : super._(
         id: id,
         createdAt: createdAt,
         updatedAt: updatedAt,
         tattooArtistId: tattooArtistId,
         tattooArtist: tattooArtist,
         workplaceId: workplaceId,
         workplace: workplace,
         startDate: startDate,
         endDate: endDate,
         type: type,
         recurringPatterns: recurringPatterns,
       );

  /// Returns a shallow copy of this [Availability]
  /// with some or all fields replaced by the given arguments.
  @_i2.useResult
  @override
  Availability copyWith({
    Object? id = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i2.UuidValue? tattooArtistId,
    Object? tattooArtist = _Undefined,
    _i2.UuidValue? workplaceId,
    Object? workplace = _Undefined,
    DateTime? startDate,
    DateTime? endDate,
    _i5.AvailabilityType? type,
    Object? recurringPatterns = _Undefined,
  }) {
    return Availability(
      id: id is _i2.UuidValue? ? id : this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      tattooArtistId: tattooArtistId ?? this.tattooArtistId,
      tattooArtist: tattooArtist is _i3.TattooArtist?
          ? tattooArtist
          : this.tattooArtist?.copyWith(),
      workplaceId: workplaceId ?? this.workplaceId,
      workplace: workplace is _i4.Workplace?
          ? workplace
          : this.workplace?.copyWith(),
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      type: type ?? this.type,
      recurringPatterns: recurringPatterns is List<_i6.RecurringPattern>?
          ? recurringPatterns
          : this.recurringPatterns?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
