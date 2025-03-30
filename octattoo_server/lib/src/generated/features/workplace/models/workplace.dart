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
import '../../../features/shared/models/address.dart' as _i2;
import '../../../features/tattoo_artist/models/tattoo_artist.dart' as _i3;

/// A Workplace is a place where TattooArtists work (i.e. Tattoo Shop)
abstract class Workplace implements _i1.TableRow, _i1.ProtocolSerialization {
  Workplace._({
    this.id,
    required this.name,
    required this.addressId,
    this.address,
    required this.isPublic,
    required this.createdAt,
    required this.updatedAt,
    this.managedBy,
  });

  factory Workplace({
    int? id,
    required String name,
    required int addressId,
    _i2.Address? address,
    required bool isPublic,
    required DateTime createdAt,
    required DateTime updatedAt,
    List<_i3.TattooArtist>? managedBy,
  }) = _WorkplaceImpl;

  factory Workplace.fromJson(Map<String, dynamic> jsonSerialization) {
    return Workplace(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      addressId: jsonSerialization['addressId'] as int,
      address: jsonSerialization['address'] == null
          ? null
          : _i2.Address.fromJson(
              (jsonSerialization['address'] as Map<String, dynamic>)),
      isPublic: jsonSerialization['isPublic'] as bool,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      managedBy: (jsonSerialization['managedBy'] as List?)
          ?.map((e) => _i3.TattooArtist.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = WorkplaceTable();

  static const db = WorkplaceRepository._();

  @override
  int? id;

  String name;

  int addressId;

  _i2.Address? address;

  bool isPublic;

  DateTime createdAt;

  DateTime updatedAt;

  List<_i3.TattooArtist>? managedBy;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [Workplace]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Workplace copyWith({
    int? id,
    String? name,
    int? addressId,
    _i2.Address? address,
    bool? isPublic,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i3.TattooArtist>? managedBy,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'addressId': addressId,
      if (address != null) 'address': address?.toJson(),
      'isPublic': isPublic,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (managedBy != null)
        'managedBy': managedBy?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'addressId': addressId,
      if (address != null) 'address': address?.toJsonForProtocol(),
      'isPublic': isPublic,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (managedBy != null)
        'managedBy':
            managedBy?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static WorkplaceInclude include({
    _i2.AddressInclude? address,
    _i3.TattooArtistIncludeList? managedBy,
  }) {
    return WorkplaceInclude._(
      address: address,
      managedBy: managedBy,
    );
  }

  static WorkplaceIncludeList includeList({
    _i1.WhereExpressionBuilder<WorkplaceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WorkplaceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WorkplaceTable>? orderByList,
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
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WorkplaceImpl extends Workplace {
  _WorkplaceImpl({
    int? id,
    required String name,
    required int addressId,
    _i2.Address? address,
    required bool isPublic,
    required DateTime createdAt,
    required DateTime updatedAt,
    List<_i3.TattooArtist>? managedBy,
  }) : super._(
          id: id,
          name: name,
          addressId: addressId,
          address: address,
          isPublic: isPublic,
          createdAt: createdAt,
          updatedAt: updatedAt,
          managedBy: managedBy,
        );

  /// Returns a shallow copy of this [Workplace]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Workplace copyWith({
    Object? id = _Undefined,
    String? name,
    int? addressId,
    Object? address = _Undefined,
    bool? isPublic,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? managedBy = _Undefined,
  }) {
    return Workplace(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      addressId: addressId ?? this.addressId,
      address: address is _i2.Address? ? address : this.address?.copyWith(),
      isPublic: isPublic ?? this.isPublic,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      managedBy: managedBy is List<_i3.TattooArtist>?
          ? managedBy
          : this.managedBy?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class WorkplaceTable extends _i1.Table {
  WorkplaceTable({super.tableRelation}) : super(tableName: 'workplace') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    addressId = _i1.ColumnInt(
      'addressId',
      this,
    );
    isPublic = _i1.ColumnBool(
      'isPublic',
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
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnInt addressId;

  _i2.AddressTable? _address;

  late final _i1.ColumnBool isPublic;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i3.TattooArtistTable? ___managedBy;

  _i1.ManyRelation<_i3.TattooArtistTable>? _managedBy;

  _i2.AddressTable get address {
    if (_address != null) return _address!;
    _address = _i1.createRelationTable(
      relationFieldName: 'address',
      field: Workplace.t.addressId,
      foreignField: _i2.Address.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AddressTable(tableRelation: foreignTableRelation),
    );
    return _address!;
  }

  _i3.TattooArtistTable get __managedBy {
    if (___managedBy != null) return ___managedBy!;
    ___managedBy = _i1.createRelationTable(
      relationFieldName: '__managedBy',
      field: Workplace.t.id,
      foreignField: _i3.TattooArtist.t.$_workplaceManagedbyWorkplaceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.TattooArtistTable(tableRelation: foreignTableRelation),
    );
    return ___managedBy!;
  }

  _i1.ManyRelation<_i3.TattooArtistTable> get managedBy {
    if (_managedBy != null) return _managedBy!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'managedBy',
      field: Workplace.t.id,
      foreignField: _i3.TattooArtist.t.$_workplaceManagedbyWorkplaceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.TattooArtistTable(tableRelation: foreignTableRelation),
    );
    _managedBy = _i1.ManyRelation<_i3.TattooArtistTable>(
      tableWithRelations: relationTable,
      table: _i3.TattooArtistTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _managedBy!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        addressId,
        isPublic,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'address') {
      return address;
    }
    if (relationField == 'managedBy') {
      return __managedBy;
    }
    return null;
  }
}

class WorkplaceInclude extends _i1.IncludeObject {
  WorkplaceInclude._({
    _i2.AddressInclude? address,
    _i3.TattooArtistIncludeList? managedBy,
  }) {
    _address = address;
    _managedBy = managedBy;
  }

  _i2.AddressInclude? _address;

  _i3.TattooArtistIncludeList? _managedBy;

  @override
  Map<String, _i1.Include?> get includes => {
        'address': _address,
        'managedBy': _managedBy,
      };

  @override
  _i1.Table get table => Workplace.t;
}

class WorkplaceIncludeList extends _i1.IncludeList {
  WorkplaceIncludeList._({
    _i1.WhereExpressionBuilder<WorkplaceTable>? where,
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
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Workplace.t;
}

class WorkplaceRepository {
  const WorkplaceRepository._();

  final attach = const WorkplaceAttachRepository._();

  final attachRow = const WorkplaceAttachRowRepository._();

  final detach = const WorkplaceDetachRepository._();

  final detachRow = const WorkplaceDetachRowRepository._();

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
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WorkplaceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WorkplaceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WorkplaceTable>? orderByList,
    _i1.Transaction? transaction,
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
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WorkplaceTable>? where,
    int? offset,
    _i1.OrderByBuilder<WorkplaceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WorkplaceTable>? orderByList,
    _i1.Transaction? transaction,
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
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
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
    _i1.Session session,
    List<Workplace> rows, {
    _i1.Transaction? transaction,
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
    _i1.Session session,
    Workplace row, {
    _i1.Transaction? transaction,
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
    _i1.Session session,
    List<Workplace> rows, {
    _i1.ColumnSelections<WorkplaceTable>? columns,
    _i1.Transaction? transaction,
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
    _i1.Session session,
    Workplace row, {
    _i1.ColumnSelections<WorkplaceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Workplace>(
      row,
      columns: columns?.call(Workplace.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Workplace]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Workplace>> delete(
    _i1.Session session,
    List<Workplace> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Workplace>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Workplace].
  Future<Workplace> deleteRow(
    _i1.Session session,
    Workplace row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Workplace>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Workplace>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<WorkplaceTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Workplace>(
      where: where(Workplace.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WorkplaceTable>? where,
    int? limit,
    _i1.Transaction? transaction,
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

  /// Creates a relation between this [Workplace] and the given [TattooArtist]s
  /// by setting each [TattooArtist]'s foreign key `_workplaceManagedbyWorkplaceId` to refer to this [Workplace].
  Future<void> managedBy(
    _i1.Session session,
    Workplace workplace,
    List<_i3.TattooArtist> tattooArtist, {
    _i1.Transaction? transaction,
  }) async {
    if (tattooArtist.any((e) => e.id == null)) {
      throw ArgumentError.notNull('tattooArtist.id');
    }
    if (workplace.id == null) {
      throw ArgumentError.notNull('workplace.id');
    }

    var $tattooArtist = tattooArtist
        .map((e) => _i3.TattooArtistImplicit(
              e,
              $_workplaceManagedbyWorkplaceId: workplace.id,
            ))
        .toList();
    await session.db.update<_i3.TattooArtist>(
      $tattooArtist,
      columns: [_i3.TattooArtist.t.$_workplaceManagedbyWorkplaceId],
      transaction: transaction,
    );
  }
}

class WorkplaceAttachRowRepository {
  const WorkplaceAttachRowRepository._();

  /// Creates a relation between the given [Workplace] and [Address]
  /// by setting the [Workplace]'s foreign key `addressId` to refer to the [Address].
  Future<void> address(
    _i1.Session session,
    Workplace workplace,
    _i2.Address address, {
    _i1.Transaction? transaction,
  }) async {
    if (workplace.id == null) {
      throw ArgumentError.notNull('workplace.id');
    }
    if (address.id == null) {
      throw ArgumentError.notNull('address.id');
    }

    var $workplace = workplace.copyWith(addressId: address.id);
    await session.db.updateRow<Workplace>(
      $workplace,
      columns: [Workplace.t.addressId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Workplace] and the given [TattooArtist]
  /// by setting the [TattooArtist]'s foreign key `_workplaceManagedbyWorkplaceId` to refer to this [Workplace].
  Future<void> managedBy(
    _i1.Session session,
    Workplace workplace,
    _i3.TattooArtist tattooArtist, {
    _i1.Transaction? transaction,
  }) async {
    if (tattooArtist.id == null) {
      throw ArgumentError.notNull('tattooArtist.id');
    }
    if (workplace.id == null) {
      throw ArgumentError.notNull('workplace.id');
    }

    var $tattooArtist = _i3.TattooArtistImplicit(
      tattooArtist,
      $_workplaceManagedbyWorkplaceId: workplace.id,
    );
    await session.db.updateRow<_i3.TattooArtist>(
      $tattooArtist,
      columns: [_i3.TattooArtist.t.$_workplaceManagedbyWorkplaceId],
      transaction: transaction,
    );
  }
}

class WorkplaceDetachRepository {
  const WorkplaceDetachRepository._();

  /// Detaches the relation between this [Workplace] and the given [TattooArtist]
  /// by setting the [TattooArtist]'s foreign key `_workplaceManagedbyWorkplaceId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> managedBy(
    _i1.Session session,
    List<_i3.TattooArtist> tattooArtist, {
    _i1.Transaction? transaction,
  }) async {
    if (tattooArtist.any((e) => e.id == null)) {
      throw ArgumentError.notNull('tattooArtist.id');
    }

    var $tattooArtist = tattooArtist
        .map((e) => _i3.TattooArtistImplicit(
              e,
              $_workplaceManagedbyWorkplaceId: null,
            ))
        .toList();
    await session.db.update<_i3.TattooArtist>(
      $tattooArtist,
      columns: [_i3.TattooArtist.t.$_workplaceManagedbyWorkplaceId],
      transaction: transaction,
    );
  }
}

class WorkplaceDetachRowRepository {
  const WorkplaceDetachRowRepository._();

  /// Detaches the relation between this [Workplace] and the given [TattooArtist]
  /// by setting the [TattooArtist]'s foreign key `_workplaceManagedbyWorkplaceId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> managedBy(
    _i1.Session session,
    _i3.TattooArtist tattooArtist, {
    _i1.Transaction? transaction,
  }) async {
    if (tattooArtist.id == null) {
      throw ArgumentError.notNull('tattooArtist.id');
    }

    var $tattooArtist = _i3.TattooArtistImplicit(
      tattooArtist,
      $_workplaceManagedbyWorkplaceId: null,
    );
    await session.db.updateRow<_i3.TattooArtist>(
      $tattooArtist,
      columns: [_i3.TattooArtist.t.$_workplaceManagedbyWorkplaceId],
      transaction: transaction,
    );
  }
}
