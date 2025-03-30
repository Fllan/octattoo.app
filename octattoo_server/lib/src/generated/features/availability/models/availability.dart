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
import '../../../features/user/models/user.dart' as _i2;
import '../../../features/workplace/models/workplace.dart' as _i3;
import '../../../features/availability/models/availability_type.dart' as _i4;

/// An Availability is a timeframe set by a User to manage the TattooArtist availabilities
abstract class Availability implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = AvailabilityTable();

  static const db = AvailabilityRepository._();

  @override
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

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'createdById': createdById,
      if (createdBy != null) 'createdBy': createdBy?.toJsonForProtocol(),
      'createdAt': createdAt.toJson(),
      if (workplaceId != null) 'workplaceId': workplaceId,
      if (workplace != null) 'workplace': workplace?.toJsonForProtocol(),
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

  static AvailabilityInclude include({
    _i2.UserInclude? createdBy,
    _i3.WorkplaceInclude? workplace,
  }) {
    return AvailabilityInclude._(
      createdBy: createdBy,
      workplace: workplace,
    );
  }

  static AvailabilityIncludeList includeList({
    _i1.WhereExpressionBuilder<AvailabilityTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AvailabilityTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AvailabilityTable>? orderByList,
    AvailabilityInclude? include,
  }) {
    return AvailabilityIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Availability.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Availability.t),
      include: include,
    );
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

