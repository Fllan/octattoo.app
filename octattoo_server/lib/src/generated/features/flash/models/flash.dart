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
import '../../../features/picture_album/models/picture_album.dart' as _i3;

/// A Flash is a drawing for a tattoo initiated by a TattooArtist
abstract class Flash implements _i1.TableRow, _i1.ProtocolSerialization {
  Flash._({
    this.id,
    required this.createdById,
    this.createdBy,
    required this.name,
    required this.description,
    required this.albumId,
    this.album,
    required this.isAvailable,
    this.suggestedPosition,
    required this.createdAt,
    required this.updatedAt,
    this.estimatedPrice,
  });

  factory Flash({
    int? id,
    required int createdById,
    _i2.TattooArtist? createdBy,
    required String name,
    required String description,
    required int albumId,
    _i3.PictureAlbum? album,
    required bool isAvailable,
    String? suggestedPosition,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? estimatedPrice,
  }) = _FlashImpl;

  factory Flash.fromJson(Map<String, dynamic> jsonSerialization) {
    return Flash(
      id: jsonSerialization['id'] as int?,
      createdById: jsonSerialization['createdById'] as int,
      createdBy: jsonSerialization['createdBy'] == null
          ? null
          : _i2.TattooArtist.fromJson(
              (jsonSerialization['createdBy'] as Map<String, dynamic>)),
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      albumId: jsonSerialization['albumId'] as int,
      album: jsonSerialization['album'] == null
          ? null
          : _i3.PictureAlbum.fromJson(
              (jsonSerialization['album'] as Map<String, dynamic>)),
      isAvailable: jsonSerialization['isAvailable'] as bool,
      suggestedPosition: jsonSerialization['suggestedPosition'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      estimatedPrice: jsonSerialization['estimatedPrice'] as int?,
    );
  }

  static final t = FlashTable();

  static const db = FlashRepository._();

  @override
  int? id;

  int createdById;

  _i2.TattooArtist? createdBy;

  String name;

  String description;

  int albumId;

  _i3.PictureAlbum? album;

  bool isAvailable;

  String? suggestedPosition;

  DateTime createdAt;

  DateTime updatedAt;

  int? estimatedPrice;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [Flash]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Flash copyWith({
    int? id,
    int? createdById,
    _i2.TattooArtist? createdBy,
    String? name,
    String? description,
    int? albumId,
    _i3.PictureAlbum? album,
    bool? isAvailable,
    String? suggestedPosition,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? estimatedPrice,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'createdById': createdById,
      if (createdBy != null) 'createdBy': createdBy?.toJson(),
      'name': name,
      'description': description,
      'albumId': albumId,
      if (album != null) 'album': album?.toJson(),
      'isAvailable': isAvailable,
      if (suggestedPosition != null) 'suggestedPosition': suggestedPosition,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (estimatedPrice != null) 'estimatedPrice': estimatedPrice,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'createdById': createdById,
      if (createdBy != null) 'createdBy': createdBy?.toJsonForProtocol(),
      'name': name,
      'description': description,
      'albumId': albumId,
      if (album != null) 'album': album?.toJsonForProtocol(),
      'isAvailable': isAvailable,
      if (suggestedPosition != null) 'suggestedPosition': suggestedPosition,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (estimatedPrice != null) 'estimatedPrice': estimatedPrice,
    };
  }

  static FlashInclude include({
    _i2.TattooArtistInclude? createdBy,
    _i3.PictureAlbumInclude? album,
  }) {
    return FlashInclude._(
      createdBy: createdBy,
      album: album,
    );
  }

  static FlashIncludeList includeList({
    _i1.WhereExpressionBuilder<FlashTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FlashTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlashTable>? orderByList,
    FlashInclude? include,
  }) {
    return FlashIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Flash.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Flash.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FlashImpl extends Flash {
  _FlashImpl({
    int? id,
    required int createdById,
    _i2.TattooArtist? createdBy,
    required String name,
    required String description,
    required int albumId,
    _i3.PictureAlbum? album,
    required bool isAvailable,
    String? suggestedPosition,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? estimatedPrice,
  }) : super._(
          id: id,
          createdById: createdById,
          createdBy: createdBy,
          name: name,
          description: description,
          albumId: albumId,
          album: album,
          isAvailable: isAvailable,
          suggestedPosition: suggestedPosition,
          createdAt: createdAt,
          updatedAt: updatedAt,
          estimatedPrice: estimatedPrice,
        );

  /// Returns a shallow copy of this [Flash]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Flash copyWith({
    Object? id = _Undefined,
    int? createdById,
    Object? createdBy = _Undefined,
    String? name,
    String? description,
    int? albumId,
    Object? album = _Undefined,
    bool? isAvailable,
    Object? suggestedPosition = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? estimatedPrice = _Undefined,
  }) {
    return Flash(
      id: id is int? ? id : this.id,
      createdById: createdById ?? this.createdById,
      createdBy: createdBy is _i2.TattooArtist?
          ? createdBy
          : this.createdBy?.copyWith(),
      name: name ?? this.name,
      description: description ?? this.description,
      albumId: albumId ?? this.albumId,
      album: album is _i3.PictureAlbum? ? album : this.album?.copyWith(),
      isAvailable: isAvailable ?? this.isAvailable,
      suggestedPosition: suggestedPosition is String?
          ? suggestedPosition
          : this.suggestedPosition,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      estimatedPrice:
          estimatedPrice is int? ? estimatedPrice : this.estimatedPrice,
    );
  }
}

class FlashTable extends _i1.Table {
  FlashTable({super.tableRelation}) : super(tableName: 'flash') {
    createdById = _i1.ColumnInt(
      'createdById',
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
    isAvailable = _i1.ColumnBool(
      'isAvailable',
      this,
    );
    suggestedPosition = _i1.ColumnString(
      'suggestedPosition',
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
    estimatedPrice = _i1.ColumnInt(
      'estimatedPrice',
      this,
    );
  }

  late final _i1.ColumnInt createdById;

  _i2.TattooArtistTable? _createdBy;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt albumId;

  _i3.PictureAlbumTable? _album;

  late final _i1.ColumnBool isAvailable;

  late final _i1.ColumnString suggestedPosition;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnInt estimatedPrice;

  _i2.TattooArtistTable get createdBy {
    if (_createdBy != null) return _createdBy!;
    _createdBy = _i1.createRelationTable(
      relationFieldName: 'createdBy',
      field: Flash.t.createdById,
      foreignField: _i2.TattooArtist.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TattooArtistTable(tableRelation: foreignTableRelation),
    );
    return _createdBy!;
  }

  _i3.PictureAlbumTable get album {
    if (_album != null) return _album!;
    _album = _i1.createRelationTable(
      relationFieldName: 'album',
      field: Flash.t.albumId,
      foreignField: _i3.PictureAlbum.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PictureAlbumTable(tableRelation: foreignTableRelation),
    );
    return _album!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        createdById,
        name,
        description,
        albumId,
        isAvailable,
        suggestedPosition,
        createdAt,
        updatedAt,
        estimatedPrice,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'createdBy') {
      return createdBy;
    }
    if (relationField == 'album') {
      return album;
    }
    return null;
  }
}

class FlashInclude extends _i1.IncludeObject {
  FlashInclude._({
    _i2.TattooArtistInclude? createdBy,
    _i3.PictureAlbumInclude? album,
  }) {
    _createdBy = createdBy;
    _album = album;
  }

