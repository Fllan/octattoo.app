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

/// A picture is a file image uploaded by a User
abstract class Picture implements _i1.TableRow, _i1.ProtocolSerialization {
  Picture._({
    this.id,
    required this.ownerId,
    this.owner,
    required this.path,
  });

  factory Picture({
    int? id,
    required int ownerId,
    _i2.User? owner,
    required String path,
  }) = _PictureImpl;

  factory Picture.fromJson(Map<String, dynamic> jsonSerialization) {
    return Picture(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      path: jsonSerialization['path'] as String,
    );
  }

  static final t = PictureTable();

  static const db = PictureRepository._();

  @override
  int? id;

  int ownerId;

  _i2.User? owner;

  String path;

  int? _pictureAlbumPicturesPictureAlbumId;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [Picture]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Picture copyWith({
    int? id,
    int? ownerId,
    _i2.User? owner,
    String? path,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'path': path,
      if (_pictureAlbumPicturesPictureAlbumId != null)
        '_pictureAlbumPicturesPictureAlbumId':
            _pictureAlbumPicturesPictureAlbumId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      'path': path,
    };
  }

  static PictureInclude include({_i2.UserInclude? owner}) {
    return PictureInclude._(owner: owner);
  }

  static PictureIncludeList includeList({
    _i1.WhereExpressionBuilder<PictureTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PictureTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PictureTable>? orderByList,
    PictureInclude? include,
  }) {
    return PictureIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Picture.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Picture.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PictureImpl extends Picture {
  _PictureImpl({
    int? id,
    required int ownerId,
    _i2.User? owner,
    required String path,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          path: path,
        );

  /// Returns a shallow copy of this [Picture]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Picture copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    String? path,
  }) {
    return Picture(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.User? ? owner : this.owner?.copyWith(),
      path: path ?? this.path,
    );
  }
}

class PictureImplicit extends _PictureImpl {
  PictureImplicit._({
    int? id,
    required int ownerId,
    _i2.User? owner,
    required String path,
    this.$_pictureAlbumPicturesPictureAlbumId,
  }) : super(
          id: id,
          ownerId: ownerId,
          owner: owner,
          path: path,
        );

  factory PictureImplicit(
    Picture picture, {
    int? $_pictureAlbumPicturesPictureAlbumId,
  }) {
    return PictureImplicit._(
      id: picture.id,
      ownerId: picture.ownerId,
      owner: picture.owner,
      path: picture.path,
      $_pictureAlbumPicturesPictureAlbumId:
          $_pictureAlbumPicturesPictureAlbumId,
    );
  }

  int? $_pictureAlbumPicturesPictureAlbumId;

  @override
  Map<String, dynamic> toJson() {
    var jsonMap = super.toJson();
    jsonMap.addAll({
      '_pictureAlbumPicturesPictureAlbumId':
          $_pictureAlbumPicturesPictureAlbumId
    });
    return jsonMap;
  }
}

class PictureTable extends _i1.Table {
  PictureTable({super.tableRelation}) : super(tableName: 'picture') {
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    path = _i1.ColumnString(
      'path',
      this,
    );
    $_pictureAlbumPicturesPictureAlbumId = _i1.ColumnInt(
      '_pictureAlbumPicturesPictureAlbumId',
      this,
    );
  }

  late final _i1.ColumnInt ownerId;

  _i2.UserTable? _owner;

  late final _i1.ColumnString path;

  late final _i1.ColumnInt $_pictureAlbumPicturesPictureAlbumId;

  _i2.UserTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: Picture.t.ownerId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        ownerId,
        path,
        $_pictureAlbumPicturesPictureAlbumId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    return null;
  }
}

class PictureInclude extends _i1.IncludeObject {
  PictureInclude._({_i2.UserInclude? owner}) {
    _owner = owner;
  }

  _i2.UserInclude? _owner;

  @override
  Map<String, _i1.Include?> get includes => {'owner': _owner};

  @override
  _i1.Table get table => Picture.t;
}

class PictureIncludeList extends _i1.IncludeList {
  PictureIncludeList._({
    _i1.WhereExpressionBuilder<PictureTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Picture.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Picture.t;
}

class PictureRepository {
  const PictureRepository._();

  final attachRow = const PictureAttachRowRepository._();

  /// Returns a list of [Picture]s matching the given query parameters.
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
  Future<List<Picture>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PictureTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PictureTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PictureTable>? orderByList,
    _i1.Transaction? transaction,
    PictureInclude? include,
  }) async {
    return session.db.find<Picture>(
      where: where?.call(Picture.t),
      orderBy: orderBy?.call(Picture.t),
      orderByList: orderByList?.call(Picture.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Picture] matching the given query parameters.
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
  Future<Picture?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PictureTable>? where,
    int? offset,
    _i1.OrderByBuilder<PictureTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PictureTable>? orderByList,
    _i1.Transaction? transaction,
    PictureInclude? include,
  }) async {
    return session.db.findFirstRow<Picture>(
      where: where?.call(Picture.t),
      orderBy: orderBy?.call(Picture.t),
      orderByList: orderByList?.call(Picture.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Picture] by its [id] or null if no such row exists.
  Future<Picture?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PictureInclude? include,
  }) async {
    return session.db.findById<Picture>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Picture]s in the list and returns the inserted rows.
  ///
  /// The returned [Picture]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Picture>> insert(
    _i1.Session session,
    List<Picture> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Picture>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Picture] and returns the inserted row.
  ///
  /// The returned [Picture] will have its `id` field set.
  Future<Picture> insertRow(
    _i1.Session session,
    Picture row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Picture>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Picture]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Picture>> update(
    _i1.Session session,
    List<Picture> rows, {
    _i1.ColumnSelections<PictureTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Picture>(
      rows,
      columns: columns?.call(Picture.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Picture]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Picture> updateRow(
    _i1.Session session,
    Picture row, {
    _i1.ColumnSelections<PictureTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Picture>(
      row,
      columns: columns?.call(Picture.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Picture]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Picture>> delete(
    _i1.Session session,
    List<Picture> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Picture>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Picture].
  Future<Picture> deleteRow(
    _i1.Session session,
    Picture row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Picture>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Picture>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PictureTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Picture>(
      where: where(Picture.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PictureTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Picture>(
      where: where?.call(Picture.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PictureAttachRowRepository {
  const PictureAttachRowRepository._();

  /// Creates a relation between the given [Picture] and [User]
  /// by setting the [Picture]'s foreign key `ownerId` to refer to the [User].
  Future<void> owner(
    _i1.Session session,
    Picture picture,
    _i2.User owner, {
    _i1.Transaction? transaction,
  }) async {
    if (picture.id == null) {
      throw ArgumentError.notNull('picture.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $picture = picture.copyWith(ownerId: owner.id);
    await session.db.updateRow<Picture>(
      $picture,
      columns: [Picture.t.ownerId],
      transaction: transaction,
    );
  }
}
