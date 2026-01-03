/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i2;
import 'package:octattoo_server/src/generated/protocol.dart' as _i3;

abstract class TattooArtist
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  TattooArtist._({
    this.id,
    required this.authUserId,
    this.authUser,
    String? artistName,
    String? bio,
    String? pictureUrl,
    String? bannerUrl,
  }) : artistName = artistName ?? '',
       bio = bio ?? '',
       pictureUrl = pictureUrl ?? '',
       bannerUrl = bannerUrl ?? '';

  factory TattooArtist({
    int? id,
    required _i1.UuidValue authUserId,
    _i2.AuthUser? authUser,
    String? artistName,
    String? bio,
    String? pictureUrl,
    String? bannerUrl,
  }) = _TattooArtistImpl;

  factory TattooArtist.fromJson(Map<String, dynamic> jsonSerialization) {
    return TattooArtist(
      id: jsonSerialization['id'] as int?,
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      authUser: jsonSerialization['authUser'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.AuthUser>(
              jsonSerialization['authUser'],
            ),
      artistName: jsonSerialization['artistName'] as String,
      bio: jsonSerialization['bio'] as String,
      pictureUrl: jsonSerialization['pictureUrl'] as String,
      bannerUrl: jsonSerialization['bannerUrl'] as String,
    );
  }

  static final t = TattooArtistTable();

  static const db = TattooArtistRepository._();

  @override
  int? id;

  _i1.UuidValue authUserId;

  _i2.AuthUser? authUser;

  String artistName;

  String bio;

  String pictureUrl;

  String bannerUrl;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [TattooArtist]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TattooArtist copyWith({
    int? id,
    _i1.UuidValue? authUserId,
    _i2.AuthUser? authUser,
    String? artistName,
    String? bio,
    String? pictureUrl,
    String? bannerUrl,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TattooArtist',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      if (authUser != null) 'authUser': authUser?.toJson(),
      'artistName': artistName,
      'bio': bio,
      'pictureUrl': pictureUrl,
      'bannerUrl': bannerUrl,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TattooArtist',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      if (authUser != null) 'authUser': authUser?.toJsonForProtocol(),
      'artistName': artistName,
      'bio': bio,
      'pictureUrl': pictureUrl,
      'bannerUrl': bannerUrl,
    };
  }

  static TattooArtistInclude include({_i2.AuthUserInclude? authUser}) {
    return TattooArtistInclude._(authUser: authUser);
  }

  static TattooArtistIncludeList includeList({
    _i1.WhereExpressionBuilder<TattooArtistTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TattooArtistTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TattooArtistTable>? orderByList,
    TattooArtistInclude? include,
  }) {
    return TattooArtistIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TattooArtist.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TattooArtist.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TattooArtistImpl extends TattooArtist {
  _TattooArtistImpl({
    int? id,
    required _i1.UuidValue authUserId,
    _i2.AuthUser? authUser,
    String? artistName,
    String? bio,
    String? pictureUrl,
    String? bannerUrl,
  }) : super._(
         id: id,
         authUserId: authUserId,
         authUser: authUser,
         artistName: artistName,
         bio: bio,
         pictureUrl: pictureUrl,
         bannerUrl: bannerUrl,
       );

  /// Returns a shallow copy of this [TattooArtist]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TattooArtist copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? authUserId,
    Object? authUser = _Undefined,
    String? artistName,
    String? bio,
    String? pictureUrl,
    String? bannerUrl,
  }) {
    return TattooArtist(
      id: id is int? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      authUser: authUser is _i2.AuthUser?
          ? authUser
          : this.authUser?.copyWith(),
      artistName: artistName ?? this.artistName,
      bio: bio ?? this.bio,
      pictureUrl: pictureUrl ?? this.pictureUrl,
      bannerUrl: bannerUrl ?? this.bannerUrl,
    );
  }
}

class TattooArtistUpdateTable extends _i1.UpdateTable<TattooArtistTable> {
  TattooArtistUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> authUserId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.authUserId,
    value,
  );

  _i1.ColumnValue<String, String> artistName(String value) => _i1.ColumnValue(
    table.artistName,
    value,
  );

  _i1.ColumnValue<String, String> bio(String value) => _i1.ColumnValue(
    table.bio,
    value,
  );

  _i1.ColumnValue<String, String> pictureUrl(String value) => _i1.ColumnValue(
    table.pictureUrl,
    value,
  );

  _i1.ColumnValue<String, String> bannerUrl(String value) => _i1.ColumnValue(
    table.bannerUrl,
    value,
  );
}

class TattooArtistTable extends _i1.Table<int?> {
  TattooArtistTable({super.tableRelation}) : super(tableName: 'tattoo_artist') {
    updateTable = TattooArtistUpdateTable(this);
    authUserId = _i1.ColumnUuid(
      'authUserId',
      this,
    );
    artistName = _i1.ColumnString(
      'artistName',
      this,
      hasDefault: true,
    );
    bio = _i1.ColumnString(
      'bio',
      this,
      hasDefault: true,
    );
    pictureUrl = _i1.ColumnString(
      'pictureUrl',
      this,
      hasDefault: true,
    );
    bannerUrl = _i1.ColumnString(
      'bannerUrl',
      this,
      hasDefault: true,
    );
  }

  late final TattooArtistUpdateTable updateTable;

  late final _i1.ColumnUuid authUserId;

  _i2.AuthUserTable? _authUser;

