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
import '../../../features/tattoo_artist/models/company.dart' as _i3;

/// A TattooArtist is a User with capability to master ink
abstract class TattooArtist implements _i1.TableRow, _i1.ProtocolSerialization {
  TattooArtist._({
    this.id,
    required this.userId,
    this.user,
    this.companyId,
    this.company,
    required this.createdAt,
    required this.updatedAt,
    this.bio,
    required this.artistName,
    required this.showRealNames,
    required this.showPronoun,
  });

  factory TattooArtist({
    int? id,
    required int userId,
    _i2.User? user,
    int? companyId,
    _i3.Company? company,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? bio,
    required String artistName,
    required bool showRealNames,
    required bool showPronoun,
  }) = _TattooArtistImpl;

  factory TattooArtist.fromJson(Map<String, dynamic> jsonSerialization) {
    return TattooArtist(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      companyId: jsonSerialization['companyId'] as int?,
      company: jsonSerialization['company'] == null
          ? null
          : _i3.Company.fromJson(
              (jsonSerialization['company'] as Map<String, dynamic>)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      bio: jsonSerialization['bio'] as String?,
      artistName: jsonSerialization['artistName'] as String,
      showRealNames: jsonSerialization['showRealNames'] as bool,
      showPronoun: jsonSerialization['showPronoun'] as bool,
    );
  }

  static final t = TattooArtistTable();

  static const db = TattooArtistRepository._();

  @override
  int? id;

  int userId;

  /// A User can have several TattooArtist
  _i2.User? user;

  int? companyId;

  _i3.Company? company;

  DateTime createdAt;

  DateTime updatedAt;

  String? bio;

  String artistName;

  bool showRealNames;

  bool showPronoun;

  int? _workplaceManagedbyWorkplaceId;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [TattooArtist]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TattooArtist copyWith({
    int? id,
    int? userId,
    _i2.User? user,
    int? companyId,
    _i3.Company? company,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? bio,
    String? artistName,
    bool? showRealNames,
    bool? showPronoun,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      if (companyId != null) 'companyId': companyId,
      if (company != null) 'company': company?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (bio != null) 'bio': bio,
      'artistName': artistName,
      'showRealNames': showRealNames,
      'showPronoun': showPronoun,
      if (_workplaceManagedbyWorkplaceId != null)
        '_workplaceManagedbyWorkplaceId': _workplaceManagedbyWorkplaceId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      if (companyId != null) 'companyId': companyId,
      if (company != null) 'company': company?.toJsonForProtocol(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (bio != null) 'bio': bio,
      'artistName': artistName,
      'showRealNames': showRealNames,
      'showPronoun': showPronoun,
    };
  }

  static TattooArtistInclude include({
    _i2.UserInclude? user,
    _i3.CompanyInclude? company,
  }) {
    return TattooArtistInclude._(
      user: user,
      company: company,
    );
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
    required int userId,
    _i2.User? user,
    int? companyId,
    _i3.Company? company,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? bio,
    required String artistName,
    required bool showRealNames,
    required bool showPronoun,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          companyId: companyId,
          company: company,
          createdAt: createdAt,
          updatedAt: updatedAt,
          bio: bio,
          artistName: artistName,
          showRealNames: showRealNames,
          showPronoun: showPronoun,
        );

  /// Returns a shallow copy of this [TattooArtist]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TattooArtist copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    Object? companyId = _Undefined,
    Object? company = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? bio = _Undefined,
    String? artistName,
    bool? showRealNames,
    bool? showPronoun,
  }) {
    return TattooArtist(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      companyId: companyId is int? ? companyId : this.companyId,
      company: company is _i3.Company? ? company : this.company?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      bio: bio is String? ? bio : this.bio,
      artistName: artistName ?? this.artistName,
      showRealNames: showRealNames ?? this.showRealNames,
      showPronoun: showPronoun ?? this.showPronoun,
    );
  }
}

class TattooArtistImplicit extends _TattooArtistImpl {
  TattooArtistImplicit._({
    int? id,
    required int userId,
    _i2.User? user,
    int? companyId,
    _i3.Company? company,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? bio,
    required String artistName,
    required bool showRealNames,
    required bool showPronoun,
    this.$_workplaceManagedbyWorkplaceId,
  }) : super(
          id: id,
          userId: userId,
          user: user,
          companyId: companyId,
          company: company,
          createdAt: createdAt,
          updatedAt: updatedAt,
          bio: bio,
          artistName: artistName,
          showRealNames: showRealNames,
          showPronoun: showPronoun,
        );

  factory TattooArtistImplicit(
    TattooArtist tattooArtist, {
    int? $_workplaceManagedbyWorkplaceId,
  }) {
    return TattooArtistImplicit._(
      id: tattooArtist.id,
      userId: tattooArtist.userId,
      user: tattooArtist.user,
      companyId: tattooArtist.companyId,
      company: tattooArtist.company,
      createdAt: tattooArtist.createdAt,
      updatedAt: tattooArtist.updatedAt,
      bio: tattooArtist.bio,
      artistName: tattooArtist.artistName,
      showRealNames: tattooArtist.showRealNames,
      showPronoun: tattooArtist.showPronoun,
      $_workplaceManagedbyWorkplaceId: $_workplaceManagedbyWorkplaceId,
    );
  }

