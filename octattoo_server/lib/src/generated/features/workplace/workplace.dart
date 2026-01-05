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
import '../../features/availability/availability.dart' as _i3;
import 'package:octattoo_server/src/generated/protocol.dart' as _i4;

abstract class Workplace extends _i1.BaseClass
    implements _i2.TableRow<_i2.UuidValue?>, _i2.ProtocolSerialization {
  Workplace._({
    this.id,
    super.createdAt,
    super.updatedAt,
    required this.name,
    required this.address,
    this.availabilities,
  });

  factory Workplace({
    _i2.UuidValue? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    required String name,
    required String address,
    List<_i3.Availability>? availabilities,
  }) = _WorkplaceImpl;

  factory Workplace.fromJson(Map<String, dynamic> jsonSerialization) {
    return Workplace(
      id: jsonSerialization['id'] == null
          ? null
          : _i2.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      createdAt: _i2.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i2.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      name: jsonSerialization['name'] as String,
      address: jsonSerialization['address'] as String,
      availabilities: jsonSerialization['availabilities'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.Availability>>(
              jsonSerialization['availabilities'],
            ),
    );
  }

  static final t = WorkplaceTable();

  static const db = WorkplaceRepository._();

  @override
  _i2.UuidValue? id;

  String name;

  String address;

  List<_i3.Availability>? availabilities;

  @override
  _i2.Table<_i2.UuidValue?> get table => t;

  /// Returns a shallow copy of this [Workplace]
  /// with some or all fields replaced by the given arguments.
  @override
  @_i2.useResult
  Workplace copyWith({
    Object? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? address,
    List<_i3.Availability>? availabilities,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Workplace',
      if (id != null) 'id': id?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'name': name,
      'address': address,
      if (availabilities != null)
        'availabilities': availabilities?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Workplace',
      if (id != null) 'id': id?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'name': name,
      'address': address,
      if (availabilities != null)
        'availabilities': availabilities?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static WorkplaceInclude include({
    _i3.AvailabilityIncludeList? availabilities,
  }) {
    return WorkplaceInclude._(availabilities: availabilities);
  }

  static WorkplaceIncludeList includeList({
    _i2.WhereExpressionBuilder<WorkplaceTable>? where,
    int? limit,
    int? offset,
    _i2.OrderByBuilder<WorkplaceTable>? orderBy,
    bool orderDescending = false,
    _i2.OrderByListBuilder<WorkplaceTable>? orderByList,
    WorkplaceInclude? include,
  }) {
    return WorkplaceIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Workplace.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Workplace.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i2.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WorkplaceImpl extends Workplace {
  _WorkplaceImpl({
    _i2.UuidValue? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    required String name,
    required String address,
    List<_i3.Availability>? availabilities,
  }) : super._(
         id: id,
         createdAt: createdAt,
         updatedAt: updatedAt,
         name: name,
         address: address,
         availabilities: availabilities,
       );

  /// Returns a shallow copy of this [Workplace]
  /// with some or all fields replaced by the given arguments.
  @_i2.useResult
  @override
  Workplace copyWith({
    Object? id = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? address,
    Object? availabilities = _Undefined,
  }) {
    return Workplace(
      id: id is _i2.UuidValue? ? id : this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      address: address ?? this.address,
      availabilities: availabilities is List<_i3.Availability>?
          ? availabilities
          : this.availabilities?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class WorkplaceUpdateTable extends _i2.UpdateTable<WorkplaceTable> {
  WorkplaceUpdateTable(super.table);

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

  _i2.ColumnValue<String, String> name(String value) => _i2.ColumnValue(
    table.name,
    value,
  );

  _i2.ColumnValue<String, String> address(String value) => _i2.ColumnValue(
    table.address,
    value,
  );
}

class WorkplaceTable extends _i2.Table<_i2.UuidValue?> {
  WorkplaceTable({super.tableRelation}) : super(tableName: 'workplace') {
    updateTable = WorkplaceUpdateTable(this);
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
    name = _i2.ColumnString(
      'name',
      this,
    );
    address = _i2.ColumnString(
      'address',
      this,
    );
  }

  late final WorkplaceUpdateTable updateTable;

  /// Timestamp of creation
  late final _i2.ColumnDateTime createdAt;

  /// Timestamp of last update
  late final _i2.ColumnDateTime updatedAt;

  late final _i2.ColumnString name;

  late final _i2.ColumnString address;

  _i3.AvailabilityTable? ___availabilities;

  _i2.ManyRelation<_i3.AvailabilityTable>? _availabilities;

  _i3.AvailabilityTable get __availabilities {
    if (___availabilities != null) return ___availabilities!;
    ___availabilities = _i2.createRelationTable(
      relationFieldName: '__availabilities',
      field: Workplace.t.id,
      foreignField: _i3.Availability.t.workplaceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.AvailabilityTable(tableRelation: foreignTableRelation),
    );
    return ___availabilities!;
  }

  _i2.ManyRelation<_i3.AvailabilityTable> get availabilities {
    if (_availabilities != null) return _availabilities!;
    var relationTable = _i2.createRelationTable(
      relationFieldName: 'availabilities',
      field: Workplace.t.id,
      foreignField: _i3.Availability.t.workplaceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.AvailabilityTable(tableRelation: foreignTableRelation),
    );
    _availabilities = _i2.ManyRelation<_i3.AvailabilityTable>(
      tableWithRelations: relationTable,
      table: _i3.AvailabilityTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _availabilities!;
  }

  @override
  List<_i2.Column> get columns => [
    id,
    createdAt,
    updatedAt,
    name,
    address,
  ];

  @override
  _i2.Table? getRelationTable(String relationField) {
    if (relationField == 'availabilities') {
      return __availabilities;
    }
    return null;
  }
}

class WorkplaceInclude extends _i2.IncludeObject {
  WorkplaceInclude._({_i3.AvailabilityIncludeList? availabilities}) {
    _availabilities = availabilities;
  }

  _i3.AvailabilityIncludeList? _availabilities;

  @override
  Map<String, _i2.Include?> get includes => {'availabilities': _availabilities};

  @override
  _i2.Table<_i2.UuidValue?> get table => Workplace.t;
}

class WorkplaceIncludeList extends _i2.IncludeList {
  WorkplaceIncludeList._({
    _i2.WhereExpressionBuilder<WorkplaceTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Workplace.t);
  }

  @override
  Map<String, _i2.Include?> get includes => include?.includes ?? {};

  @override
  _i2.Table<_i2.UuidValue?> get table => Workplace.t;
}

class WorkplaceRepository {
  const WorkplaceRepository._();

  final attach = const WorkplaceAttachRepository._();

  final attachRow = const WorkplaceAttachRowRepository._();

  /// Returns a list of [Workplace]s matching the given query parameters.
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
  Future<List<Workplace>> find(
    _i2.Session session, {
    _i2.WhereExpressionBuilder<WorkplaceTable>? where,
    int? limit,
    int? offset,
    _i2.OrderByBuilder<WorkplaceTable>? orderBy,
    bool orderDescending = false,
    _i2.OrderByListBuilder<WorkplaceTable>? orderByList,
    _i2.Transaction? transaction,
    WorkplaceInclude? include,
  }) async {
    return session.db.find<Workplace>(
      where: where?.call(Workplace.t),
      orderBy: orderBy?.call(Workplace.t),
      orderByList: orderByList?.call(Workplace.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Workplace] matching the given query parameters.
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
  Future<Workplace?> findFirstRow(
    _i2.Session session, {
    _i2.WhereExpressionBuilder<WorkplaceTable>? where,
    int? offset,
    _i2.OrderByBuilder<WorkplaceTable>? orderBy,
    bool orderDescending = false,
    _i2.OrderByListBuilder<WorkplaceTable>? orderByList,
    _i2.Transaction? transaction,
    WorkplaceInclude? include,
  }) async {
    return session.db.findFirstRow<Workplace>(
      where: where?.call(Workplace.t),
      orderBy: orderBy?.call(Workplace.t),
      orderByList: orderByList?.call(Workplace.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Workplace] by its [id] or null if no such row exists.
  Future<Workplace?> findById(
    _i2.Session session,
    _i2.UuidValue id, {
    _i2.Transaction? transaction,
    WorkplaceInclude? include,
  }) async {
    return session.db.findById<Workplace>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Workplace]s in the list and returns the inserted rows.
  ///
  /// The returned [Workplace]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Workplace>> insert(
    _i2.Session session,
    List<Workplace> rows, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.insert<Workplace>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Workplace] and returns the inserted row.
  ///
  /// The returned [Workplace] will have its `id` field set.
  Future<Workplace> insertRow(
    _i2.Session session,
    Workplace row, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.insertRow<Workplace>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Workplace]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Workplace>> update(
    _i2.Session session,
    List<Workplace> rows, {
    _i2.ColumnSelections<WorkplaceTable>? columns,
    _i2.Transaction? transaction,
  }) async {
    return session.db.update<Workplace>(
      rows,
      columns: columns?.call(Workplace.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Workplace]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Workplace> updateRow(
    _i2.Session session,
    Workplace row, {
    _i2.ColumnSelections<WorkplaceTable>? columns,
    _i2.Transaction? transaction,
  }) async {
    return session.db.updateRow<Workplace>(
      row,
      columns: columns?.call(Workplace.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Workplace] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Workplace?> updateById(
    _i2.Session session,
    _i2.UuidValue id, {
    required _i2.ColumnValueListBuilder<WorkplaceUpdateTable> columnValues,
    _i2.Transaction? transaction,
  }) async {
    return session.db.updateById<Workplace>(
      id,
      columnValues: columnValues(Workplace.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Workplace]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Workplace>> updateWhere(
    _i2.Session session, {
    required _i2.ColumnValueListBuilder<WorkplaceUpdateTable> columnValues,
    required _i2.WhereExpressionBuilder<WorkplaceTable> where,
    int? limit,
    int? offset,
    _i2.OrderByBuilder<WorkplaceTable>? orderBy,
    _i2.OrderByListBuilder<WorkplaceTable>? orderByList,
    bool orderDescending = false,
    _i2.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Workplace>(
      columnValues: columnValues(Workplace.t.updateTable),
      where: where(Workplace.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Workplace.t),
      orderByList: orderByList?.call(Workplace.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Workplace]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Workplace>> delete(
    _i2.Session session,
    List<Workplace> rows, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.delete<Workplace>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Workplace].
  Future<Workplace> deleteRow(
    _i2.Session session,
    Workplace row, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Workplace>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Workplace>> deleteWhere(
    _i2.Session session, {
    required _i2.WhereExpressionBuilder<WorkplaceTable> where,
    _i2.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Workplace>(
      where: where(Workplace.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i2.Session session, {
    _i2.WhereExpressionBuilder<WorkplaceTable>? where,
    int? limit,
    _i2.Transaction? transaction,
  }) async {
    return session.db.count<Workplace>(
      where: where?.call(Workplace.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class WorkplaceAttachRepository {
  const WorkplaceAttachRepository._();

  /// Creates a relation between this [Workplace] and the given [Availability]s
  /// by setting each [Availability]'s foreign key `workplaceId` to refer to this [Workplace].
  Future<void> availabilities(
    _i2.Session session,
    Workplace workplace,
    List<_i3.Availability> availability, {
    _i2.Transaction? transaction,
  }) async {
    if (availability.any((e) => e.id == null)) {
      throw ArgumentError.notNull('availability.id');
    }
    if (workplace.id == null) {
      throw ArgumentError.notNull('workplace.id');
    }

    var $availability = availability
        .map((e) => e.copyWith(workplaceId: workplace.id))
        .toList();
    await session.db.update<_i3.Availability>(
      $availability,
      columns: [_i3.Availability.t.workplaceId],
      transaction: transaction,
    );
  }
}

class WorkplaceAttachRowRepository {
  const WorkplaceAttachRowRepository._();

  /// Creates a relation between this [Workplace] and the given [Availability]
  /// by setting the [Availability]'s foreign key `workplaceId` to refer to this [Workplace].
  Future<void> availabilities(
    _i2.Session session,
    Workplace workplace,
    _i3.Availability availability, {
    _i2.Transaction? transaction,
  }) async {
    if (availability.id == null) {
      throw ArgumentError.notNull('availability.id');
    }
    if (workplace.id == null) {
      throw ArgumentError.notNull('workplace.id');
    }

    var $availability = availability.copyWith(workplaceId: workplace.id);
    await session.db.updateRow<_i3.Availability>(
      $availability,
      columns: [_i3.Availability.t.workplaceId],
      transaction: transaction,
    );
  }
}
