/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import '../../protocol.dart' as _i1;
import 'package:serverpod/serverpod.dart' as _i2;
import '../../features/tattoo_artist/tattoo_artist.dart' as _i3;
import '../../features/workplace/workplace.dart' as _i4;
import '../../features/availability/availability_type.dart' as _i5;
import '../../features/availability/recurring_pattern.dart' as _i6;
import 'package:octattoo_server/src/generated/protocol.dart' as _i7;

/// Availability model representing the availability slots of tattoo artists at workplaces
abstract class Availability extends _i1.BaseClass
    implements _i2.TableRow<_i2.UuidValue?>, _i2.ProtocolSerialization {
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

  static final t = AvailabilityTable();

  static const db = AvailabilityRepository._();

  @override
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

  @override
  _i2.Table<_i2.UuidValue?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Availability',
      if (id != null) 'id': id?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'tattooArtistId': tattooArtistId.toJson(),
      if (tattooArtist != null)
        'tattooArtist': tattooArtist?.toJsonForProtocol(),
      'workplaceId': workplaceId.toJson(),
      if (workplace != null) 'workplace': workplace?.toJsonForProtocol(),
      'startDate': startDate.toJson(),
      'endDate': endDate.toJson(),
      'type': type.toJson(),
      if (recurringPatterns != null)
        'recurringPatterns': recurringPatterns?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static AvailabilityInclude include({
    _i3.TattooArtistInclude? tattooArtist,
    _i4.WorkplaceInclude? workplace,
    _i6.RecurringPatternIncludeList? recurringPatterns,
  }) {
    return AvailabilityInclude._(
      tattooArtist: tattooArtist,
      workplace: workplace,
      recurringPatterns: recurringPatterns,
    );
  }

  static AvailabilityIncludeList includeList({
    _i2.WhereExpressionBuilder<AvailabilityTable>? where,
    int? limit,
    int? offset,
    _i2.OrderByBuilder<AvailabilityTable>? orderBy,
    bool orderDescending = false,
    _i2.OrderByListBuilder<AvailabilityTable>? orderByList,
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

class AvailabilityUpdateTable extends _i2.UpdateTable<AvailabilityTable> {
  AvailabilityUpdateTable(super.table);

  _i2.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i2.ColumnValue(
        table.createdAt,
        value,
      );

  _i2.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i2.ColumnValue(
        table.updatedAt,
        value,
      );

  _i2.ColumnValue<_i2.UuidValue, _i2.UuidValue> tattooArtistId(
    _i2.UuidValue value,
  ) => _i2.ColumnValue(
    table.tattooArtistId,
    value,
  );

  _i2.ColumnValue<_i2.UuidValue, _i2.UuidValue> workplaceId(
    _i2.UuidValue value,
  ) => _i2.ColumnValue(
    table.workplaceId,
    value,
  );

  _i2.ColumnValue<DateTime, DateTime> startDate(DateTime value) =>
      _i2.ColumnValue(
        table.startDate,
        value,
      );

  _i2.ColumnValue<DateTime, DateTime> endDate(DateTime value) =>
      _i2.ColumnValue(
        table.endDate,
        value,
      );

  _i2.ColumnValue<_i5.AvailabilityType, _i5.AvailabilityType> type(
    _i5.AvailabilityType value,
  ) => _i2.ColumnValue(
    table.type,
    value,
  );
}

class AvailabilityTable extends _i2.Table<_i2.UuidValue?> {
  AvailabilityTable({super.tableRelation}) : super(tableName: 'availability') {
    updateTable = AvailabilityUpdateTable(this);
    createdAt = _i2.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    updatedAt = _i2.ColumnDateTime(
      'updatedAt',
      this,
      hasDefault: true,
    );
    tattooArtistId = _i2.ColumnUuid(
      'tattooArtistId',
      this,
    );
    workplaceId = _i2.ColumnUuid(
      'workplaceId',
      this,
    );
    startDate = _i2.ColumnDateTime(
      'startDate',
      this,
    );
    endDate = _i2.ColumnDateTime(
      'endDate',
      this,
    );
    type = _i2.ColumnEnum(
      'type',
      this,
      _i2.EnumSerialization.byName,
    );
  }

  late final AvailabilityUpdateTable updateTable;

  /// Timestamp of creation
  late final _i2.ColumnDateTime createdAt;

  /// Timestamp of last update
  late final _i2.ColumnDateTime updatedAt;

  late final _i2.ColumnUuid tattooArtistId;

  /// Reference to the tattoo artist associated with the availability
  _i3.TattooArtistTable? _tattooArtist;

  late final _i2.ColumnUuid workplaceId;

  /// Reference to the workplace associated with the availability
  _i4.WorkplaceTable? _workplace;

  late final _i2.ColumnDateTime startDate;

  late final _i2.ColumnDateTime endDate;

  /// Type of availability
  late final _i2.ColumnEnum<_i5.AvailabilityType> type;

  _i6.RecurringPatternTable? ___recurringPatterns;

  _i2.ManyRelation<_i6.RecurringPatternTable>? _recurringPatterns;

  _i3.TattooArtistTable get tattooArtist {
    if (_tattooArtist != null) return _tattooArtist!;
    _tattooArtist = _i2.createRelationTable(
      relationFieldName: 'tattooArtist',
      field: Availability.t.tattooArtistId,
      foreignField: _i3.TattooArtist.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.TattooArtistTable(tableRelation: foreignTableRelation),
    );
    return _tattooArtist!;
  }

  _i4.WorkplaceTable get workplace {
    if (_workplace != null) return _workplace!;
    _workplace = _i2.createRelationTable(
      relationFieldName: 'workplace',
      field: Availability.t.workplaceId,
      foreignField: _i4.Workplace.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.WorkplaceTable(tableRelation: foreignTableRelation),
    );
    return _workplace!;
  }

  _i6.RecurringPatternTable get __recurringPatterns {
    if (___recurringPatterns != null) return ___recurringPatterns!;
    ___recurringPatterns = _i2.createRelationTable(
      relationFieldName: '__recurringPatterns',
      field: Availability.t.id,
      foreignField: _i6.RecurringPattern.t.availabilityId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.RecurringPatternTable(tableRelation: foreignTableRelation),
    );
    return ___recurringPatterns!;
  }

  _i2.ManyRelation<_i6.RecurringPatternTable> get recurringPatterns {
    if (_recurringPatterns != null) return _recurringPatterns!;
    var relationTable = _i2.createRelationTable(
      relationFieldName: 'recurringPatterns',
      field: Availability.t.id,
      foreignField: _i6.RecurringPattern.t.availabilityId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.RecurringPatternTable(tableRelation: foreignTableRelation),
    );
    _recurringPatterns = _i2.ManyRelation<_i6.RecurringPatternTable>(
      tableWithRelations: relationTable,
      table: _i6.RecurringPatternTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _recurringPatterns!;
  }

  @override
  List<_i2.Column> get columns => [
    id,
    createdAt,
    updatedAt,
    tattooArtistId,
    workplaceId,
    startDate,
    endDate,
    type,
  ];

  @override
  _i2.Table? getRelationTable(String relationField) {
    if (relationField == 'tattooArtist') {
      return tattooArtist;
    }
    if (relationField == 'workplace') {
      return workplace;
    }
    if (relationField == 'recurringPatterns') {
      return __recurringPatterns;
    }
    return null;
  }
}

class AvailabilityInclude extends _i2.IncludeObject {
  AvailabilityInclude._({
    _i3.TattooArtistInclude? tattooArtist,
    _i4.WorkplaceInclude? workplace,
    _i6.RecurringPatternIncludeList? recurringPatterns,
  }) {
    _tattooArtist = tattooArtist;
    _workplace = workplace;
    _recurringPatterns = recurringPatterns;
  }

  _i3.TattooArtistInclude? _tattooArtist;

  _i4.WorkplaceInclude? _workplace;

  _i6.RecurringPatternIncludeList? _recurringPatterns;

  @override
  Map<String, _i2.Include?> get includes => {
    'tattooArtist': _tattooArtist,
    'workplace': _workplace,
    'recurringPatterns': _recurringPatterns,
  };

  @override
  _i2.Table<_i2.UuidValue?> get table => Availability.t;
}

class AvailabilityIncludeList extends _i2.IncludeList {
  AvailabilityIncludeList._({
    _i2.WhereExpressionBuilder<AvailabilityTable>? where,
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
  Map<String, _i2.Include?> get includes => include?.includes ?? {};

  @override
  _i2.Table<_i2.UuidValue?> get table => Availability.t;
}

class AvailabilityRepository {
  const AvailabilityRepository._();

  final attach = const AvailabilityAttachRepository._();

  final attachRow = const AvailabilityAttachRowRepository._();

  final detach = const AvailabilityDetachRepository._();

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
    _i2.Session session, {
    _i2.WhereExpressionBuilder<AvailabilityTable>? where,
    int? limit,
    int? offset,
    _i2.OrderByBuilder<AvailabilityTable>? orderBy,
    bool orderDescending = false,
    _i2.OrderByListBuilder<AvailabilityTable>? orderByList,
    _i2.Transaction? transaction,
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
    _i2.Session session, {
    _i2.WhereExpressionBuilder<AvailabilityTable>? where,
    int? offset,
    _i2.OrderByBuilder<AvailabilityTable>? orderBy,
    bool orderDescending = false,
    _i2.OrderByListBuilder<AvailabilityTable>? orderByList,
    _i2.Transaction? transaction,
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
    _i2.Session session,
    _i2.UuidValue id, {
    _i2.Transaction? transaction,
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
    _i2.Session session,
    List<Availability> rows, {
    _i2.Transaction? transaction,
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
    _i2.Session session,
    Availability row, {
    _i2.Transaction? transaction,
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
    _i2.Session session,
    List<Availability> rows, {
    _i2.ColumnSelections<AvailabilityTable>? columns,
    _i2.Transaction? transaction,
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
    _i2.Session session,
    Availability row, {
    _i2.ColumnSelections<AvailabilityTable>? columns,
    _i2.Transaction? transaction,
  }) async {
    return session.db.updateRow<Availability>(
      row,
      columns: columns?.call(Availability.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Availability] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Availability?> updateById(
    _i2.Session session,
    _i2.UuidValue id, {
    required _i2.ColumnValueListBuilder<AvailabilityUpdateTable> columnValues,
    _i2.Transaction? transaction,
  }) async {
    return session.db.updateById<Availability>(
      id,
      columnValues: columnValues(Availability.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Availability]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Availability>> updateWhere(
    _i2.Session session, {
    required _i2.ColumnValueListBuilder<AvailabilityUpdateTable> columnValues,
    required _i2.WhereExpressionBuilder<AvailabilityTable> where,
    int? limit,
    int? offset,
    _i2.OrderByBuilder<AvailabilityTable>? orderBy,
    _i2.OrderByListBuilder<AvailabilityTable>? orderByList,
    bool orderDescending = false,
    _i2.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Availability>(
      columnValues: columnValues(Availability.t.updateTable),
      where: where(Availability.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Availability.t),
      orderByList: orderByList?.call(Availability.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Availability]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Availability>> delete(
    _i2.Session session,
    List<Availability> rows, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.delete<Availability>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Availability].
  Future<Availability> deleteRow(
    _i2.Session session,
    Availability row, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Availability>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Availability>> deleteWhere(
    _i2.Session session, {
    required _i2.WhereExpressionBuilder<AvailabilityTable> where,
    _i2.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Availability>(
      where: where(Availability.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i2.Session session, {
    _i2.WhereExpressionBuilder<AvailabilityTable>? where,
    int? limit,
    _i2.Transaction? transaction,
  }) async {
    return session.db.count<Availability>(
      where: where?.call(Availability.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AvailabilityAttachRepository {
  const AvailabilityAttachRepository._();

  /// Creates a relation between this [Availability] and the given [RecurringPattern]s
  /// by setting each [RecurringPattern]'s foreign key `availabilityId` to refer to this [Availability].
  Future<void> recurringPatterns(
    _i2.Session session,
    Availability availability,
    List<_i6.RecurringPattern> recurringPattern, {
    _i2.Transaction? transaction,
  }) async {
    if (recurringPattern.any((e) => e.id == null)) {
      throw ArgumentError.notNull('recurringPattern.id');
    }
    if (availability.id == null) {
      throw ArgumentError.notNull('availability.id');
    }

    var $recurringPattern = recurringPattern
        .map((e) => e.copyWith(availabilityId: availability.id))
        .toList();
    await session.db.update<_i6.RecurringPattern>(
      $recurringPattern,
      columns: [_i6.RecurringPattern.t.availabilityId],
      transaction: transaction,
    );
  }
}

class AvailabilityAttachRowRepository {
  const AvailabilityAttachRowRepository._();

  /// Creates a relation between the given [Availability] and [TattooArtist]
  /// by setting the [Availability]'s foreign key `tattooArtistId` to refer to the [TattooArtist].
  Future<void> tattooArtist(
    _i2.Session session,
    Availability availability,
    _i3.TattooArtist tattooArtist, {
    _i2.Transaction? transaction,
  }) async {
    if (availability.id == null) {
      throw ArgumentError.notNull('availability.id');
    }
    if (tattooArtist.id == null) {
      throw ArgumentError.notNull('tattooArtist.id');
    }

    var $availability = availability.copyWith(tattooArtistId: tattooArtist.id);
    await session.db.updateRow<Availability>(
      $availability,
      columns: [Availability.t.tattooArtistId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Availability] and [Workplace]
  /// by setting the [Availability]'s foreign key `workplaceId` to refer to the [Workplace].
  Future<void> workplace(
    _i2.Session session,
    Availability availability,
    _i4.Workplace workplace, {
    _i2.Transaction? transaction,
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

  /// Creates a relation between this [Availability] and the given [RecurringPattern]
  /// by setting the [RecurringPattern]'s foreign key `availabilityId` to refer to this [Availability].
  Future<void> recurringPatterns(
    _i2.Session session,
    Availability availability,
    _i6.RecurringPattern recurringPattern, {
    _i2.Transaction? transaction,
  }) async {
    if (recurringPattern.id == null) {
      throw ArgumentError.notNull('recurringPattern.id');
    }
    if (availability.id == null) {
      throw ArgumentError.notNull('availability.id');
    }

    var $recurringPattern = recurringPattern.copyWith(
      availabilityId: availability.id,
    );
    await session.db.updateRow<_i6.RecurringPattern>(
      $recurringPattern,
      columns: [_i6.RecurringPattern.t.availabilityId],
      transaction: transaction,
    );
  }
}

class AvailabilityDetachRepository {
  const AvailabilityDetachRepository._();

  /// Detaches the relation between this [Availability] and the given [RecurringPattern]
  /// by setting the [RecurringPattern]'s foreign key `availabilityId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> recurringPatterns(
    _i2.Session session,
    List<_i6.RecurringPattern> recurringPattern, {
    _i2.Transaction? transaction,
  }) async {
    if (recurringPattern.any((e) => e.id == null)) {
      throw ArgumentError.notNull('recurringPattern.id');
    }

    var $recurringPattern = recurringPattern
        .map((e) => e.copyWith(availabilityId: null))
        .toList();
    await session.db.update<_i6.RecurringPattern>(
      $recurringPattern,
      columns: [_i6.RecurringPattern.t.availabilityId],
      transaction: transaction,
    );
  }
}

class AvailabilityDetachRowRepository {
  const AvailabilityDetachRowRepository._();

  /// Detaches the relation between this [Availability] and the given [RecurringPattern]
  /// by setting the [RecurringPattern]'s foreign key `availabilityId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> recurringPatterns(
    _i2.Session session,
    _i6.RecurringPattern recurringPattern, {
    _i2.Transaction? transaction,
  }) async {
    if (recurringPattern.id == null) {
      throw ArgumentError.notNull('recurringPattern.id');
    }

    var $recurringPattern = recurringPattern.copyWith(availabilityId: null);
    await session.db.updateRow<_i6.RecurringPattern>(
      $recurringPattern,
      columns: [_i6.RecurringPattern.t.availabilityId],
      transaction: transaction,
    );
  }
}
