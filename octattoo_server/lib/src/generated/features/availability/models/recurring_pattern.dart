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
import '../../../features/availability/models/availability.dart' as _i2;
import '../../../features/availability/models/recurring_type.dart' as _i3;

/// A RecurringPattern is a description of the recurrence
abstract class RecurringPattern
    implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = RecurringPatternTable();

  static const db = RecurringPatternRepository._();

  @override
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

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'availabilityId': availabilityId,
      if (availability != null)
        'availability': availability?.toJsonForProtocol(),
      'recurringType': recurringType.toJson(),
      if (separationCount != null) 'separationCount': separationCount,
      if (dayOfWeek != null) 'dayOfWeek': dayOfWeek,
      if (weekOfMonth != null) 'weekOfMonth': weekOfMonth,
      if (dayOfMonth != null) 'dayOfMonth': dayOfMonth,
      if (monthOfYear != null) 'monthOfYear': monthOfYear,
    };
  }

  static RecurringPatternInclude include(
      {_i2.AvailabilityInclude? availability}) {
    return RecurringPatternInclude._(availability: availability);
  }

  static RecurringPatternIncludeList includeList({
    _i1.WhereExpressionBuilder<RecurringPatternTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RecurringPatternTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RecurringPatternTable>? orderByList,
    RecurringPatternInclude? include,
  }) {
    return RecurringPatternIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RecurringPattern.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RecurringPattern.t),
      include: include,
    );
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

class RecurringPatternTable extends _i1.Table {
  RecurringPatternTable({super.tableRelation})
      : super(tableName: 'recurring_pattern') {
    availabilityId = _i1.ColumnInt(
      'availabilityId',
      this,
    );
    recurringType = _i1.ColumnEnum(
      'recurringType',
      this,
      _i1.EnumSerialization.byName,
    );
    separationCount = _i1.ColumnInt(
      'separationCount',
      this,
    );
    dayOfWeek = _i1.ColumnInt(
      'dayOfWeek',
      this,
    );
    weekOfMonth = _i1.ColumnInt(
      'weekOfMonth',
      this,
    );
    dayOfMonth = _i1.ColumnInt(
      'dayOfMonth',
      this,
    );
    monthOfYear = _i1.ColumnInt(
      'monthOfYear',
      this,
    );
  }

  late final _i1.ColumnInt availabilityId;

  _i2.AvailabilityTable? _availability;

  late final _i1.ColumnEnum<_i3.RecurringType> recurringType;

  /// If recurringType.daily and separationCount = 2 it means every 2 days
  late final _i1.ColumnInt separationCount;

  /// 1 for monday, 2 for tuesday, ...
  late final _i1.ColumnInt dayOfWeek;

  /// 1 for the first week, -1 for the last week of the month, ...
  late final _i1.ColumnInt weekOfMonth;

  /// 1 for the first day, -1 for the last day of the month, ...
  late final _i1.ColumnInt dayOfMonth;

  /// 1 for january, 2 for february, ...
  late final _i1.ColumnInt monthOfYear;

  _i2.AvailabilityTable get availability {
    if (_availability != null) return _availability!;
    _availability = _i1.createRelationTable(
      relationFieldName: 'availability',
      field: RecurringPattern.t.availabilityId,
      foreignField: _i2.Availability.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AvailabilityTable(tableRelation: foreignTableRelation),
    );
    return _availability!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        availabilityId,
        recurringType,
        separationCount,
        dayOfWeek,
        weekOfMonth,
        dayOfMonth,
        monthOfYear,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'availability') {
      return availability;
    }
    return null;
  }
}

class RecurringPatternInclude extends _i1.IncludeObject {
  RecurringPatternInclude._({_i2.AvailabilityInclude? availability}) {
    _availability = availability;
  }

  _i2.AvailabilityInclude? _availability;

  @override
  Map<String, _i1.Include?> get includes => {'availability': _availability};

  @override
  _i1.Table get table => RecurringPattern.t;
}

