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

/// A Company is owned by a TattooArtist
abstract class Company implements _i1.TableRow, _i1.ProtocolSerialization {
  Company._({
    this.id,
    required this.ownerId,
    this.owner,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    this.vat,
    this.officialId,
  });

  factory Company({
    int? id,
    required int ownerId,
    _i2.TattooArtist? owner,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String name,
    int? vat,
    String? officialId,
  }) = _CompanyImpl;

  factory Company.fromJson(Map<String, dynamic> jsonSerialization) {
    return Company(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.TattooArtist.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      name: jsonSerialization['name'] as String,
      vat: jsonSerialization['vat'] as int?,
      officialId: jsonSerialization['officialId'] as String?,
    );
  }

  static final t = CompanyTable();

  static const db = CompanyRepository._();

  @override
  int? id;

  int ownerId;

  _i2.TattooArtist? owner;

  DateTime createdAt;

  DateTime updatedAt;

  String name;

  int? vat;

  /// The identifier of the company (SIREN, VAT number, ...)
  String? officialId;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [Company]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Company copyWith({
    int? id,
    int? ownerId,
    _i2.TattooArtist? owner,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    int? vat,
    String? officialId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'name': name,
      if (vat != null) 'vat': vat,
      if (officialId != null) 'officialId': officialId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'name': name,
      if (vat != null) 'vat': vat,
      if (officialId != null) 'officialId': officialId,
    };
  }

  static CompanyInclude include({_i2.TattooArtistInclude? owner}) {
    return CompanyInclude._(owner: owner);
  }

  static CompanyIncludeList includeList({
    _i1.WhereExpressionBuilder<CompanyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CompanyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompanyTable>? orderByList,
    CompanyInclude? include,
  }) {
    return CompanyIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Company.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Company.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CompanyImpl extends Company {
  _CompanyImpl({
    int? id,
    required int ownerId,
    _i2.TattooArtist? owner,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String name,
    int? vat,
    String? officialId,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          createdAt: createdAt,
          updatedAt: updatedAt,
          name: name,
          vat: vat,
          officialId: officialId,
        );

  /// Returns a shallow copy of this [Company]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Company copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    Object? vat = _Undefined,
    Object? officialId = _Undefined,
  }) {
    return Company(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.TattooArtist? ? owner : this.owner?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      vat: vat is int? ? vat : this.vat,
      officialId: officialId is String? ? officialId : this.officialId,
    );
  }
}

class CompanyTable extends _i1.Table {
  CompanyTable({super.tableRelation}) : super(tableName: 'company') {
    ownerId = _i1.ColumnInt(
      'ownerId',
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
    name = _i1.ColumnString(
      'name',
      this,
    );
    vat = _i1.ColumnInt(
      'vat',
      this,
    );
    officialId = _i1.ColumnString(
      'officialId',
      this,
    );
  }

  late final _i1.ColumnInt ownerId;

  _i2.TattooArtistTable? _owner;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnString name;

  late final _i1.ColumnInt vat;

  /// The identifier of the company (SIREN, VAT number, ...)
  late final _i1.ColumnString officialId;

  _i2.TattooArtistTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: Company.t.ownerId,
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
        ownerId,
        createdAt,
        updatedAt,
        name,
        vat,
        officialId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    return null;
  }
}

class CompanyInclude extends _i1.IncludeObject {
  CompanyInclude._({_i2.TattooArtistInclude? owner}) {
    _owner = owner;
  }

  _i2.TattooArtistInclude? _owner;

  @override
  Map<String, _i1.Include?> get includes => {'owner': _owner};

  @override
  _i1.Table get table => Company.t;
}

class CompanyIncludeList extends _i1.IncludeList {
  CompanyIncludeList._({
    _i1.WhereExpressionBuilder<CompanyTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Company.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Company.t;
}

class CompanyRepository {
  const CompanyRepository._();

  final attachRow = const CompanyAttachRowRepository._();

  /// Returns a list of [Company]s matching the given query parameters.
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
  Future<List<Company>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompanyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CompanyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompanyTable>? orderByList,
    _i1.Transaction? transaction,
    CompanyInclude? include,
  }) async {
    return session.db.find<Company>(
      where: where?.call(Company.t),
      orderBy: orderBy?.call(Company.t),
      orderByList: orderByList?.call(Company.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Company] matching the given query parameters.
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
  Future<Company?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompanyTable>? where,
    int? offset,
    _i1.OrderByBuilder<CompanyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompanyTable>? orderByList,
    _i1.Transaction? transaction,
    CompanyInclude? include,
  }) async {
    return session.db.findFirstRow<Company>(
      where: where?.call(Company.t),
      orderBy: orderBy?.call(Company.t),
      orderByList: orderByList?.call(Company.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Company] by its [id] or null if no such row exists.
  Future<Company?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CompanyInclude? include,
  }) async {
    return session.db.findById<Company>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Company]s in the list and returns the inserted rows.
  ///
  /// The returned [Company]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Company>> insert(
    _i1.Session session,
    List<Company> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Company>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Company] and returns the inserted row.
  ///
  /// The returned [Company] will have its `id` field set.
  Future<Company> insertRow(
    _i1.Session session,
    Company row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Company>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Company]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Company>> update(
    _i1.Session session,
    List<Company> rows, {
    _i1.ColumnSelections<CompanyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Company>(
      rows,
      columns: columns?.call(Company.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Company]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Company> updateRow(
    _i1.Session session,
    Company row, {
    _i1.ColumnSelections<CompanyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Company>(
      row,
      columns: columns?.call(Company.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Company]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Company>> delete(
    _i1.Session session,
    List<Company> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Company>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Company].
  Future<Company> deleteRow(
    _i1.Session session,
    Company row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Company>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Company>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CompanyTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Company>(
      where: where(Company.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompanyTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Company>(
      where: where?.call(Company.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CompanyAttachRowRepository {
  const CompanyAttachRowRepository._();

  /// Creates a relation between the given [Company] and [TattooArtist]
  /// by setting the [Company]'s foreign key `ownerId` to refer to the [TattooArtist].
  Future<void> owner(
    _i1.Session session,
    Company company,
    _i2.TattooArtist owner, {
    _i1.Transaction? transaction,
  }) async {
    if (company.id == null) {
      throw ArgumentError.notNull('company.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $company = company.copyWith(ownerId: owner.id);
    await session.db.updateRow<Company>(
      $company,
      columns: [Company.t.ownerId],
      transaction: transaction,
    );
  }
}
