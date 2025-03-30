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

/// A CustomerTag is a tag created by a TattooArtist to manage customers
abstract class CustomerTag implements _i1.TableRow, _i1.ProtocolSerialization {
  CustomerTag._({
    this.id,
    required this.name,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.ownerId,
    this.owner,
  });

  factory CustomerTag({
    int? id,
    required String name,
    String? description,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int ownerId,
    _i2.TattooArtist? owner,
  }) = _CustomerTagImpl;

  factory CustomerTag.fromJson(Map<String, dynamic> jsonSerialization) {
    return CustomerTag(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.TattooArtist.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
    );
  }

  static final t = CustomerTagTable();

  static const db = CustomerTagRepository._();

  @override
  int? id;

  String name;

  String? description;

  DateTime createdAt;

  DateTime updatedAt;

  int ownerId;

  _i2.TattooArtist? owner;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [CustomerTag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CustomerTag copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? ownerId,
    _i2.TattooArtist? owner,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
    };
  }

  static CustomerTagInclude include({_i2.TattooArtistInclude? owner}) {
    return CustomerTagInclude._(owner: owner);
  }

  static CustomerTagIncludeList includeList({
    _i1.WhereExpressionBuilder<CustomerTagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerTagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerTagTable>? orderByList,
    CustomerTagInclude? include,
  }) {
    return CustomerTagIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CustomerTag.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CustomerTag.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomerTagImpl extends CustomerTag {
  _CustomerTagImpl({
    int? id,
    required String name,
    String? description,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int ownerId,
    _i2.TattooArtist? owner,
  }) : super._(
          id: id,
          name: name,
          description: description,
          createdAt: createdAt,
          updatedAt: updatedAt,
          ownerId: ownerId,
          owner: owner,
        );

  /// Returns a shallow copy of this [CustomerTag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CustomerTag copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? ownerId,
    Object? owner = _Undefined,
  }) {
    return CustomerTag(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.TattooArtist? ? owner : this.owner?.copyWith(),
    );
  }
}

class CustomerTagTable extends _i1.Table {
  CustomerTagTable({super.tableRelation}) : super(tableName: 'customer_tag') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnInt ownerId;

  _i2.TattooArtistTable? _owner;

  _i2.TattooArtistTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: CustomerTag.t.ownerId,
      foreignField: _i2.TattooArtist.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TattooArtistTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        description,
        createdAt,
        updatedAt,
        ownerId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    return null;
  }
}

class CustomerTagInclude extends _i1.IncludeObject {
  CustomerTagInclude._({_i2.TattooArtistInclude? owner}) {
    _owner = owner;
  }

  _i2.TattooArtistInclude? _owner;

  @override
  Map<String, _i1.Include?> get includes => {'owner': _owner};

  @override
  _i1.Table get table => CustomerTag.t;
}

class CustomerTagIncludeList extends _i1.IncludeList {
  CustomerTagIncludeList._({
    _i1.WhereExpressionBuilder<CustomerTagTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CustomerTag.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => CustomerTag.t;
}

class CustomerTagRepository {
  const CustomerTagRepository._();

  final attachRow = const CustomerTagAttachRowRepository._();

  /// Returns a list of [CustomerTag]s matching the given query parameters.
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
  Future<List<CustomerTag>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerTagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerTagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerTagTable>? orderByList,
    _i1.Transaction? transaction,
    CustomerTagInclude? include,
  }) async {
    return session.db.find<CustomerTag>(
      where: where?.call(CustomerTag.t),
      orderBy: orderBy?.call(CustomerTag.t),
      orderByList: orderByList?.call(CustomerTag.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [CustomerTag] matching the given query parameters.
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
  Future<CustomerTag?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerTagTable>? where,
    int? offset,
    _i1.OrderByBuilder<CustomerTagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerTagTable>? orderByList,
    _i1.Transaction? transaction,
    CustomerTagInclude? include,
  }) async {
    return session.db.findFirstRow<CustomerTag>(
      where: where?.call(CustomerTag.t),
      orderBy: orderBy?.call(CustomerTag.t),
      orderByList: orderByList?.call(CustomerTag.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [CustomerTag] by its [id] or null if no such row exists.
  Future<CustomerTag?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CustomerTagInclude? include,
  }) async {
    return session.db.findById<CustomerTag>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [CustomerTag]s in the list and returns the inserted rows.
  ///
  /// The returned [CustomerTag]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CustomerTag>> insert(
    _i1.Session session,
    List<CustomerTag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CustomerTag>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CustomerTag] and returns the inserted row.
  ///
  /// The returned [CustomerTag] will have its `id` field set.
  Future<CustomerTag> insertRow(
    _i1.Session session,
    CustomerTag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CustomerTag>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CustomerTag]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CustomerTag>> update(
    _i1.Session session,
    List<CustomerTag> rows, {
    _i1.ColumnSelections<CustomerTagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CustomerTag>(
      rows,
      columns: columns?.call(CustomerTag.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CustomerTag]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CustomerTag> updateRow(
    _i1.Session session,
    CustomerTag row, {
    _i1.ColumnSelections<CustomerTagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CustomerTag>(
      row,
      columns: columns?.call(CustomerTag.t),
      transaction: transaction,
    );
  }

  /// Deletes all [CustomerTag]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CustomerTag>> delete(
    _i1.Session session,
    List<CustomerTag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CustomerTag>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CustomerTag].
  Future<CustomerTag> deleteRow(
    _i1.Session session,
    CustomerTag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CustomerTag>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CustomerTag>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CustomerTagTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CustomerTag>(
      where: where(CustomerTag.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerTagTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CustomerTag>(
      where: where?.call(CustomerTag.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CustomerTagAttachRowRepository {
  const CustomerTagAttachRowRepository._();

  /// Creates a relation between the given [CustomerTag] and [TattooArtist]
  /// by setting the [CustomerTag]'s foreign key `ownerId` to refer to the [TattooArtist].
  Future<void> owner(
    _i1.Session session,
    CustomerTag customerTag,
    _i2.TattooArtist owner, {
    _i1.Transaction? transaction,
  }) async {
    if (customerTag.id == null) {
      throw ArgumentError.notNull('customerTag.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $customerTag = customerTag.copyWith(ownerId: owner.id);
    await session.db.updateRow<CustomerTag>(
      $customerTag,
      columns: [CustomerTag.t.ownerId],
      transaction: transaction,
    );
  }
}
