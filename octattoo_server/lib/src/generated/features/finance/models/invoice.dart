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
import '../../../features/finance/models/quotation.dart' as _i6;
import '../../../features/shared/models/workflow_status.dart' as _i7;

/// An Invoice from a TattooArtist to a Customer to get payment
abstract class Invoice implements _i1.TableRow, _i1.ProtocolSerialization {
  Invoice._({
    this.id,
    required this.customerId,
    this.customer,
    required this.tattooArtistId,
    this.tattooArtist,
    this.workplaceId,
    this.workplace,
    this.tattooProjectId,
    this.tattooProject,
    this.quotationId,
    this.quotation,
    required this.price,
    required this.status,
  });

  factory Invoice({
    int? id,
    required int customerId,
    _i2.Customer? customer,
    required int tattooArtistId,
    _i3.TattooArtist? tattooArtist,
    int? workplaceId,
    _i4.Workplace? workplace,
    int? tattooProjectId,
    _i5.TattooProject? tattooProject,
    int? quotationId,
    _i6.Quotation? quotation,
    required int price,
    required _i7.WorkflowStatus status,
  }) = _InvoiceImpl;

  factory Invoice.fromJson(Map<String, dynamic> jsonSerialization) {
    return Invoice(
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
      quotationId: jsonSerialization['quotationId'] as int?,
      quotation: jsonSerialization['quotation'] == null
          ? null
          : _i6.Quotation.fromJson(
              (jsonSerialization['quotation'] as Map<String, dynamic>)),
      price: jsonSerialization['price'] as int,
      status:
          _i7.WorkflowStatus.fromJson((jsonSerialization['status'] as String)),
    );
  }

  static final t = InvoiceTable();

  static const db = InvoiceRepository._();

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

  int? quotationId;

  _i6.Quotation? quotation;

  int price;

  _i7.WorkflowStatus status;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [Invoice]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Invoice copyWith({
    int? id,
    int? customerId,
    _i2.Customer? customer,
    int? tattooArtistId,
    _i3.TattooArtist? tattooArtist,
    int? workplaceId,
    _i4.Workplace? workplace,
    int? tattooProjectId,
    _i5.TattooProject? tattooProject,
    int? quotationId,
    _i6.Quotation? quotation,
    int? price,
    _i7.WorkflowStatus? status,
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
      if (quotationId != null) 'quotationId': quotationId,
      if (quotation != null) 'quotation': quotation?.toJson(),
      'price': price,
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
      if (quotationId != null) 'quotationId': quotationId,
      if (quotation != null) 'quotation': quotation?.toJsonForProtocol(),
      'price': price,
      'status': status.toJson(),
    };
  }

  static InvoiceInclude include({
    _i2.CustomerInclude? customer,
    _i3.TattooArtistInclude? tattooArtist,
    _i4.WorkplaceInclude? workplace,
    _i5.TattooProjectInclude? tattooProject,
    _i6.QuotationInclude? quotation,
  }) {
    return InvoiceInclude._(
      customer: customer,
      tattooArtist: tattooArtist,
      workplace: workplace,
      tattooProject: tattooProject,
      quotation: quotation,
    );
  }