  int? $_workplaceManagedbyWorkplaceId;

  @override
  Map<String, dynamic> toJson() {
    var jsonMap = super.toJson();
    jsonMap.addAll(
        {'_workplaceManagedbyWorkplaceId': $_workplaceManagedbyWorkplaceId});
    return jsonMap;
  }
}

class TattooArtistTable extends _i1.Table {
  TattooArtistTable({super.tableRelation}) : super(tableName: 'tattoo_artist') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    companyId = _i1.ColumnInt(
      'companyId',
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
    bio = _i1.ColumnString(
      'bio',
      this,
    );
    artistName = _i1.ColumnString(
      'artistName',
      this,
    );
    showRealNames = _i1.ColumnBool(
      'showRealNames',
      this,
    );
    showPronoun = _i1.ColumnBool(
      'showPronoun',
      this,
    );
    $_workplaceManagedbyWorkplaceId = _i1.ColumnInt(
      '_workplaceManagedbyWorkplaceId',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  /// A User can have several TattooArtist
  _i2.UserTable? _user;

  late final _i1.ColumnInt companyId;

  _i3.CompanyTable? _company;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnString bio;

  late final _i1.ColumnString artistName;

  late final _i1.ColumnBool showRealNames;

  late final _i1.ColumnBool showPronoun;

  late final _i1.ColumnInt $_workplaceManagedbyWorkplaceId;

  _i2.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: TattooArtist.t.userId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  _i3.CompanyTable get company {
    if (_company != null) return _company!;
    _company = _i1.createRelationTable(
      relationFieldName: 'company',
      field: TattooArtist.t.companyId,
      foreignField: _i3.Company.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.CompanyTable(tableRelation: foreignTableRelation),
    );
    return _company!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        companyId,
        createdAt,
        updatedAt,
        bio,
        artistName,
        showRealNames,
        showPronoun,
        $_workplaceManagedbyWorkplaceId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'company') {
      return company;
    }
    return null;
  }
}

class TattooArtistInclude extends _i1.IncludeObject {
  TattooArtistInclude._({
    _i2.UserInclude? user,
    _i3.CompanyInclude? company,
  }) {
    _user = user;
    _company = company;
  }

  _i2.UserInclude? _user;

  _i3.CompanyInclude? _company;

  @override
  Map<String, _i1.Include?> get includes => {
        'user': _user,
        'company': _company,
      };

  @override
  _i1.Table get table => TattooArtist.t;
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
  _i1.Table get table => TattooArtist.t;
}

class TattooArtistRepository {
  const TattooArtistRepository._();

  final attachRow = const TattooArtistAttachRowRepository._();

  final detachRow = const TattooArtistDetachRowRepository._();

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

  /// Creates a relation between the given [TattooArtist] and [User]
  /// by setting the [TattooArtist]'s foreign key `userId` to refer to the [User].
  Future<void> user(
    _i1.Session session,
    TattooArtist tattooArtist,
    _i2.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (tattooArtist.id == null) {
      throw ArgumentError.notNull('tattooArtist.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $tattooArtist = tattooArtist.copyWith(userId: user.id);
    await session.db.updateRow<TattooArtist>(
      $tattooArtist,
      columns: [TattooArtist.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [TattooArtist] and [Company]
  /// by setting the [TattooArtist]'s foreign key `companyId` to refer to the [Company].
  Future<void> company(
    _i1.Session session,
    TattooArtist tattooArtist,
    _i3.Company company, {
    _i1.Transaction? transaction,
  }) async {
    if (tattooArtist.id == null) {
      throw ArgumentError.notNull('tattooArtist.id');
    }
    if (company.id == null) {
      throw ArgumentError.notNull('company.id');
    }

    var $tattooArtist = tattooArtist.copyWith(companyId: company.id);
    await session.db.updateRow<TattooArtist>(
      $tattooArtist,
      columns: [TattooArtist.t.companyId],
      transaction: transaction,
    );
  }
}

class TattooArtistDetachRowRepository {
  const TattooArtistDetachRowRepository._();

  /// Detaches the relation between this [TattooArtist] and the [Company] set in `company`
  /// by setting the [TattooArtist]'s foreign key `companyId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> company(
    _i1.Session session,
    TattooArtist tattooartist, {
    _i1.Transaction? transaction,
  }) async {
    if (tattooartist.id == null) {
      throw ArgumentError.notNull('tattooartist.id');
    }

    var $tattooartist = tattooartist.copyWith(companyId: null);
    await session.db.updateRow<TattooArtist>(
      $tattooartist,
      columns: [TattooArtist.t.companyId],
      transaction: transaction,
    );
  }
}