  late final _i1.ColumnString artistName;

  late final _i1.ColumnString bio;

  late final _i1.ColumnString pictureUrl;

  late final _i1.ColumnString bannerUrl;

  _i2.AuthUserTable get authUser {
    if (_authUser != null) return _authUser!;
    _authUser = _i1.createRelationTable(
      relationFieldName: 'authUser',
      field: TattooArtist.t.authUserId,
      foreignField: _i2.AuthUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AuthUserTable(tableRelation: foreignTableRelation),
    );
    return _authUser!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    authUserId,
    artistName,
    bio,
    pictureUrl,
    bannerUrl,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'authUser') {
      return authUser;
    }
    return null;
  }
}

class TattooArtistInclude extends _i1.IncludeObject {
  TattooArtistInclude._({_i2.AuthUserInclude? authUser}) {
    _authUser = authUser;
  }

  _i2.AuthUserInclude? _authUser;

  @override
  Map<String, _i1.Include?> get includes => {'authUser': _authUser};

  @override
  _i1.Table<int?> get table => TattooArtist.t;
}

class TattooArtistIncludeList extends _i1.IncludeList {
  TattooArtistIncludeList._({
    _i1.WhereExpressionBuilder<TattooArtistTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TattooArtist.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => TattooArtist.t;
}

class TattooArtistRepository {
  const TattooArtistRepository._();

  final attachRow = const TattooArtistAttachRowRepository._();

  /// Returns a list of [TattooArtist]s matching the given query parameters.
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
  Future<List<TattooArtist>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TattooArtistTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TattooArtistTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TattooArtistTable>? orderByList,
    _i1.Transaction? transaction,
    TattooArtistInclude? include,
  }) async {
    return session.db.find<TattooArtist>(
      where: where?.call(TattooArtist.t),
      orderBy: orderBy?.call(TattooArtist.t),
      orderByList: orderByList?.call(TattooArtist.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [TattooArtist] matching the given query parameters.
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
  Future<TattooArtist?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TattooArtistTable>? where,
    int? offset,
    _i1.OrderByBuilder<TattooArtistTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TattooArtistTable>? orderByList,
    _i1.Transaction? transaction,
    TattooArtistInclude? include,
  }) async {
    return session.db.findFirstRow<TattooArtist>(
      where: where?.call(TattooArtist.t),
      orderBy: orderBy?.call(TattooArtist.t),
      orderByList: orderByList?.call(TattooArtist.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [TattooArtist] by its [id] or null if no such row exists.
  Future<TattooArtist?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    TattooArtistInclude? include,
  }) async {
    return session.db.findById<TattooArtist>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [TattooArtist]s in the list and returns the inserted rows.
  ///
  /// The returned [TattooArtist]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<TattooArtist>> insert(
    _i1.Session session,
    List<TattooArtist> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TattooArtist>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [TattooArtist] and returns the inserted row.
  ///
  /// The returned [TattooArtist] will have its `id` field set.
  Future<TattooArtist> insertRow(
    _i1.Session session,
    TattooArtist row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TattooArtist>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TattooArtist]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TattooArtist>> update(
    _i1.Session session,
    List<TattooArtist> rows, {
    _i1.ColumnSelections<TattooArtistTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TattooArtist>(
      rows,
      columns: columns?.call(TattooArtist.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TattooArtist]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TattooArtist> updateRow(
    _i1.Session session,
    TattooArtist row, {
    _i1.ColumnSelections<TattooArtistTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TattooArtist>(
      row,
      columns: columns?.call(TattooArtist.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TattooArtist] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TattooArtist?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<TattooArtistUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<TattooArtist>(
      id,
      columnValues: columnValues(TattooArtist.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TattooArtist]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<TattooArtist>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TattooArtistUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<TattooArtistTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TattooArtistTable>? orderBy,
    _i1.OrderByListBuilder<TattooArtistTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<TattooArtist>(
      columnValues: columnValues(TattooArtist.t.updateTable),
      where: where(TattooArtist.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TattooArtist.t),
      orderByList: orderByList?.call(TattooArtist.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [TattooArtist]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TattooArtist>> delete(
    _i1.Session session,
    List<TattooArtist> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TattooArtist>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TattooArtist].
  Future<TattooArtist> deleteRow(
    _i1.Session session,
    TattooArtist row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TattooArtist>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TattooArtist>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TattooArtistTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TattooArtist>(
      where: where(TattooArtist.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TattooArtistTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TattooArtist>(
      where: where?.call(TattooArtist.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class TattooArtistAttachRowRepository {
  const TattooArtistAttachRowRepository._();

  /// Creates a relation between the given [TattooArtist] and [AuthUser]
  /// by setting the [TattooArtist]'s foreign key `authUserId` to refer to the [AuthUser].
  Future<void> authUser(
    _i1.Session session,
    TattooArtist tattooArtist,
    _i2.AuthUser authUser, {
    _i1.Transaction? transaction,
  }) async {
    if (tattooArtist.id == null) {
      throw ArgumentError.notNull('tattooArtist.id');
    }
    if (authUser.id == null) {
      throw ArgumentError.notNull('authUser.id');
    }

    var $tattooArtist = tattooArtist.copyWith(authUserId: authUser.id);
    await session.db.updateRow<TattooArtist>(
      $tattooArtist,
      columns: [TattooArtist.t.authUserId],
      transaction: transaction,
    );
  }
}