  static InvoiceIncludeList includeList({
    _i1.WhereExpressionBuilder<InvoiceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<InvoiceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InvoiceTable>? orderByList,
    InvoiceInclude? include,
  }) {
    return InvoiceIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Invoice.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Invoice.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _InvoiceImpl extends Invoice {
  _InvoiceImpl({
    int? id,
    required int customerId,
    _i2.Customer? customer,
    required int tattooArtistId,
    _i3.TattooArtist? tattooArtist,
    int? workplaceId,
    _i4.Workplace? workplace,
    int? tattooProjectId,
    _i5.TattooProject? tattooProject,
    int? quotationId,
    _i6.Quotation? quotation,
    required int price,
    required _i7.WorkflowStatus status,
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
          quotationId: quotationId,
          quotation: quotation,
          price: price,
          status: status,
        );

  /// Returns a shallow copy of this [Invoice]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Invoice copyWith({
    Object? id = _Undefined,
    int? customerId,
    Object? customer = _Undefined,
    int? tattooArtistId,
    Object? tattooArtist = _Undefined,
    Object? workplaceId = _Undefined,
    Object? workplace = _Undefined,
    Object? tattooProjectId = _Undefined,
    Object? tattooProject = _Undefined,
    Object? quotationId = _Undefined,
    Object? quotation = _Undefined,
    int? price,
    _i7.WorkflowStatus? status,
  }) {
    return Invoice(
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
      quotationId: quotationId is int? ? quotationId : this.quotationId,
      quotation:
          quotation is _i6.Quotation? ? quotation : this.quotation?.copyWith(),
      price: price ?? this.price,
      status: status ?? this.status,
    );
  }
}

class InvoiceTable extends _i1.Table {
  InvoiceTable({super.tableRelation}) : super(tableName: 'invoice') {
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
    quotationId = _i1.ColumnInt(
      'quotationId',
      this,
    );
    price = _i1.ColumnInt(
      'price',
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

  late final _i1.ColumnInt quotationId;

  _i6.QuotationTable? _quotation;

  late final _i1.ColumnInt price;

  late final _i1.ColumnEnum<_i7.WorkflowStatus> status;

  _i2.CustomerTable get customer {
    if (_customer != null) return _customer!;
    _customer = _i1.createRelationTable(
      relationFieldName: 'customer',
      field: Invoice.t.customerId,
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
      field: Invoice.t.tattooArtistId,
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
      field: Invoice.t.workplaceId,
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
      field: Invoice.t.tattooProjectId,
      foreignField: _i5.TattooProject.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.TattooProjectTable(tableRelation: foreignTableRelation),
    );
    return _tattooProject!;
  }

  _i6.QuotationTable get quotation {
    if (_quotation != null) return _quotation!;
    _quotation = _i1.createRelationTable(
      relationFieldName: 'quotation',
      field: Invoice.t.quotationId,
      foreignField: _i6.Quotation.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.QuotationTable(tableRelation: foreignTableRelation),
    );
    return _quotation!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        customerId,
        tattooArtistId,
        workplaceId,
        tattooProjectId,
        quotationId,
        price,
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
    if (relationField == 'quotation') {
      return quotation;
    }
    return null;
  }
}

class InvoiceInclude extends _i1.IncludeObject {
  InvoiceInclude._({
    _i2.CustomerInclude? customer,
    _i3.TattooArtistInclude? tattooArtist,
    _i4.WorkplaceInclude? workplace,
    _i5.TattooProjectInclude? tattooProject,
    _i6.QuotationInclude? quotation,
  }) {
    _customer = customer;
    _tattooArtist = tattooArtist;
    _workplace = workplace;
    _tattooProject = tattooProject;
    _quotation = quotation;
  }

  _i2.CustomerInclude? _customer;

  _i3.TattooArtistInclude? _tattooArtist;

  _i4.WorkplaceInclude? _workplace;

  _i5.TattooProjectInclude? _tattooProject;

  _i6.QuotationInclude? _quotation;

  @override
  Map<String, _i1.Include?> get includes => {
        'customer': _customer,
        'tattooArtist': _tattooArtist,
        'workplace': _workplace,
        'tattooProject': _tattooProject,
        'quotation': _quotation,
      };

  @override
  _i1.Table get table => Invoice.t;
}

class InvoiceIncludeList extends _i1.IncludeList {
  InvoiceIncludeList._({
    _i1.WhereExpressionBuilder<InvoiceTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Invoice.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Invoice.t;
}

class InvoiceRepository {
  const InvoiceRepository._();

  final attachRow = const InvoiceAttachRowRepository._();

  final detachRow = const InvoiceDetachRowRepository._();

  /// Returns a list of [Invoice]s matching the given query parameters.
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
  Future<List<Invoice>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InvoiceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<InvoiceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InvoiceTable>? orderByList,
    _i1.Transaction? transaction,
    InvoiceInclude? include,
  }) async {
    return session.db.find<Invoice>(
      where: where?.call(Invoice.t),
      orderBy: orderBy?.call(Invoice.t),
      orderByList: orderByList?.call(Invoice.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Invoice] matching the given query parameters.
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
  Future<Invoice?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InvoiceTable>? where,
    int? offset,
    _i1.OrderByBuilder<InvoiceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InvoiceTable>? orderByList,
    _i1.Transaction? transaction,
    InvoiceInclude? include,
  }) async {
    return session.db.findFirstRow<Invoice>(
      where: where?.call(Invoice.t),
      orderBy: orderBy?.call(Invoice.t),
      orderByList: orderByList?.call(Invoice.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Invoice] by its [id] or null if no such row exists.
  Future<Invoice?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    InvoiceInclude? include,
  }) async {
    return session.db.findById<Invoice>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Invoice]s in the list and returns the inserted rows.
  ///
  /// The returned [Invoice]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Invoice>> insert(
    _i1.Session session,
    List<Invoice> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Invoice>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Invoice] and returns the inserted row.
  ///
  /// The returned [Invoice] will have its `id` field set.
  Future<Invoice> insertRow(
    _i1.Session session,
    Invoice row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Invoice>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Invoice]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Invoice>> update(
    _i1.Session session,
    List<Invoice> rows, {
    _i1.ColumnSelections<InvoiceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Invoice>(
      rows,
      columns: columns?.call(Invoice.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Invoice]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Invoice> updateRow(
    _i1.Session session,
    Invoice row, {
    _i1.ColumnSelections<InvoiceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Invoice>(
      row,
      columns: columns?.call(Invoice.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Invoice]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Invoice>> delete(
    _i1.Session session,
    List<Invoice> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Invoice>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Invoice].
  Future<Invoice> deleteRow(
    _i1.Session session,
    Invoice row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Invoice>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Invoice>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<InvoiceTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Invoice>(
      where: where(Invoice.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InvoiceTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Invoice>(
      where: where?.call(Invoice.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class InvoiceAttachRowRepository {
  const InvoiceAttachRowRepository._();

  /// Creates a relation between the given [Invoice] and [Customer]
  /// by setting the [Invoice]'s foreign key `customerId` to refer to the [Customer].
  Future<void> customer(
    _i1.Session session,
    Invoice invoice,
    _i2.Customer customer, {
    _i1.Transaction? transaction,
  }) async {
    if (invoice.id == null) {
      throw ArgumentError.notNull('invoice.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $invoice = invoice.copyWith(customerId: customer.id);
    await session.db.updateRow<Invoice>(
      $invoice,
      columns: [Invoice.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Invoice] and [TattooArtist]
  /// by setting the [Invoice]'s foreign key `tattooArtistId` to refer to the [TattooArtist].
  Future<void> tattooArtist(
    _i1.Session session,
    Invoice invoice,
    _i3.TattooArtist tattooArtist, {
    _i1.Transaction? transaction,
  }) async {
    if (invoice.id == null) {
      throw ArgumentError.notNull('invoice.id');
    }
    if (tattooArtist.id == null) {
      throw ArgumentError.notNull('tattooArtist.id');
    }

    var $invoice = invoice.copyWith(tattooArtistId: tattooArtist.id);
    await session.db.updateRow<Invoice>(
      $invoice,
      columns: [Invoice.t.tattooArtistId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Invoice] and [Workplace]
  /// by setting the [Invoice]'s foreign key `workplaceId` to refer to the [Workplace].
  Future<void> workplace(
    _i1.Session session,
    Invoice invoice,
    _i4.Workplace workplace, {
    _i1.Transaction? transaction,
  }) async {
    if (invoice.id == null) {
      throw ArgumentError.notNull('invoice.id');
    }
    if (workplace.id == null) {
      throw ArgumentError.notNull('workplace.id');
    }

    var $invoice = invoice.copyWith(workplaceId: workplace.id);
    await session.db.updateRow<Invoice>(
      $invoice,
      columns: [Invoice.t.workplaceId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Invoice] and [TattooProject]
  /// by setting the [Invoice]'s foreign key `tattooProjectId` to refer to the [TattooProject].
  Future<void> tattooProject(
    _i1.Session session,
    Invoice invoice,
    _i5.TattooProject tattooProject, {
    _i1.Transaction? transaction,
  }) async {
    if (invoice.id == null) {
      throw ArgumentError.notNull('invoice.id');
    }
    if (tattooProject.id == null) {
      throw ArgumentError.notNull('tattooProject.id');
    }

    var $invoice = invoice.copyWith(tattooProjectId: tattooProject.id);
    await session.db.updateRow<Invoice>(
      $invoice,
      columns: [Invoice.t.tattooProjectId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Invoice] and [Quotation]
  /// by setting the [Invoice]'s foreign key `quotationId` to refer to the [Quotation].
  Future<void> quotation(
    _i1.Session session,
    Invoice invoice,
    _i6.Quotation quotation, {
    _i1.Transaction? transaction,
  }) async {
    if (invoice.id == null) {
      throw ArgumentError.notNull('invoice.id');
    }
    if (quotation.id == null) {
      throw ArgumentError.notNull('quotation.id');
    }

    var $invoice = invoice.copyWith(quotationId: quotation.id);
    await session.db.updateRow<Invoice>(
      $invoice,
      columns: [Invoice.t.quotationId],
      transaction: transaction,
    );
  }
}

class InvoiceDetachRowRepository {
  const InvoiceDetachRowRepository._();

  /// Detaches the relation between this [Invoice] and the [Workplace] set in `workplace`
  /// by setting the [Invoice]'s foreign key `workplaceId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> workplace(
    _i1.Session session,
    Invoice invoice, {
    _i1.Transaction? transaction,
  }) async {
    if (invoice.id == null) {
      throw ArgumentError.notNull('invoice.id');
    }

    var $invoice = invoice.copyWith(workplaceId: null);
    await session.db.updateRow<Invoice>(
      $invoice,
      columns: [Invoice.t.workplaceId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Invoice] and the [TattooProject] set in `tattooProject`
  /// by setting the [Invoice]'s foreign key `tattooProjectId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> tattooProject(
    _i1.Session session,
    Invoice invoice, {
    _i1.Transaction? transaction,
  }) async {
    if (invoice.id == null) {
      throw ArgumentError.notNull('invoice.id');
    }

    var $invoice = invoice.copyWith(tattooProjectId: null);
    await session.db.updateRow<Invoice>(
      $invoice,
      columns: [Invoice.t.tattooProjectId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Invoice] and the [Quotation] set in `quotation`
  /// by setting the [Invoice]'s foreign key `quotationId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> quotation(
    _i1.Session session,
    Invoice invoice, {
    _i1.Transaction? transaction,
  }) async {
    if (invoice.id == null) {
      throw ArgumentError.notNull('invoice.id');
    }

    var $invoice = invoice.copyWith(quotationId: null);
    await session.db.updateRow<Invoice>(
      $invoice,
      columns: [Invoice.t.quotationId],
      transaction: transaction,
    );
  }
}
