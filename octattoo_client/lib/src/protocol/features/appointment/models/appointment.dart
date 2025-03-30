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
import '../../../features/tattoo_artist/models/tattoo_artist.dart' as _i2;
import '../../../features/workplace/models/workplace.dart' as _i3;
import '../../../features/tattoo_project/models/tattoo_project.dart' as _i4;

/// An Appointment is when a Tattoo Artist and a Customer meet at a Workplace
abstract class Appointment implements _i1.SerializableModel {
  Appointment._({
    this.id,
    required this.tattooArtistId,
    this.tattooArtist,
    required this.workplaceId,
    this.workplace,
    this.tattooProjectId,
    this.tattooProject,
    required this.start,
    required this.end,
  });

  factory Appointment({
    int? id,
    required int tattooArtistId,
    _i2.TattooArtist? tattooArtist,
    required int workplaceId,
    _i3.Workplace? workplace,
    int? tattooProjectId,
    _i4.TattooProject? tattooProject,
    required DateTime start,
    required DateTime end,
  }) = _AppointmentImpl;

  factory Appointment.fromJson(Map<String, dynamic> jsonSerialization) {
    return Appointment(
      id: jsonSerialization['id'] as int?,
      tattooArtistId: jsonSerialization['tattooArtistId'] as int,
      tattooArtist: jsonSerialization['tattooArtist'] == null
          ? null
          : _i2.TattooArtist.fromJson(
              (jsonSerialization['tattooArtist'] as Map<String, dynamic>)),
      workplaceId: jsonSerialization['workplaceId'] as int,
      workplace: jsonSerialization['workplace'] == null
          ? null
          : _i3.Workplace.fromJson(
              (jsonSerialization['workplace'] as Map<String, dynamic>)),
      tattooProjectId: jsonSerialization['tattooProjectId'] as int?,
      tattooProject: jsonSerialization['tattooProject'] == null
          ? null
          : _i4.TattooProject.fromJson(
              (jsonSerialization['tattooProject'] as Map<String, dynamic>)),
      start: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['start']),
      end: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['end']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int tattooArtistId;

  _i2.TattooArtist? tattooArtist;

  int workplaceId;

  _i3.Workplace? workplace;

  int? tattooProjectId;

  _i4.TattooProject? tattooProject;

  DateTime start;

  DateTime end;

  /// Returns a shallow copy of this [Appointment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Appointment copyWith({
    int? id,
    int? tattooArtistId,
    _i2.TattooArtist? tattooArtist,
    int? workplaceId,
    _i3.Workplace? workplace,
    int? tattooProjectId,
    _i4.TattooProject? tattooProject,
    DateTime? start,
    DateTime? end,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tattooArtistId': tattooArtistId,
      if (tattooArtist != null) 'tattooArtist': tattooArtist?.toJson(),
      'workplaceId': workplaceId,
      if (workplace != null) 'workplace': workplace?.toJson(),
      if (tattooProjectId != null) 'tattooProjectId': tattooProjectId,
      if (tattooProject != null) 'tattooProject': tattooProject?.toJson(),
      'start': start.toJson(),
      'end': end.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppointmentImpl extends Appointment {
  _AppointmentImpl({
    int? id,
    required int tattooArtistId,
    _i2.TattooArtist? tattooArtist,
    required int workplaceId,
    _i3.Workplace? workplace,
    int? tattooProjectId,
    _i4.TattooProject? tattooProject,
    required DateTime start,
    required DateTime end,
  }) : super._(
          id: id,
          tattooArtistId: tattooArtistId,
          tattooArtist: tattooArtist,
          workplaceId: workplaceId,
          workplace: workplace,
          tattooProjectId: tattooProjectId,
          tattooProject: tattooProject,
          start: start,
          end: end,
        );

  /// Returns a shallow copy of this [Appointment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Appointment copyWith({
    Object? id = _Undefined,
    int? tattooArtistId,
    Object? tattooArtist = _Undefined,
    int? workplaceId,
    Object? workplace = _Undefined,
    Object? tattooProjectId = _Undefined,
    Object? tattooProject = _Undefined,
    DateTime? start,
    DateTime? end,
  }) {
    return Appointment(
      id: id is int? ? id : this.id,
      tattooArtistId: tattooArtistId ?? this.tattooArtistId,
      tattooArtist: tattooArtist is _i2.TattooArtist?
          ? tattooArtist
          : this.tattooArtist?.copyWith(),
      workplaceId: workplaceId ?? this.workplaceId,
      workplace:
          workplace is _i3.Workplace? ? workplace : this.workplace?.copyWith(),
      tattooProjectId:
          tattooProjectId is int? ? tattooProjectId : this.tattooProjectId,
      tattooProject: tattooProject is _i4.TattooProject?
          ? tattooProject
          : this.tattooProject?.copyWith(),
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }
}