  _i2.TattooArtistInclude? _createdBy;

  _i3.PictureAlbumInclude? _album;

  @override
  Map<String, _i1.Include?> get includes => {
        'createdBy': _createdBy,
        'album': _album,
      };

  @override
  _i1.Table get table => Flash.t;
}

class FlashIncludeList extends _i1.IncludeList {
  FlashIncludeList._({
    _i1.WhereExpressionBuilder<FlashTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Flash.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Flash.t;
}

class FlashRepository {
  const FlashRepository._();

  final attachRow = const FlashAttachRowRepository._();

  /// Returns a list of [Flash]s matching the given query parameters.
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
  Future<List<Flash>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FlashTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlashTable>? orderByList,
    _i1.Transaction? transaction,
    FlashInclude? include,
  }) async {
    return session.db.find<Flash>(
      where: where?.call(Flash.t),
      orderBy: orderBy?.call(Flash.t),
      orderByList: orderByList?.call(Flash.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Flash] matching the given query parameters.
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
  Future<Flash?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashTable>? where,
    int? offset,
    _i1.OrderByBuilder<FlashTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlashTable>? orderByList,
    _i1.Transaction? transaction,
    FlashInclude? include,
  }) async {
    return session.db.findFirstRow<Flash>(
      where: where?.call(Flash.t),
      orderBy: orderBy?.call(Flash.t),
      orderByList: orderByList?.call(Flash.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Flash] by its [id] or null if no such row exists.
  Future<Flash?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    FlashInclude? include,
  }) async {
    return session.db.findById<Flash>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Flash]s in the list and returns the inserted rows.
  ///
  /// The returned [Flash]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Flash>> insert(
    _i1.Session session,
    List<Flash> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Flash>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Flash] and returns the inserted row.
  ///
  /// The returned [Flash] will have its `id` field set.
  Future<Flash> insertRow(
    _i1.Session session,
    Flash row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Flash>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Flash]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Flash>> update(
    _i1.Session session,
    List<Flash> rows, {
    _i1.ColumnSelections<FlashTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Flash>(
      rows,
      columns: columns?.call(Flash.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Flash]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Flash> updateRow(
    _i1.Session session,
    Flash row, {
    _i1.ColumnSelections<FlashTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Flash>(
      row,
      columns: columns?.call(Flash.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Flash]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Flash>> delete(
    _i1.Session session,
    List<Flash> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Flash>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Flash].
  Future<Flash> deleteRow(
    _i1.Session session,
    Flash row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Flash>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Flash>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FlashTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Flash>(
      where: where(Flash.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Flash>(
      where: where?.call(Flash.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class FlashAttachRowRepository {
  const FlashAttachRowRepository._();

  /// Creates a relation between the given [Flash] and [TattooArtist]
  /// by setting the [Flash]'s foreign key `createdById` to refer to the [TattooArtist].
  Future<void> createdBy(
    _i1.Session session,
    Flash flash,
    _i2.TattooArtist createdBy, {
    _i1.Transaction? transaction,
  }) async {
    if (flash.id == null) {
      throw ArgumentError.notNull('flash.id');
    }
    if (createdBy.id == null) {
      throw ArgumentError.notNull('createdBy.id');
    }

    var $flash = flash.copyWith(createdById: createdBy.id);
    await session.db.updateRow<Flash>(
      $flash,
      columns: [Flash.t.createdById],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Flash] and [PictureAlbum]
  /// by setting the [Flash]'s foreign key `albumId` to refer to the [PictureAlbum].
  Future<void> album(
    _i1.Session session,
    Flash flash,
    _i3.PictureAlbum album, {
    _i1.Transaction? transaction,
  }) async {
    if (flash.id == null) {
      throw ArgumentError.notNull('flash.id');
    }
    if (album.id == null) {
      throw ArgumentError.notNull('album.id');
    }

    var $flash = flash.copyWith(albumId: album.id);
    await session.db.updateRow<Flash>(
      $flash,
      columns: [Flash.t.albumId],
      transaction: transaction,
    );
  }
}
