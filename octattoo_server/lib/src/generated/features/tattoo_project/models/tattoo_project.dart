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
import '../../../features/customer/models/customer.dart' as _i3;
import '../../../features/picture_album/models/picture_album.dart' as _i4;

/// A TattooProject is a tattoo project between a Customer and a TattooArtist
abstract class TattooProject
    implements _i1.TableRow, _i1.ProtocolSerialization {
  TattooProject._({
    this.id,
    required this.tattooArtistId,
    this.tattooArtist,
    required this.customerId,
    this.customer,
    required this.name,
    required this.description,
    required this.albumId,
    this.album,
    this.position,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TattooProject({
    int? id,
    required int tattooArtistId,
    _i2.TattooArtist? tattooArtist,
    required int customerId,
    _i3.Customer? customer,
    required String name,
    required String description,
    required int albumId,
    _i4.PictureAlbum? album,
    String? position,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TattooProjectImpl;

  factory TattooProject.fromJson(Map<String, dynamic> jsonSerialization) {
    return TattooProject(
      id: jsonSerialization['id'] as int?,
      tattooArtistId: jsonSerialization['tattooArtistId'] as int,
      tattooArtist: jsonSerialization['tattooArtist'] == null
          ? null
          : _i2.TattooArtist.fromJson(
              (jsonSerialization['tattooArtist'] as Map<String, dynamic>)),
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i3.Customer.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      albumId: jsonSerialization['albumId'] as int,
      album: jsonSerialization['album'] == null
          ? null
          : _i4.PictureAlbum.fromJson(
              (jsonSerialization['album'] as Map<String, dynamic>)),
      position: jsonSerialization['position'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = TattooProjectTable();

  static const db = TattooProjectRepository._();

  @override
  int? id;

  int tattooArtistId;

  _i2.TattooArtist? tattooArtist;

  int customerId;

  _i3.Customer? customer;

  String name;

  String description;

  int albumId;

  _i4.PictureAlbum? album;

  String? position;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [TattooProject]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TattooProject copyWith({
    int? id,
    int? tattooArtistId,
    _i2.TattooArtist? tattooArtist,
    int? customerId,
    _i3.Customer? customer,
    String? name,
    String? description,
    int? albumId,
    _i4.PictureAlbum? album,
    String? position,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tattooArtistId': tattooArtistId,
      if (tattooArtist != null) 'tattooArtist': tattooArtist?.toJson(),
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      'name': name,
      'description': description,
      'albumId': albumId,
      if (album != null) 'album': album?.toJson(),
      if (position != null) 'position': position,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'tattooArtistId': tattooArtistId,
      if (tattooArtist != null)
        'tattooArtist': tattooArtist?.toJsonForProtocol(),
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      'name': name,
      'description': description,
      'albumId': albumId,
      if (album != null) 'album': album?.toJsonForProtocol(),
      if (position != null) 'position': position,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static TattooProjectInclude include({
    _i2.TattooArtistInclude? tattooArtist,
    _i3.CustomerInclude? customer,
    _i4.PictureAlbumInclude? album,
  }) {
    return TattooProjectInclude._(
      tattooArtist: tattooArtist,
      customer: customer,
      album: album,
    );
  }

  static TattooProjectIncludeList includeList({
    _i1.WhereExpressionBuilder<TattooProjectTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TattooProjectTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TattooProjectTable>? orderByList,
    TattooProjectInclude? include,
  }) {
    return TattooProjectIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TattooProject.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TattooProject.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TattooProjectImpl extends TattooProject {
  _TattooProjectImpl({
    int? id,
    required int tattooArtistId,
    _i2.TattooArtist? tattooArtist,
    required int customerId,
    _i3.Customer? customer,
    required String name,
    required String description,
    required int albumId,
    _i4.PictureAlbum? album,
    String? position,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          tattooArtistId: tattooArtistId,
          tattooArtist: tattooArtist,
          customerId: customerId,
          customer: customer,
          name: name,
          description: description,
          albumId: albumId,
          album: album,
          position: position,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [TattooProject]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TattooProject copyWith({
    Object? id = _Undefined,
    int? tattooArtistId,
    Object? tattooArtist = _Undefined,
    int? customerId,
    Object? customer = _Undefined,
    String? name,
    String? description,
    int? albumId,
    Object? album = _Undefined,
    Object? position = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TattooProject(
      id: id is int? ? id : this.id,
      tattooArtistId: tattooArtistId ?? this.tattooArtistId,
      tattooArtist: tattooArtist is _i2.TattooArtist?
          ? tattooArtist
          : this.tattooArtist?.copyWith(),
      customerId: customerId ?? this.customerId,
      customer:
          customer is _i3.Customer? ? customer : this.customer?.copyWith(),
      name: name ?? this.name,
      description: description ?? this.description,
      albumId: albumId ?? this.albumId,
      album: album is _i4.PictureAlbum? ? album : this.album?.copyWith(),
      position: position is String? ? position : this.position,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class TattooProjectTable extends _i1.Table {
  TattooProjectTable({super.tableRelation})
      : super(tableName: 'tattoo_project') {
    tattooArtistId = _i1.ColumnInt(
      'tattooArtistId',
      this,
    );
    customerId = _i1.ColumnInt(
      'customerId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    albumId = _i1.ColumnInt(
      'albumId',
      this,
    );
    position = _i1.ColumnString(
      'position',
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

  late final _i1.ColumnInt tattooArtistId;

  _i2.TattooArtistTable? _tattooArtist;

  late final _i1.ColumnInt customerId;

  _i3.CustomerTable? _customer;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt albumId;

  _i4.PictureAlbumTable? _album;

  late final _i1.ColumnString position;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.TattooArtistTable get tattooArtist {
    if (_tattooArtist != null) return _tattooArtist!;
    _tattooArtist = _i1.createRelationTable(
      relationFieldName: 'tattooArtist',
      field: TattooProject.t.tattooArtistId,
      foreignField: _i2.TattooArtist.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TattooArtistTable(tableRelation: foreignTableRelation),
    );
    return _tattooArtist!;
  }

  _i3.CustomerTable get customer {
    if (_customer != null) return _customer!;
    _customer = _i1.createRelationTable(
      relationFieldName: 'customer',
      field: TattooProject.t.customerId,
      foreignField: _i3.Customer.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.CustomerTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  _i4.PictureAlbumTable get album {
    if (_album != null) return _album!;
    _album = _i1.createRelationTable(
      relationFieldName: 'album',
      field: TattooProject.t.albumId,
      foreignField: _i4.PictureAlbum.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.PictureAlbumTable(tableRelation: foreignTableRelation),
    );
    return _album!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        tattooArtistId,
        customerId,
        name,
        description,
        albumId,
        position,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'tattooArtist') {
      return tattooArtist;
    }
    if (relationField == 'customer') {
      return customer;
    }
    if (relationField == 'album') {
      return album;
    }
    return null;
  }
}

class TattooProjectInclude extends _i1.IncludeObject {
  TattooProjectInclude._({
    _i2.TattooArtistInclude? tattooArtist,
    _i3.CustomerInclude? customer,
    _i4.PictureAlbumInclude? album,
  }) {
    _tattooArtist = tattooArtist;
    _customer = customer;
    _album = album;
  }

  _i2.TattooArtistInclude? _tattooArtist;

  _i3.CustomerInclude? _customer;

  _i4.PictureAlbumInclude? _album;

  @override
  Map<String, _i1.Include?> get includes => {
        'tattooArtist': _tattooArtist,
        'customer': _customer,
        'album': _album,
      };

  @override
  _i1.Table get table => TattooProject.t;
}

class TattooProjectIncludeList extends _i1.IncludeList {
  TattooProjectIncludeList._({
    _i1.WhereExpressionBuilder<TattooProjectTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TattooProject.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => TattooProject.t;
}

class TattooProjectRepository {
  const TattooProjectRepository._();

  final attachRow = const TattooProjectAttachRowRepository._();

  /// Returns a list of [TattooProject]s matching the given query parameters.
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
  Future<List<TattooProject>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TattooProjectTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TattooProjectTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TattooProjectTable>? orderByList,
    _i1.Transaction? transaction,
    TattooProjectInclude? include,
  }) async {
    return session.db.find<TattooProject>(
      where: where?.call(TattooProject.t),
      orderBy: orderBy?.call(TattooProject.t),
      orderByList: orderByList?.call(TattooProject.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [TattooProject] matching the given query parameters.
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
  Future<TattooProject?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TattooProjectTable>? where,
    int? offset,
    _i1.OrderByBuilder<TattooProjectTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TattooProjectTable>? orderByList,
    _i1.Transaction? transaction,
    TattooProjectInclude? include,
  }) async {
    return session.db.findFirstRow<TattooProject>(
      where: where?.call(TattooProject.t),
      orderBy: orderBy?.call(TattooProject.t),
      orderByList: orderByList?.call(TattooProject.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [TattooProject] by its [id] or null if no such row exists.
  Future<TattooProject?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    TattooProjectInclude? include,
  }) async {
    return session.db.findById<TattooProject>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [TattooProject]s in the list and returns the inserted rows.
  ///
  /// The returned [TattooProject]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<TattooProject>> insert(
    _i1.Session session,
    List<TattooProject> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TattooProject>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [TattooProject] and returns the inserted row.
  ///
  /// The returned [TattooProject] will have its `id` field set.
  Future<TattooProject> insertRow(
    _i1.Session session,
    TattooProject row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TattooProject>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TattooProject]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TattooProject>> update(
    _i1.Session session,
    List<TattooProject> rows, {
    _i1.ColumnSelections<TattooProjectTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TattooProject>(
      rows,
      columns: columns?.call(TattooProject.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TattooProject]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TattooProject> updateRow(
    _i1.Session session,
    TattooProject row, {
    _i1.ColumnSelections<TattooProjectTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TattooProject>(
      row,
      columns: columns?.call(TattooProject.t),
      transaction: transaction,
    );
  }

  /// Deletes all [TattooProject]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TattooProject>> delete(
    _i1.Session session,
    List<TattooProject> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TattooProject>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TattooProject].
  Future<TattooProject> deleteRow(
    _i1.Session session,
    TattooProject row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TattooProject>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TattooProject>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TattooProjectTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TattooProject>(
      where: where(TattooProject.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TattooProjectTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TattooProject>(
      where: where?.call(TattooProject.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class TattooProjectAttachRowRepository {
  const TattooProjectAttachRowRepository._();

  /// Creates a relation between the given [TattooProject] and [TattooArtist]
  /// by setting the [TattooProject]'s foreign key `tattooArtistId` to refer to the [TattooArtist].
  Future<void> tattooArtist(
    _i1.Session session,
    TattooProject tattooProject,
    _i2.TattooArtist tattooArtist, {
    _i1.Transaction? transaction,
  }) async {
    if (tattooProject.id == null) {
      throw ArgumentError.notNull('tattooProject.id');
    }
    if (tattooArtist.id == null) {
      throw ArgumentError.notNull('tattooArtist.id');
    }

    var $tattooProject =
        tattooProject.copyWith(tattooArtistId: tattooArtist.id);
    await session.db.updateRow<TattooProject>(
      $tattooProject,
      columns: [TattooProject.t.tattooArtistId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [TattooProject] and [Customer]
  /// by setting the [TattooProject]'s foreign key `customerId` to refer to the [Customer].
  Future<void> customer(
    _i1.Session session,
    TattooProject tattooProject,
    _i3.Customer customer, {
    _i1.Transaction? transaction,
  }) async {
    if (tattooProject.id == null) {
      throw ArgumentError.notNull('tattooProject.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $tattooProject = tattooProject.copyWith(customerId: customer.id);
    await session.db.updateRow<TattooProject>(
      $tattooProject,
      columns: [TattooProject.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [TattooProject] and [PictureAlbum]
  /// by setting the [TattooProject]'s foreign key `albumId` to refer to the [PictureAlbum].
  Future<void> album(
    _i1.Session session,
    TattooProject tattooProject,
    _i4.PictureAlbum album, {
    _i1.Transaction? transaction,
  }) async {
    if (tattooProject.id == null) {
      throw ArgumentError.notNull('tattooProject.id');
    }
    if (album.id == null) {
      throw ArgumentError.notNull('album.id');
    }

    var $tattooProject = tattooProject.copyWith(albumId: album.id);
    await session.db.updateRow<TattooProject>(
      $tattooProject,
      columns: [TattooProject.t.albumId],
      transaction: transaction,
    );
  }
}