class AvailabilityTable extends _i1.Table {
  AvailabilityTable({super.tableRelation}) : super(tableName: 'availability') {
    createdById = _i1.ColumnInt(
      'createdById',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    workplaceId = _i1.ColumnInt(
      'workplaceId',
      this,
    );
    startDate = _i1.ColumnDateTime(
      'startDate',
      this,
    );
    endDate = _i1.ColumnDateTime(
      'endDate',
      this,
    );
    startTime = _i1.ColumnDateTime(
      'startTime',
      this,
    );
    endTime = _i1.ColumnDateTime(
      'endTime',
      this,
    );
    isFullDay = _i1.ColumnBool(
      'isFullDay',
      this,
    );
    isRecurring = _i1.ColumnBool(
      'isRecurring',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
  }

  late final _i1.ColumnInt createdById;

  _i2.UserTable? _createdBy;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnInt workplaceId;

  _i3.WorkplaceTable? _workplace;

  late final _i1.ColumnDateTime startDate;

  late final _i1.ColumnDateTime endDate;

  late final _i1.ColumnDateTime startTime;

  late final _i1.ColumnDateTime endTime;

  late final _i1.ColumnBool isFullDay;

  late final _i1.ColumnBool isRecurring;

  late final _i1.ColumnEnum<_i4.AvailabilityType> type;

  late final _i1.ColumnString title;

  _i2.UserTable get createdBy {
    if (_createdBy != null) return _createdBy!;
    _createdBy = _i1.createRelationTable(
      relationFieldName: 'createdBy',
      field: Availability.t.createdById,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _createdBy!;
  }

  _i3.WorkplaceTable get workplace {
    if (_workplace != null) return _workplace!;
    _workplace = _i1.createRelationTable(
      relationFieldName: 'workplace',
      field: Availability.t.workplaceId,
      foreignField: _i3.Workplace.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.WorkplaceTable(tableRelation: foreignTableRelation),
    );
    return _workplace!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        createdById,
        createdAt,
        workplaceId,
        startDate,
        endDate,
        startTime,
        endTime,
        isFullDay,
        isRecurring,
        type,
        title,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'createdBy') {
      return createdBy;
    }
    if (relationField == 'workplace') {
      return workplace;
    }
    return null;
  }
}

class AvailabilityInclude extends _i1.IncludeObject {
  AvailabilityInclude._({
    _i2.UserInclude? createdBy,
    _i3.WorkplaceInclude? workplace,
  }) {
    _createdBy = createdBy;
    _workplace = workplace;
  }

  _i2.UserInclude? _createdBy;

  _i3.WorkplaceInclude? _workplace;

  @override
  Map<String, _i1.Include?> get includes => {
        'createdBy': _createdBy,
        'workplace': _workplace,
      };

  @override
  _i1.Table get table => Availability.t;
}

class AvailabilityIncludeList extends _i1.IncludeList {
  AvailabilityIncludeList._({
    _i1.WhereExpressionBuilder<AvailabilityTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Availability.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Availability.t;
}

class AvailabilityRepository {
  const AvailabilityRepository._();

  final attachRow = const AvailabilityAttachRowRepository._();

  final detachRow = const AvailabilityDetachRowRepository._();

  /// Returns a list of [Availability]s matching the given query parameters.
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
  Future<List<Availability>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AvailabilityTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AvailabilityTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AvailabilityTable>? orderByList,
    _i1.Transaction? transaction,
    AvailabilityInclude? include,
  }) async {
    return session.db.find<Availability>(
      where: where?.call(Availability.t),
      orderBy: orderBy?.call(Availability.t),
      orderByList: orderByList?.call(Availability.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Availability] matching the given query parameters.
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
  Future<Availability?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AvailabilityTable>? where,
    int? offset,
    _i1.OrderByBuilder<AvailabilityTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AvailabilityTable>? orderByList,
    _i1.Transaction? transaction,
    AvailabilityInclude? include,
  }) async {
    return session.db.findFirstRow<Availability>(
      where: where?.call(Availability.t),
      orderBy: orderBy?.call(Availability.t),
      orderByList: orderByList?.call(Availability.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Availability] by its [id] or null if no such row exists.
  Future<Availability?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    AvailabilityInclude? include,
  }) async {
    return session.db.findById<Availability>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Availability]s in the list and returns the inserted rows.
  ///
  /// The returned [Availability]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Availability>> insert(
    _i1.Session session,
    List<Availability> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Availability>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Availability] and returns the inserted row.
  ///
  /// The returned [Availability] will have its `id` field set.
  Future<Availability> insertRow(
    _i1.Session session,
    Availability row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Availability>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Availability]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Availability>> update(
    _i1.Session session,
    List<Availability> rows, {
    _i1.ColumnSelections<AvailabilityTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Availability>(
      rows,
      columns: columns?.call(Availability.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Availability]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Availability> updateRow(
    _i1.Session session,
    Availability row, {
    _i1.ColumnSelections<AvailabilityTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Availability>(
      row,
      columns: columns?.call(Availability.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Availability]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Availability>> delete(
    _i1.Session session,
    List<Availability> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Availability>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Availability].
  Future<Availability> deleteRow(
    _i1.Session session,
    Availability row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Availability>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Availability>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AvailabilityTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Availability>(
      where: where(Availability.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AvailabilityTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Availability>(
      where: where?.call(Availability.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AvailabilityAttachRowRepository {
  const AvailabilityAttachRowRepository._();

  /// Creates a relation between the given [Availability] and [User]
  /// by setting the [Availability]'s foreign key `createdById` to refer to the [User].
  Future<void> createdBy(
    _i1.Session session,
    Availability availability,
    _i2.User createdBy, {
    _i1.Transaction? transaction,
  }) async {
    if (availability.id == null) {
      throw ArgumentError.notNull('availability.id');
    }
    if (createdBy.id == null) {
      throw ArgumentError.notNull('createdBy.id');
    }

    var $availability = availability.copyWith(createdById: createdBy.id);
    await session.db.updateRow<Availability>(
      $availability,
      columns: [Availability.t.createdById],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Availability] and [Workplace]
  /// by setting the [Availability]'s foreign key `workplaceId` to refer to the [Workplace].
  Future<void> workplace(
    _i1.Session session,
    Availability availability,
    _i3.Workplace workplace, {
    _i1.Transaction? transaction,
  }) async {
    if (availability.id == null) {
      throw ArgumentError.notNull('availability.id');
    }
    if (workplace.id == null) {
      throw ArgumentError.notNull('workplace.id');
    }

    var $availability = availability.copyWith(workplaceId: workplace.id);
    await session.db.updateRow<Availability>(
      $availability,
      columns: [Availability.t.workplaceId],
      transaction: transaction,
    );
  }
}

class AvailabilityDetachRowRepository {
  const AvailabilityDetachRowRepository._();

  /// Detaches the relation between this [Availability] and the [Workplace] set in `workplace`
  /// by setting the [Availability]'s foreign key `workplaceId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> workplace(
    _i1.Session session,
    Availability availability, {
    _i1.Transaction? transaction,
  }) async {
    if (availability.id == null) {
      throw ArgumentError.notNull('availability.id');
    }

    var $availability = availability.copyWith(workplaceId: null);
    await session.db.updateRow<Availability>(
      $availability,
      columns: [Availability.t.workplaceId],
      transaction: transaction,
    );
  }
}
