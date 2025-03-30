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
import '../../../features/picture_album/models/picture.dart' as _i3;

/// A PictureAlbum is an album of related pictures
abstract class PictureAlbum implements _i1.TableRow, _i1.ProtocolSerialization {
  PictureAlbum._({
    this.id,
    required this.createdById,
    this.createdBy,
    this.pictures,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PictureAlbum({
    int? id,
    required int createdById,
    _i2.User? createdBy,
    List<_i3.Picture>? pictures,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PictureAlbumImpl;

  factory PictureAlbum.fromJson(Map<String, dynamic> jsonSerialization) {
    return PictureAlbum(
      id: jsonSerialization['id'] as int?,
      createdById: jsonSerialization['createdById'] as int,
      createdBy: jsonSerialization['createdBy'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['createdBy'] as Map<String, dynamic>)),
      pictures: (jsonSerialization['pictures'] as List?)
          ?.map((e) => _i3.Picture.fromJson((e as Map<String, dynamic>)))
          .toList(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = PictureAlbumTable();

  static const db = PictureAlbumRepository._();

  @override
  int? id;

  int createdById;

  _i2.User? createdBy;

  List<_i3.Picture>? pictures;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [PictureAlbum]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PictureAlbum copyWith({
    int? id,
    int? createdById,
    _i2.User? createdBy,
    List<_i3.Picture>? pictures,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'createdById': createdById,
      if (createdBy != null) 'createdBy': createdBy?.toJson(),
      if (pictures != null)
        'pictures': pictures?.toJson(valueToJson: (v) => v.toJson()),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'createdById': createdById,
      if (createdBy != null) 'createdBy': createdBy?.toJsonForProtocol(),
      if (pictures != null)
        'pictures': pictures?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static PictureAlbumInclude include({
    _i2.UserInclude? createdBy,
    _i3.PictureIncludeList? pictures,
  }) {
    return PictureAlbumInclude._(
      createdBy: createdBy,
      pictures: pictures,
    );
  }

  static PictureAlbumIncludeList includeList({
    _i1.WhereExpressionBuilder<PictureAlbumTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PictureAlbumTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PictureAlbumTable>? orderByList,
    PictureAlbumInclude? include,
  }) {
    return PictureAlbumIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PictureAlbum.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PictureAlbum.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PictureAlbumImpl extends PictureAlbum {
  _PictureAlbumImpl({
    int? id,
    required int createdById,
    _i2.User? createdBy,
    List<_i3.Picture>? pictures,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          createdById: createdById,
          createdBy: createdBy,
          pictures: pictures,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [PictureAlbum]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PictureAlbum copyWith({
    Object? id = _Undefined,
    int? createdById,
    Object? createdBy = _Undefined,
    Object? pictures = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PictureAlbum(
      id: id is int? ? id : this.id,
      createdById: createdById ?? this.createdById,
      createdBy:
          createdBy is _i2.User? ? createdBy : this.createdBy?.copyWith(),
      pictures: pictures is List<_i3.Picture>?
          ? pictures
          : this.pictures?.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class PictureAlbumTable extends _i1.Table {
  PictureAlbumTable({super.tableRelation}) : super(tableName: 'picture_album') {
    createdById = _i1.ColumnInt(
      'createdById',
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

  late final _i1.ColumnInt createdById;

  _i2.UserTable? _createdBy;

  _i3.PictureTable? ___pictures;

  _i1.ManyRelation<_i3.PictureTable>? _pictures;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.UserTable get createdBy {
    if (_createdBy != null) return _createdBy!;
    _createdBy = _i1.createRelationTable(
      relationFieldName: 'createdBy',
      field: PictureAlbum.t.createdById,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _createdBy!;
  }

  _i3.PictureTable get __pictures {
    if (___pictures != null) return ___pictures!;
    ___pictures = _i1.createRelationTable(
      relationFieldName: '__pictures',
      field: PictureAlbum.t.id,
      foreignField: _i3.Picture.t.$_pictureAlbumPicturesPictureAlbumId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PictureTable(tableRelation: foreignTableRelation),
    );
    return ___pictures!;
  }

  _i1.ManyRelation<_i3.PictureTable> get pictures {
    if (_pictures != null) return _pictures!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'pictures',
      field: PictureAlbum.t.id,
      foreignField: _i3.Picture.t.$_pictureAlbumPicturesPictureAlbumId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PictureTable(tableRelation: foreignTableRelation),
    );
    _pictures = _i1.ManyRelation<_i3.PictureTable>(
      tableWithRelations: relationTable,
      table: _i3.PictureTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _pictures!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        createdById,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'createdBy') {
      return createdBy;
    }
    if (relationField == 'pictures') {
      return __pictures;
    }
    return null;
  }
}

class PictureAlbumInclude extends _i1.IncludeObject {
  PictureAlbumInclude._({
    _i2.UserInclude? createdBy,
    _i3.PictureIncludeList? pictures,
  }) {
    _createdBy = createdBy;
    _pictures = pictures;
  }

  _i2.UserInclude? _createdBy;

  _i3.PictureIncludeList? _pictures;

  @override
  Map<String, _i1.Include?> get includes => {
        'createdBy': _createdBy,
        'pictures': _pictures,
      };

  @override
  _i1.Table get table => PictureAlbum.t;
}

class PictureAlbumIncludeList extends _i1.IncludeList {
  PictureAlbumIncludeList._({
    _i1.WhereExpressionBuilder<PictureAlbumTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PictureAlbum.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => PictureAlbum.t;
}

class PictureAlbumRepository {
  const PictureAlbumRepository._();

  final attach = const PictureAlbumAttachRepository._();

  final attachRow = const PictureAlbumAttachRowRepository._();

  final detach = const PictureAlbumDetachRepository._();

  final detachRow = const PictureAlbumDetachRowRepository._();

  /// Returns a list of [PictureAlbum]s matching the given query parameters.
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
  Future<List<PictureAlbum>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PictureAlbumTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PictureAlbumTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PictureAlbumTable>? orderByList,
    _i1.Transaction? transaction,
    PictureAlbumInclude? include,
  }) async {
    return session.db.find<PictureAlbum>(
      where: where?.call(PictureAlbum.t),
      orderBy: orderBy?.call(PictureAlbum.t),
      orderByList: orderByList?.call(PictureAlbum.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PictureAlbum] matching the given query parameters.
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
  Future<PictureAlbum?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PictureAlbumTable>? where,
    int? offset,
    _i1.OrderByBuilder<PictureAlbumTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PictureAlbumTable>? orderByList,
    _i1.Transaction? transaction,
    PictureAlbumInclude? include,
  }) async {
    return session.db.findFirstRow<PictureAlbum>(
      where: where?.call(PictureAlbum.t),
      orderBy: orderBy?.call(PictureAlbum.t),
      orderByList: orderByList?.call(PictureAlbum.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PictureAlbum] by its [id] or null if no such row exists.
  Future<PictureAlbum?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PictureAlbumInclude? include,
  }) async {
    return session.db.findById<PictureAlbum>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PictureAlbum]s in the list and returns the inserted rows.
  ///
  /// The returned [PictureAlbum]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PictureAlbum>> insert(
    _i1.Session session,
    List<PictureAlbum> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PictureAlbum>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PictureAlbum] and returns the inserted row.
  ///
  /// The returned [PictureAlbum] will have its `id` field set.
  Future<PictureAlbum> insertRow(
    _i1.Session session,
    PictureAlbum row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PictureAlbum>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PictureAlbum]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PictureAlbum>> update(
    _i1.Session session,
    List<PictureAlbum> rows, {
    _i1.ColumnSelections<PictureAlbumTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PictureAlbum>(
      rows,
      columns: columns?.call(PictureAlbum.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PictureAlbum]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PictureAlbum> updateRow(
    _i1.Session session,
    PictureAlbum row, {
    _i1.ColumnSelections<PictureAlbumTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PictureAlbum>(
      row,
      columns: columns?.call(PictureAlbum.t),
      transaction: transaction,
    );
  }

  /// Deletes all [PictureAlbum]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PictureAlbum>> delete(
    _i1.Session session,
    List<PictureAlbum> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PictureAlbum>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PictureAlbum].
  Future<PictureAlbum> deleteRow(
    _i1.Session session,
    PictureAlbum row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PictureAlbum>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PictureAlbum>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PictureAlbumTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PictureAlbum>(
      where: where(PictureAlbum.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PictureAlbumTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PictureAlbum>(
      where: where?.call(PictureAlbum.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PictureAlbumAttachRepository {
  const PictureAlbumAttachRepository._();

  /// Creates a relation between this [PictureAlbum] and the given [Picture]s
  /// by setting each [Picture]'s foreign key `_pictureAlbumPicturesPictureAlbumId` to refer to this [PictureAlbum].
  Future<void> pictures(
    _i1.Session session,
    PictureAlbum pictureAlbum,
    List<_i3.Picture> picture, {
    _i1.Transaction? transaction,
  }) async {
    if (picture.any((e) => e.id == null)) {
      throw ArgumentError.notNull('picture.id');
    }
    if (pictureAlbum.id == null) {
      throw ArgumentError.notNull('pictureAlbum.id');
    }

    var $picture = picture
        .map((e) => _i3.PictureImplicit(
              e,
              $_pictureAlbumPicturesPictureAlbumId: pictureAlbum.id,
            ))
        .toList();
    await session.db.update<_i3.Picture>(
      $picture,
      columns: [_i3.Picture.t.$_pictureAlbumPicturesPictureAlbumId],
      transaction: transaction,
    );
  }
}

class PictureAlbumAttachRowRepository {
  const PictureAlbumAttachRowRepository._();

  /// Creates a relation between the given [PictureAlbum] and [User]
  /// by setting the [PictureAlbum]'s foreign key `createdById` to refer to the [User].
  Future<void> createdBy(
    _i1.Session session,
    PictureAlbum pictureAlbum,
    _i2.User createdBy, {
    _i1.Transaction? transaction,
  }) async {
    if (pictureAlbum.id == null) {
      throw ArgumentError.notNull('pictureAlbum.id');
    }
    if (createdBy.id == null) {
      throw ArgumentError.notNull('createdBy.id');
    }

    var $pictureAlbum = pictureAlbum.copyWith(createdById: createdBy.id);
    await session.db.updateRow<PictureAlbum>(
      $pictureAlbum,
      columns: [PictureAlbum.t.createdById],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PictureAlbum] and the given [Picture]
  /// by setting the [Picture]'s foreign key `_pictureAlbumPicturesPictureAlbumId` to refer to this [PictureAlbum].
  Future<void> pictures(
    _i1.Session session,
    PictureAlbum pictureAlbum,
    _i3.Picture picture, {
    _i1.Transaction? transaction,
  }) async {
    if (picture.id == null) {
      throw ArgumentError.notNull('picture.id');
    }
    if (pictureAlbum.id == null) {
      throw ArgumentError.notNull('pictureAlbum.id');
    }

    var $picture = _i3.PictureImplicit(
      picture,
      $_pictureAlbumPicturesPictureAlbumId: pictureAlbum.id,
    );
    await session.db.updateRow<_i3.Picture>(
      $picture,
      columns: [_i3.Picture.t.$_pictureAlbumPicturesPictureAlbumId],
      transaction: transaction,
    );
  }
}

class PictureAlbumDetachRepository {
  const PictureAlbumDetachRepository._();

  /// Detaches the relation between this [PictureAlbum] and the given [Picture]
  /// by setting the [Picture]'s foreign key `_pictureAlbumPicturesPictureAlbumId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> pictures(
    _i1.Session session,
    List<_i3.Picture> picture, {
    _i1.Transaction? transaction,
  }) async {
    if (picture.any((e) => e.id == null)) {
      throw ArgumentError.notNull('picture.id');
    }

    var $picture = picture
        .map((e) => _i3.PictureImplicit(
              e,
              $_pictureAlbumPicturesPictureAlbumId: null,
            ))
        .toList();
    await session.db.update<_i3.Picture>(
      $picture,
      columns: [_i3.Picture.t.$_pictureAlbumPicturesPictureAlbumId],
      transaction: transaction,
    );
  }
}

class PictureAlbumDetachRowRepository {
  const PictureAlbumDetachRowRepository._();

  /// Detaches the relation between this [PictureAlbum] and the given [Picture]
  /// by setting the [Picture]'s foreign key `_pictureAlbumPicturesPictureAlbumId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> pictures(
    _i1.Session session,
    _i3.Picture picture, {
    _i1.Transaction? transaction,
  }) async {
    if (picture.id == null) {
      throw ArgumentError.notNull('picture.id');
    }

    var $picture = _i3.PictureImplicit(
      picture,
      $_pictureAlbumPicturesPictureAlbumId: null,
    );
    await session.db.updateRow<_i3.Picture>(
      $picture,
      columns: [_i3.Picture.t.$_pictureAlbumPicturesPictureAlbumId],
      transaction: transaction,
    );
  }
}
