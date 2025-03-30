/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../../features/tattoo_artist/models/tattoo_artist.dart' as _i2;
import '../../../features/workplace/models/workplace.dart' as _i3;
import '../../../features/tattoo_project/models/tattoo_project.dart' as _i4;

/// An Appointment is when a Tattoo Artist and a Customer meet at a Workplace
abstract class Appointment implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = AppointmentTable();

  static const db = AppointmentRepository._();

  @override
  int? id;

  int tattooArtistId;

  _i2.TattooArtist? tattooArtist;

  int workplaceId;

  _i3.Workplace? workplace;

  int? tattooProjectId;

  _i4.TattooProject? tattooProject;

  DateTime start;

  DateTime end;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'tattooArtistId': tattooArtistId,
      if (tattooArtist != null)
        'tattooArtist': tattooArtist?.toJsonForProtocol(),
      'workplaceId': workplaceId,
      if (workplace != null) 'workplace': workplace?.toJsonForProtocol(),
      if (tattooProjectId != null) 'tattooProjectId': tattooProjectId,
      if (tattooProject != null)
        'tattooProject': tattooProject?.toJsonForProtocol(),
      'start': start.toJson(),
      'end': end.toJson(),
    };
  }

  static AppointmentInclude include({
    _i2.TattooArtistInclude? tattooArtist,
    _i3.WorkplaceInclude? workplace,
    _i4.TattooProjectInclude? tattooProject,
  }) {
    return AppointmentInclude._(
      tattooArtist: tattooArtist,
      workplace: workplace,
      tattooProject: tattooProject,
    );
  }

  static AppointmentIncludeList includeList({
    _i1.WhereExpressionBuilder<AppointmentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppointmentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppointmentTable>? orderByList,
    AppointmentInclude? include,
  }) {
    return AppointmentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Appointment.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Appointment.t),
      include: include,
    );
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

class AppointmentTable extends _i1.Table {
  AppointmentTable({super.tableRelation}) : super(tableName: 'appointment') {
    tattooArtistId = _i1.ColumnInt(
      'tattooArtistId',
      this,
    );
    workplaceId = _i1.ColumnInt(
      'workplaceId',
      this,
    );
    tattooProjectId = _i1.ColumnInt(
      'tattooProjectId',
      this,
    );
    start = _i1.ColumnDateTime(
      'start',
      this,
    );
    end = _i1.ColumnDateTime(
      'end',
      this,
    );
  }

  late final _i1.ColumnInt tattooArtistId;

  _i2.TattooArtistTable? _tattooArtist;

  late final _i1.ColumnInt workplaceId;

  _i3.WorkplaceTable? _workplace;

  late final _i1.ColumnInt tattooProjectId;

  _i4.TattooProjectTable? _tattooProject;

  late final _i1.ColumnDateTime start;

  late final _i1.ColumnDateTime end;

  _i2.TattooArtistTable get tattooArtist {
    if (_tattooArtist != null) return _tattooArtist!;
    _tattooArtist = _i1.createRelationTable(
      relationFieldName: 'tattooArtist',
      field: Appointment.t.tattooArtistId,
      foreignField: _i2.TattooArtist.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TattooArtistTable(tableRelation: foreignTableRelation),
    );
    return _tattooArtist!;
  }

  _i3.WorkplaceTable get workplace {
    if (_workplace != null) return _workplace!;
    _workplace = _i1.createRelationTable(
      relationFieldName: 'workplace',
      field: Appointment.t.workplaceId,
      foreignField: _i3.Workplace.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.WorkplaceTable(tableRelation: foreignTableRelation),
    );
    return _workplace!;
  }

  _i4.TattooProjectTable get tattooProject {
    if (_tattooProject != null) return _tattooProject!;
    _tattooProject = _i1.createRelationTable(
      relationFieldName: 'tattooProject',
      field: Appointment.t.tattooProjectId,
      foreignField: _i4.TattooProject.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.TattooProjectTable(tableRelation: foreignTableRelation),
    );
    return _tattooProject!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        tattooArtistId,
        workplaceId,
        tattooProjectId,
        start,
        end,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'tattooArtist') {
      return tattooArtist;
    }
    if (relationField == 'workplace') {
      return workplace;
    }
    if (relationField == 'tattooProject') {
      return tattooProject;
    }
    return null;
  }
}

class AppointmentInclude extends _i1.IncludeObject {
  AppointmentInclude._({
    _i2.TattooArtistInclude? tattooArtist,
    _i3.WorkplaceInclude? workplace,
    _i4.TattooProjectInclude? tattooProject,
  }) {
    _tattooArtist = tattooArtist;
    _workplace = workplace;
    _tattooProject = tattooProject;
  }

  _i2.TattooArtistInclude? _tattooArtist;

  _i3.WorkplaceInclude? _workplace;

  _i4.TattooProjectInclude? _tattooProject;

  @override
  Map<String, _i1.Include?> get includes => {
        'tattooArtist': _tattooArtist,
        'workplace': _workplace,
        'tattooProject': _tattooProject,
      };

  @override
  _i1.Table get table => Appointment.t;
}

