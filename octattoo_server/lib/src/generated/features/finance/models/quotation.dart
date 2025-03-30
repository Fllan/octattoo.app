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
import '../../../features/customer/models/customer.dart' as _i2;
import '../../../features/tattoo_artist/models/tattoo_artist.dart' as _i3;
import '../../../features/workplace/models/workplace.dart' as _i4;
import '../../../features/tattoo_project/models/tattoo_project.dart' as _i5;
import '../../../features/shared/models/workflow_status.dart' as _i6;

/// A quotation from a TattooArtist to a Customer
abstract class Quotation implements _i1.TableRow, _i1.ProtocolSerialization {
  Quotation._({
    this.id,
    required this.customerId,
    this.customer,
    required this.tattooArtistId,
    this.tattooArtist,
    this.workplaceId,
    this.workplace,
    this.tattooProjectId,
    this.tattooProject,
    required this.price,
    required this.createdAt,
    required this.duration,
    required this.status,
  });

  factory Quotation({
    int? id,
    required int customerId,
    _i2.Customer? customer,
    required int tattooArtistId,
    _i3.TattooArtist? tattooArtist,
    int? workplaceId,
    _i4.Workplace? workplace,
    int? tattooProjectId,
    _i5.TattooProject? tattooProject,
    required int price,
    required DateTime createdAt,
    required int duration,
    required _i6.WorkflowStatus status,
  }) = _QuotationImpl;

  factory Quotation.fromJson(Map<String, dynamic> jsonSerialization) {
    return Quotation(
      id: jsonSerialization['id'] as int?,
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i2.Customer.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      tattooArtistId: jsonSerialization['tattooArtistId'] as int,
      tattooArtist: jsonSerialization['tattooArtist'] == null
          ? null
          : _i3.TattooArtist.fromJson(
              (jsonSerialization['tattooArtist'] as Map<String, dynamic>)),
      workplaceId: jsonSerialization['workplaceId'] as int?,
      workplace: jsonSerialization['workplace'] == null
          ? null
          : _i4.Workplace.fromJson(
              (jsonSerialization['workplace'] as Map<String, dynamic>)),
      tattooProjectId: jsonSerialization['tattooProjectId'] as int?,
      tattooProject: jsonSerialization['tattooProject'] == null
          ? null
          : _i5.TattooProject.fromJson(
              (jsonSerialization['tattooProject'] as Map<String, dynamic>)),
      price: jsonSerialization['price'] as int,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      duration: jsonSerialization['duration'] as int,
      status:
          _i6.WorkflowStatus.fromJson((jsonSerialization['status'] as String)),
    );
  }

  static final t = QuotationTable();

  static const db = QuotationRepository._();

  @override
  int? id;

  int customerId;

  _i2.Customer? customer;

  int tattooArtistId;

  _i3.TattooArtist? tattooArtist;

  int? workplaceId;

  _i4.Workplace? workplace;

  int? tattooProjectId;

  _i5.TattooProject? tattooProject;

  int price;

  DateTime createdAt;

  /// Quotation is valid for 10 days started at createdAt
  int duration;