class RecurringPatternIncludeList extends _i1.IncludeList {
  RecurringPatternIncludeList._({
    _i1.WhereExpressionBuilder<RecurringPatternTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RecurringPattern.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => RecurringPattern.t;
}

class RecurringPatternRepository {
  const RecurringPatternRepository._();

  final attachRow = const RecurringPatternAttachRowRepository._();

  /// Returns a list of [RecurringPattern]s matching the given query parameters.
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
  Future<List<RecurringPattern>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RecurringPatternTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RecurringPatternTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RecurringPatternTable>? orderByList,
    _i1.Transaction? transaction,
    RecurringPatternInclude? include,
  }) async {
    return session.db.find<RecurringPattern>(
      where: where?.call(RecurringPattern.t),
      orderBy: orderBy?.call(RecurringPattern.t),
      orderByList: orderByList?.call(RecurringPattern.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [RecurringPattern] matching the given query parameters.
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
  Future<RecurringPattern?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RecurringPatternTable>? where,
    int? offset,
    _i1.OrderByBuilder<RecurringPatternTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RecurringPatternTable>? orderByList,
    _i1.Transaction? transaction,
    RecurringPatternInclude? include,
  }) async {
    return session.db.findFirstRow<RecurringPattern>(
      where: where?.call(RecurringPattern.t),
      orderBy: orderBy?.call(RecurringPattern.t),
      orderByList: orderByList?.call(RecurringPattern.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [RecurringPattern] by its [id] or null if no such row exists.
  Future<RecurringPattern?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    RecurringPatternInclude? include,
  }) async {
    return session.db.findById<RecurringPattern>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [RecurringPattern]s in the list and returns the inserted rows.
  ///
  /// The returned [RecurringPattern]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<RecurringPattern>> insert(
    _i1.Session session,
    List<RecurringPattern> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<RecurringPattern>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [RecurringPattern] and returns the inserted row.
  ///
  /// The returned [RecurringPattern] will have its `id` field set.
  Future<RecurringPattern> insertRow(
    _i1.Session session,
    RecurringPattern row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RecurringPattern>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RecurringPattern]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RecurringPattern>> update(
    _i1.Session session,
    List<RecurringPattern> rows, {
    _i1.ColumnSelections<RecurringPatternTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RecurringPattern>(
      rows,
      columns: columns?.call(RecurringPattern.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RecurringPattern]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RecurringPattern> updateRow(
    _i1.Session session,
    RecurringPattern row, {
    _i1.ColumnSelections<RecurringPatternTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RecurringPattern>(
      row,
      columns: columns?.call(RecurringPattern.t),
      transaction: transaction,
    );
  }

  /// Deletes all [RecurringPattern]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RecurringPattern>> delete(
    _i1.Session session,
    List<RecurringPattern> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RecurringPattern>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RecurringPattern].
  Future<RecurringPattern> deleteRow(
    _i1.Session session,
    RecurringPattern row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RecurringPattern>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RecurringPattern>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RecurringPatternTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RecurringPattern>(
      where: where(RecurringPattern.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RecurringPatternTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RecurringPattern>(
      where: where?.call(RecurringPattern.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class RecurringPatternAttachRowRepository {
  const RecurringPatternAttachRowRepository._();

  /// Creates a relation between the given [RecurringPattern] and [Availability]
  /// by setting the [RecurringPattern]'s foreign key `availabilityId` to refer to the [Availability].
  Future<void> availability(
    _i1.Session session,
    RecurringPattern recurringPattern,
    _i2.Availability availability, {
    _i1.Transaction? transaction,
  }) async {
    if (recurringPattern.id == null) {
      throw ArgumentError.notNull('recurringPattern.id');
    }
    if (availability.id == null) {
      throw ArgumentError.notNull('availability.id');
    }

    var $recurringPattern =
        recurringPattern.copyWith(availabilityId: availability.id);
    await session.db.updateRow<RecurringPattern>(
      $recurringPattern,
      columns: [RecurringPattern.t.availabilityId],
      transaction: transaction,
    );
  }
}