class AppointmentIncludeList extends _i1.IncludeList {
  AppointmentIncludeList._({
    _i1.WhereExpressionBuilder<AppointmentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Appointment.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Appointment.t;
}

class AppointmentRepository {
  const AppointmentRepository._();

  final attachRow = const AppointmentAttachRowRepository._();

  final detachRow = const AppointmentDetachRowRepository._();

  /// Returns a list of [Appointment]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Appointment>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppointmentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppointmentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppointmentTable>? orderByList,
    _i1.Transaction? transaction,
    AppointmentInclude? include,
  }) async {
    return session.db.find<Appointment>(
      where: where?.call(Appointment.t),
      orderBy: orderBy?.call(Appointment.t),
      orderByList: orderByList?.call(Appointment.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Appointment] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Appointment?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppointmentTable>? where,
    int? offset,
    _i1.OrderByBuilder<AppointmentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppointmentTable>? orderByList,
    _i1.Transaction? transaction,
    AppointmentInclude? include,
  }) async {
    return session.db.findFirstRow<Appointment>(
      where: where?.call(Appointment.t),
      orderBy: orderBy?.call(Appointment.t),
      orderByList: orderByList?.call(Appointment.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Appointment] by its [id] or null if no such row exists.
  Future<Appointment?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    AppointmentInclude? include,
  }) async {
    return session.db.findById<Appointment>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Appointment]s in the list and returns the inserted rows.
  ///
  /// The returned [Appointment]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Appointment>> insert(
    _i1.Session session,
    List<Appointment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Appointment>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Appointment] and returns the inserted row.
  ///
  /// The returned [Appointment] will have its `id` field set.
  Future<Appointment> insertRow(
    _i1.Session session,
    Appointment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Appointment>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Appointment]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Appointment>> update(
    _i1.Session session,
    List<Appointment> rows, {
    _i1.ColumnSelections<AppointmentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Appointment>(
      rows,
      columns: columns?.call(Appointment.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Appointment]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Appointment> updateRow(
    _i1.Session session,
    Appointment row, {
    _i1.ColumnSelections<AppointmentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Appointment>(
      row,
      columns: columns?.call(Appointment.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Appointment]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Appointment>> delete(
    _i1.Session session,
    List<Appointment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Appointment>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Appointment].
  Future<Appointment> deleteRow(
    _i1.Session session,
    Appointment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Appointment>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Appointment>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AppointmentTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Appointment>(
      where: where(Appointment.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppointmentTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Appointment>(
      where: where?.call(Appointment.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AppointmentAttachRowRepository {
  const AppointmentAttachRowRepository._();

  /// Creates a relation between the given [Appointment] and [TattooArtist]
  /// by setting the [Appointment]'s foreign key `tattooArtistId` to refer to the [TattooArtist].
  Future<void> tattooArtist(
    _i1.Session session,
    Appointment appointment,
    _i2.TattooArtist tattooArtist, {
    _i1.Transaction? transaction,
  }) async {
    if (appointment.id == null) {
      throw ArgumentError.notNull('appointment.id');
    }
    if (tattooArtist.id == null) {
      throw ArgumentError.notNull('tattooArtist.id');
    }

    var $appointment = appointment.copyWith(tattooArtistId: tattooArtist.id);
    await session.db.updateRow<Appointment>(
      $appointment,
      columns: [Appointment.t.tattooArtistId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Appointment] and [Workplace]
  /// by setting the [Appointment]'s foreign key `workplaceId` to refer to the [Workplace].
  Future<void> workplace(
    _i1.Session session,
    Appointment appointment,
    _i3.Workplace workplace, {
    _i1.Transaction? transaction,
  }) async {
    if (appointment.id == null) {
      throw ArgumentError.notNull('appointment.id');
    }
    if (workplace.id == null) {
      throw ArgumentError.notNull('workplace.id');
    }

    var $appointment = appointment.copyWith(workplaceId: workplace.id);
    await session.db.updateRow<Appointment>(
      $appointment,
      columns: [Appointment.t.workplaceId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Appointment] and [TattooProject]
  /// by setting the [Appointment]'s foreign key `tattooProjectId` to refer to the [TattooProject].
  Future<void> tattooProject(
    _i1.Session session,
    Appointment appointment,
    _i4.TattooProject tattooProject, {
    _i1.Transaction? transaction,
  }) async {
    if (appointment.id == null) {
      throw ArgumentError.notNull('appointment.id');
    }
    if (tattooProject.id == null) {
      throw ArgumentError.notNull('tattooProject.id');
    }

    var $appointment = appointment.copyWith(tattooProjectId: tattooProject.id);
    await session.db.updateRow<Appointment>(
      $appointment,
      columns: [Appointment.t.tattooProjectId],
      transaction: transaction,
    );
  }
}

class AppointmentDetachRowRepository {
  const AppointmentDetachRowRepository._();

  /// Detaches the relation between this [Appointment] and the [TattooProject] set in `tattooProject`
  /// by setting the [Appointment]'s foreign key `tattooProjectId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> tattooProject(
    _i1.Session session,
    Appointment appointment, {
    _i1.Transaction? transaction,
  }) async {
    if (appointment.id == null) {
      throw ArgumentError.notNull('appointment.id');
    }

    var $appointment = appointment.copyWith(tattooProjectId: null);
    await session.db.updateRow<Appointment>(
      $appointment,
      columns: [Appointment.t.tattooProjectId],
      transaction: transaction,
    );
  }
}