  _i6.WorkflowStatus status;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [Quotation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Quotation copyWith({
    int? id,
    int? customerId,
    _i2.Customer? customer,
    int? tattooArtistId,
    _i3.TattooArtist? tattooArtist,
    int? workplaceId,
    _i4.Workplace? workplace,
    int? tattooProjectId,
    _i5.TattooProject? tattooProject,
    int? price,
    DateTime? createdAt,
    int? duration,
    _i6.WorkflowStatus? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      'tattooArtistId': tattooArtistId,
      if (tattooArtist != null) 'tattooArtist': tattooArtist?.toJson(),
      if (workplaceId != null) 'workplaceId': workplaceId,
      if (workplace != null) 'workplace': workplace?.toJson(),
      if (tattooProjectId != null) 'tattooProjectId': tattooProjectId,
      if (tattooProject != null) 'tattooProject': tattooProject?.toJson(),
      'price': price,
      'createdAt': createdAt.toJson(),
      'duration': duration,
      'status': status.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      'tattooArtistId': tattooArtistId,
      if (tattooArtist != null)
        'tattooArtist': tattooArtist?.toJsonForProtocol(),
      if (workplaceId != null) 'workplaceId': workplaceId,
      if (workplace != null) 'workplace': workplace?.toJsonForProtocol(),
      if (tattooProjectId != null) 'tattooProjectId': tattooProjectId,
      if (tattooProject != null)
        'tattooProject': tattooProject?.toJsonForProtocol(),
      'price': price,
      'createdAt': createdAt.toJson(),
      'duration': duration,
      'status': status.toJson(),
    };
  }

  static QuotationInclude include({
    _i2.CustomerInclude? customer,
    _i3.TattooArtistInclude? tattooArtist,
    _i4.WorkplaceInclude? workplace,
    _i5.TattooProjectInclude? tattooProject,
  }) {
    return QuotationInclude._(
      customer: customer,
      tattooArtist: tattooArtist,
      workplace: workplace,
      tattooProject: tattooProject,
    );
  }

  static QuotationIncludeList includeList({
    _i1.WhereExpressionBuilder<QuotationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuotationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuotationTable>? orderByList,
    QuotationInclude? include,
  }) {
    return QuotationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Quotation.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Quotation.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuotationImpl extends Quotation {
  _QuotationImpl({
    int? id,
    required int customerId,
    _i2.Customer? customer,
    required int tattooArtistId,
    _i3.TattooArtist? tattooArtist,
    int? workplaceId,
    _i4.Workplace? workplace,
    int? tattooProjectId,
    _i5.TattooProject? tattooProject,
    required int price,
    required DateTime createdAt,
    required int duration,
    required _i6.WorkflowStatus status,
  }) : super._(
          id: id,
          customerId: customerId,
          customer: customer,
          tattooArtistId: tattooArtistId,
          tattooArtist: tattooArtist,
          workplaceId: workplaceId,
          workplace: workplace,
          tattooProjectId: tattooProjectId,
          tattooProject: tattooProject,
          price: price,
          createdAt: createdAt,
          duration: duration,
          status: status,
        );

  /// Returns a shallow copy of this [Quotation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Quotation copyWith({
    Object? id = _Undefined,
    int? customerId,
    Object? customer = _Undefined,
    int? tattooArtistId,
    Object? tattooArtist = _Undefined,
    Object? workplaceId = _Undefined,
    Object? workplace = _Undefined,
    Object? tattooProjectId = _Undefined,
    Object? tattooProject = _Undefined,
    int? price,
    DateTime? createdAt,
    int? duration,
    _i6.WorkflowStatus? status,
  }) {
    return Quotation(
      id: id is int? ? id : this.id,
      customerId: customerId ?? this.customerId,
      customer:
          customer is _i2.Customer? ? customer : this.customer?.copyWith(),
      tattooArtistId: tattooArtistId ?? this.tattooArtistId,
      tattooArtist: tattooArtist is _i3.TattooArtist?
          ? tattooArtist
          : this.tattooArtist?.copyWith(),
      workplaceId: workplaceId is int? ? workplaceId : this.workplaceId,
      workplace:
          workplace is _i4.Workplace? ? workplace : this.workplace?.copyWith(),
      tattooProjectId:
          tattooProjectId is int? ? tattooProjectId : this.tattooProjectId,
      tattooProject: tattooProject is _i5.TattooProject?
          ? tattooProject
          : this.tattooProject?.copyWith(),
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      duration: duration ?? this.duration,
      status: status ?? this.status,
    );
  }
}

class QuotationTable extends _i1.Table {
  QuotationTable({super.tableRelation}) : super(tableName: 'quotation') {
    customerId = _i1.ColumnInt(
      'customerId',
      this,
    );
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
    price = _i1.ColumnInt(
      'price',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    duration = _i1.ColumnInt(
      'duration',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
  }

  late final _i1.ColumnInt customerId;

  _i2.CustomerTable? _customer;

  late final _i1.ColumnInt tattooArtistId;

  _i3.TattooArtistTable? _tattooArtist;

  late final _i1.ColumnInt workplaceId;

  _i4.WorkplaceTable? _workplace;

  late final _i1.ColumnInt tattooProjectId;

  _i5.TattooProjectTable? _tattooProject;

  late final _i1.ColumnInt price;

  late final _i1.ColumnDateTime createdAt;

  /// Quotation is valid for 10 days started at createdAt
  late final _i1.ColumnInt duration;

  late final _i1.ColumnEnum<_i6.WorkflowStatus> status;

  _i2.CustomerTable get customer {
    if (_customer != null) return _customer!;
    _customer = _i1.createRelationTable(
      relationFieldName: 'customer',
      field: Quotation.t.customerId,
      foreignField: _i2.Customer.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CustomerTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  _i3.TattooArtistTable get tattooArtist {
    if (_tattooArtist != null) return _tattooArtist!;
    _tattooArtist = _i1.createRelationTable(
      relationFieldName: 'tattooArtist',
      field: Quotation.t.tattooArtistId,
      foreignField: _i3.TattooArtist.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.TattooArtistTable(tableRelation: foreignTableRelation),
    );
    return _tattooArtist!;
  }

  _i4.WorkplaceTable get workplace {
    if (_workplace != null) return _workplace!;
    _workplace = _i1.createRelationTable(
      relationFieldName: 'workplace',
      field: Quotation.t.workplaceId,
      foreignField: _i4.Workplace.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.WorkplaceTable(tableRelation: foreignTableRelation),
    );
    return _workplace!;
  }

  _i5.TattooProjectTable get tattooProject {
    if (_tattooProject != null) return _tattooProject!;
    _tattooProject = _i1.createRelationTable(
      relationFieldName: 'tattooProject',
      field: Quotation.t.tattooProjectId,
      foreignField: _i5.TattooProject.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.TattooProjectTable(tableRelation: foreignTableRelation),
    );
    return _tattooProject!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        customerId,
        tattooArtistId,
        workplaceId,
        tattooProjectId,
        price,
        createdAt,
        duration,
        status,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'customer') {
      return customer;
    }
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

class QuotationInclude extends _i1.IncludeObject {
  QuotationInclude._({
    _i2.CustomerInclude? customer,
    _i3.TattooArtistInclude? tattooArtist,
    _i4.WorkplaceInclude? workplace,
    _i5.TattooProjectInclude? tattooProject,
  }) {
    _customer = customer;
    _tattooArtist = tattooArtist;
    _workplace = workplace;
    _tattooProject = tattooProject;
  }

  _i2.CustomerInclude? _customer;

  _i3.TattooArtistInclude? _tattooArtist;

  _i4.WorkplaceInclude? _workplace;

  _i5.TattooProjectInclude? _tattooProject;

  @override
  Map<String, _i1.Include?> get includes => {
        'customer': _customer,
        'tattooArtist': _tattooArtist,
        'workplace': _workplace,
        'tattooProject': _tattooProject,
      };

  @override
  _i1.Table get table => Quotation.t;
}

class QuotationIncludeList extends _i1.IncludeList {
  QuotationIncludeList._({
    _i1.WhereExpressionBuilder<QuotationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Quotation.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Quotation.t;
}

class QuotationRepository {
  const QuotationRepository._();

  final attachRow = const QuotationAttachRowRepository._();

  final detachRow = const QuotationDetachRowRepository._();

  /// Returns a list of [Quotation]s matching the given query parameters.
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
  Future<List<Quotation>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuotationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuotationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuotationTable>? orderByList,
    _i1.Transaction? transaction,
    QuotationInclude? include,
  }) async {
    return session.db.find<Quotation>(
      where: where?.call(Quotation.t),
      orderBy: orderBy?.call(Quotation.t),
      orderByList: orderByList?.call(Quotation.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Quotation] matching the given query parameters.
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
  Future<Quotation?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuotationTable>? where,
    int? offset,
    _i1.OrderByBuilder<QuotationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuotationTable>? orderByList,
    _i1.Transaction? transaction,
    QuotationInclude? include,
  }) async {
    return session.db.findFirstRow<Quotation>(
      where: where?.call(Quotation.t),
      orderBy: orderBy?.call(Quotation.t),
      orderByList: orderByList?.call(Quotation.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Quotation] by its [id] or null if no such row exists.
  Future<Quotation?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    QuotationInclude? include,
  }) async {
    return session.db.findById<Quotation>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Quotation]s in the list and returns the inserted rows.
  ///
  /// The returned [Quotation]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Quotation>> insert(
    _i1.Session session,
    List<Quotation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Quotation>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Quotation] and returns the inserted row.
  ///
  /// The returned [Quotation] will have its `id` field set.
  Future<Quotation> insertRow(
    _i1.Session session,
    Quotation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Quotation>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Quotation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Quotation>> update(
    _i1.Session session,
    List<Quotation> rows, {
    _i1.ColumnSelections<QuotationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Quotation>(
      rows,
      columns: columns?.call(Quotation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Quotation]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Quotation> updateRow(
    _i1.Session session,
    Quotation row, {
    _i1.ColumnSelections<QuotationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Quotation>(
      row,
      columns: columns?.call(Quotation.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Quotation]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Quotation>> delete(
    _i1.Session session,
    List<Quotation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Quotation>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Quotation].
  Future<Quotation> deleteRow(
    _i1.Session session,
    Quotation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Quotation>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Quotation>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<QuotationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Quotation>(
      where: where(Quotation.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuotationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Quotation>(
      where: where?.call(Quotation.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class QuotationAttachRowRepository {
  const QuotationAttachRowRepository._();

  /// Creates a relation between the given [Quotation] and [Customer]
  /// by setting the [Quotation]'s foreign key `customerId` to refer to the [Customer].
  Future<void> customer(
    _i1.Session session,
    Quotation quotation,
    _i2.Customer customer, {
    _i1.Transaction? transaction,
  }) async {
    if (quotation.id == null) {
      throw ArgumentError.notNull('quotation.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $quotation = quotation.copyWith(customerId: customer.id);
    await session.db.updateRow<Quotation>(
      $quotation,
      columns: [Quotation.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Quotation] and [TattooArtist]
  /// by setting the [Quotation]'s foreign key `tattooArtistId` to refer to the [TattooArtist].
  Future<void> tattooArtist(
    _i1.Session session,
    Quotation quotation,
    _i3.TattooArtist tattooArtist, {
    _i1.Transaction? transaction,
  }) async {
    if (quotation.id == null) {
      throw ArgumentError.notNull('quotation.id');
    }
    if (tattooArtist.id == null) {
      throw ArgumentError.notNull('tattooArtist.id');
    }

    var $quotation = quotation.copyWith(tattooArtistId: tattooArtist.id);
    await session.db.updateRow<Quotation>(
      $quotation,
      columns: [Quotation.t.tattooArtistId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Quotation] and [Workplace]
  /// by setting the [Quotation]'s foreign key `workplaceId` to refer to the [Workplace].
  Future<void> workplace(
    _i1.Session session,
    Quotation quotation,
    _i4.Workplace workplace, {
    _i1.Transaction? transaction,
  }) async {
    if (quotation.id == null) {
      throw ArgumentError.notNull('quotation.id');
    }
    if (workplace.id == null) {
      throw ArgumentError.notNull('workplace.id');
    }

    var $quotation = quotation.copyWith(workplaceId: workplace.id);
    await session.db.updateRow<Quotation>(
      $quotation,
      columns: [Quotation.t.workplaceId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Quotation] and [TattooProject]
  /// by setting the [Quotation]'s foreign key `tattooProjectId` to refer to the [TattooProject].
  Future<void> tattooProject(
    _i1.Session session,
    Quotation quotation,
    _i5.TattooProject tattooProject, {
    _i1.Transaction? transaction,
  }) async {
    if (quotation.id == null) {
      throw ArgumentError.notNull('quotation.id');
    }
    if (tattooProject.id == null) {
      throw ArgumentError.notNull('tattooProject.id');
    }

    var $quotation = quotation.copyWith(tattooProjectId: tattooProject.id);
    await session.db.updateRow<Quotation>(
      $quotation,
      columns: [Quotation.t.tattooProjectId],
      transaction: transaction,
    );
  }
}

class QuotationDetachRowRepository {
  const QuotationDetachRowRepository._();

  /// Detaches the relation between this [Quotation] and the [Workplace] set in `workplace`
  /// by setting the [Quotation]'s foreign key `workplaceId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> workplace(
    _i1.Session session,
    Quotation quotation, {
    _i1.Transaction? transaction,
  }) async {
    if (quotation.id == null) {
      throw ArgumentError.notNull('quotation.id');
    }

    var $quotation = quotation.copyWith(workplaceId: null);
    await session.db.updateRow<Quotation>(
      $quotation,
      columns: [Quotation.t.workplaceId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Quotation] and the [TattooProject] set in `tattooProject`
  /// by setting the [Quotation]'s foreign key `tattooProjectId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> tattooProject(
    _i1.Session session,
    Quotation quotation, {
    _i1.Transaction? transaction,
  }) async {
    if (quotation.id == null) {
      throw ArgumentError.notNull('quotation.id');
    }

    var $quotation = quotation.copyWith(tattooProjectId: null);
    await session.db.updateRow<Quotation>(
      $quotation,
      columns: [Quotation.t.tattooProjectId],
      transaction: transaction,
    );
  }
}
