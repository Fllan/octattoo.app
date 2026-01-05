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
import '../../protocol.dart' as _i1;
import 'package:serverpod/serverpod.dart' as _i2;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i3;
import '../../features/tattoo_artist/tattoo_artist.dart' as _i4;
import 'package:octattoo_server/src/generated/protocol.dart' as _i5;

/// User model representing application users
abstract class User extends _i1.BaseClass
    implements _i2.TableRow<_i2.UuidValue?>, _i2.ProtocolSerialization {
  User._({
    this.id,
    super.createdAt,
    super.updatedAt,
    required this.authUserId,
    this.authUser,
    String? firstName,
    String? lastName,
    String? pronoun,
    bool? isOnboarded,
    this.tattooArtists,
  }) : firstName = firstName ?? '',
       lastName = lastName ?? '',
       pronoun = pronoun ?? '',
       isOnboarded = isOnboarded ?? false;

  factory User({
    _i2.UuidValue? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    required _i2.UuidValue authUserId,
    _i3.AuthUser? authUser,
    String? firstName,
    String? lastName,
    String? pronoun,
    bool? isOnboarded,
    List<_i4.TattooArtist>? tattooArtists,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] == null
          ? null
          : _i2.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      createdAt: _i2.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i2.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      authUserId: _i2.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      authUser: jsonSerialization['authUser'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.AuthUser>(
              jsonSerialization['authUser'],
            ),
      firstName: jsonSerialization['firstName'] as String,
      lastName: jsonSerialization['lastName'] as String,
      pronoun: jsonSerialization['pronoun'] as String,
      isOnboarded: jsonSerialization['isOnboarded'] as bool,
      tattooArtists: jsonSerialization['tattooArtists'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i4.TattooArtist>>(
              jsonSerialization['tattooArtists'],
            ),
    );
  }

  static final t = UserTable();

  static const db = UserRepository._();

  @override
  _i2.UuidValue? id;

  _i2.UuidValue authUserId;

  /// Reference to the authentication user
  _i3.AuthUser? authUser;

  /// User's first name
  String firstName;

  /// User's last name
  String lastName;

  /// User's pronoun
  String pronoun;

  /// Indicates if the user has completed onboarding
  bool isOnboarded;

  /// List of tattoo artists associated with the user
  List<_i4.TattooArtist>? tattooArtists;

  @override
  _i2.Table<_i2.UuidValue?> get table => t;

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @override
  @_i2.useResult
  User copyWith({
    Object? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i2.UuidValue? authUserId,
    _i3.AuthUser? authUser,
    String? firstName,
    String? lastName,
    String? pronoun,
    bool? isOnboarded,
    List<_i4.TattooArtist>? tattooArtists,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'User',
      if (id != null) 'id': id?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'authUserId': authUserId.toJson(),
      if (authUser != null) 'authUser': authUser?.toJson(),
      'firstName': firstName,
      'lastName': lastName,
      'pronoun': pronoun,
      'isOnboarded': isOnboarded,
      if (tattooArtists != null)
        'tattooArtists': tattooArtists?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'User',
      if (id != null) 'id': id?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'authUserId': authUserId.toJson(),
      if (authUser != null) 'authUser': authUser?.toJsonForProtocol(),
      'firstName': firstName,
      'lastName': lastName,
      'pronoun': pronoun,
      'isOnboarded': isOnboarded,
      if (tattooArtists != null)
        'tattooArtists': tattooArtists?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static UserInclude include({
    _i3.AuthUserInclude? authUser,
    _i4.TattooArtistIncludeList? tattooArtists,
  }) {
    return UserInclude._(
      authUser: authUser,
      tattooArtists: tattooArtists,
    );
  }

  static UserIncludeList includeList({
    _i2.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i2.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i2.OrderByListBuilder<UserTable>? orderByList,
    UserInclude? include,
  }) {
    return UserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(User.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(User.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i2.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    _i2.UuidValue? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    required _i2.UuidValue authUserId,
    _i3.AuthUser? authUser,
    String? firstName,
    String? lastName,
    String? pronoun,
    bool? isOnboarded,
    List<_i4.TattooArtist>? tattooArtists,
  }) : super._(
         id: id,
         createdAt: createdAt,
         updatedAt: updatedAt,
         authUserId: authUserId,
         authUser: authUser,
         firstName: firstName,
         lastName: lastName,
         pronoun: pronoun,
         isOnboarded: isOnboarded,
         tattooArtists: tattooArtists,
       );

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i2.useResult
  @override
  User copyWith({
    Object? id = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i2.UuidValue? authUserId,
    Object? authUser = _Undefined,
    String? firstName,
    String? lastName,
    String? pronoun,
    bool? isOnboarded,
    Object? tattooArtists = _Undefined,
  }) {
    return User(
      id: id is _i2.UuidValue? ? id : this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      authUserId: authUserId ?? this.authUserId,
      authUser: authUser is _i3.AuthUser?
          ? authUser
          : this.authUser?.copyWith(),
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      pronoun: pronoun ?? this.pronoun,
      isOnboarded: isOnboarded ?? this.isOnboarded,
      tattooArtists: tattooArtists is List<_i4.TattooArtist>?
          ? tattooArtists
          : this.tattooArtists?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class UserUpdateTable extends _i2.UpdateTable<UserTable> {
  UserUpdateTable(super.table);

  _i2.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i2.ColumnValue(
        table.createdAt,
        value,
      );

  _i2.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i2.ColumnValue(
        table.updatedAt,
        value,
      );

  _i2.ColumnValue<_i2.UuidValue, _i2.UuidValue> authUserId(
    _i2.UuidValue value,
  ) => _i2.ColumnValue(
    table.authUserId,
    value,
  );

  _i2.ColumnValue<String, String> firstName(String value) => _i2.ColumnValue(
    table.firstName,
    value,
  );

  _i2.ColumnValue<String, String> lastName(String value) => _i2.ColumnValue(
    table.lastName,
    value,
  );

  _i2.ColumnValue<String, String> pronoun(String value) => _i2.ColumnValue(
    table.pronoun,
    value,
  );

  _i2.ColumnValue<bool, bool> isOnboarded(bool value) => _i2.ColumnValue(
    table.isOnboarded,
    value,
  );
}

class UserTable extends _i2.Table<_i2.UuidValue?> {
  UserTable({super.tableRelation}) : super(tableName: 'user') {
    updateTable = UserUpdateTable(this);
    createdAt = _i2.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    updatedAt = _i2.ColumnDateTime(
      'updatedAt',
      this,
      hasDefault: true,
    );
    authUserId = _i2.ColumnUuid(
      'authUserId',
      this,
    );
    firstName = _i2.ColumnString(
      'firstName',
      this,
      hasDefault: true,
    );
    lastName = _i2.ColumnString(
      'lastName',
      this,
      hasDefault: true,
    );
    pronoun = _i2.ColumnString(
      'pronoun',
      this,
      hasDefault: true,
    );
    isOnboarded = _i2.ColumnBool(
      'isOnboarded',
      this,
      hasDefault: true,
    );
  }

  late final UserUpdateTable updateTable;

  /// Timestamp of creation
  late final _i2.ColumnDateTime createdAt;

  /// Timestamp of last update
  late final _i2.ColumnDateTime updatedAt;

  late final _i2.ColumnUuid authUserId;

  /// Reference to the authentication user
  _i3.AuthUserTable? _authUser;

  /// User's first name
  late final _i2.ColumnString firstName;

  /// User's last name
  late final _i2.ColumnString lastName;

  /// User's pronoun
  late final _i2.ColumnString pronoun;

  /// Indicates if the user has completed onboarding
  late final _i2.ColumnBool isOnboarded;

  /// List of tattoo artists associated with the user
  _i4.TattooArtistTable? ___tattooArtists;

  /// List of tattoo artists associated with the user
  _i2.ManyRelation<_i4.TattooArtistTable>? _tattooArtists;

  _i3.AuthUserTable get authUser {
    if (_authUser != null) return _authUser!;
    _authUser = _i2.createRelationTable(
      relationFieldName: 'authUser',
      field: User.t.authUserId,
      foreignField: _i3.AuthUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.AuthUserTable(tableRelation: foreignTableRelation),
    );
    return _authUser!;
  }

  _i4.TattooArtistTable get __tattooArtists {
    if (___tattooArtists != null) return ___tattooArtists!;
    ___tattooArtists = _i2.createRelationTable(
      relationFieldName: '__tattooArtists',
      field: User.t.id,
      foreignField: _i4.TattooArtist.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.TattooArtistTable(tableRelation: foreignTableRelation),
    );
    return ___tattooArtists!;
  }

  _i2.ManyRelation<_i4.TattooArtistTable> get tattooArtists {
    if (_tattooArtists != null) return _tattooArtists!;
    var relationTable = _i2.createRelationTable(
      relationFieldName: 'tattooArtists',
      field: User.t.id,
      foreignField: _i4.TattooArtist.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.TattooArtistTable(tableRelation: foreignTableRelation),
    );
    _tattooArtists = _i2.ManyRelation<_i4.TattooArtistTable>(
      tableWithRelations: relationTable,
      table: _i4.TattooArtistTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _tattooArtists!;
  }

  @override
  List<_i2.Column> get columns => [
    id,
    createdAt,
    updatedAt,
    authUserId,
    firstName,
    lastName,
    pronoun,
    isOnboarded,
  ];

  @override
  _i2.Table? getRelationTable(String relationField) {
    if (relationField == 'authUser') {
      return authUser;
    }
    if (relationField == 'tattooArtists') {
      return __tattooArtists;
    }
    return null;
  }
}

class UserInclude extends _i2.IncludeObject {
  UserInclude._({
    _i3.AuthUserInclude? authUser,
    _i4.TattooArtistIncludeList? tattooArtists,
  }) {
    _authUser = authUser;
    _tattooArtists = tattooArtists;
  }

  _i3.AuthUserInclude? _authUser;

  _i4.TattooArtistIncludeList? _tattooArtists;

  @override
  Map<String, _i2.Include?> get includes => {
    'authUser': _authUser,
    'tattooArtists': _tattooArtists,
  };

  @override
  _i2.Table<_i2.UuidValue?> get table => User.t;
}

class UserIncludeList extends _i2.IncludeList {
  UserIncludeList._({
    _i2.WhereExpressionBuilder<UserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(User.t);
  }

  @override
  Map<String, _i2.Include?> get includes => include?.includes ?? {};

  @override
  _i2.Table<_i2.UuidValue?> get table => User.t;
}

class UserRepository {
  const UserRepository._();

  final attach = const UserAttachRepository._();

  final attachRow = const UserAttachRowRepository._();

  /// Returns a list of [User]s matching the given query parameters.
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
  Future<List<User>> find(
    _i2.Session session, {
    _i2.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i2.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i2.OrderByListBuilder<UserTable>? orderByList,
    _i2.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.find<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [User] matching the given query parameters.
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
  Future<User?> findFirstRow(
    _i2.Session session, {
    _i2.WhereExpressionBuilder<UserTable>? where,
    int? offset,
    _i2.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i2.OrderByListBuilder<UserTable>? orderByList,
    _i2.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findFirstRow<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [User] by its [id] or null if no such row exists.
  Future<User?> findById(
    _i2.Session session,
    _i2.UuidValue id, {
    _i2.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findById<User>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [User]s in the list and returns the inserted rows.
  ///
  /// The returned [User]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<User>> insert(
    _i2.Session session,
    List<User> rows, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.insert<User>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [User] and returns the inserted row.
  ///
  /// The returned [User] will have its `id` field set.
  Future<User> insertRow(
    _i2.Session session,
    User row, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.insertRow<User>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [User]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<User>> update(
    _i2.Session session,
    List<User> rows, {
    _i2.ColumnSelections<UserTable>? columns,
    _i2.Transaction? transaction,
  }) async {
    return session.db.update<User>(
      rows,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  /// Updates a single [User]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<User> updateRow(
    _i2.Session session,
    User row, {
    _i2.ColumnSelections<UserTable>? columns,
    _i2.Transaction? transaction,
  }) async {
    return session.db.updateRow<User>(
      row,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  /// Updates a single [User] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<User?> updateById(
    _i2.Session session,
    _i2.UuidValue id, {
    required _i2.ColumnValueListBuilder<UserUpdateTable> columnValues,
    _i2.Transaction? transaction,
  }) async {
    return session.db.updateById<User>(
      id,
      columnValues: columnValues(User.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [User]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<User>> updateWhere(
    _i2.Session session, {
    required _i2.ColumnValueListBuilder<UserUpdateTable> columnValues,
    required _i2.WhereExpressionBuilder<UserTable> where,
    int? limit,
    int? offset,
    _i2.OrderByBuilder<UserTable>? orderBy,
    _i2.OrderByListBuilder<UserTable>? orderByList,
    bool orderDescending = false,
    _i2.Transaction? transaction,
  }) async {
    return session.db.updateWhere<User>(
      columnValues: columnValues(User.t.updateTable),
      where: where(User.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [User]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<User>> delete(
    _i2.Session session,
    List<User> rows, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.delete<User>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [User].
  Future<User> deleteRow(
    _i2.Session session,
    User row, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.deleteRow<User>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<User>> deleteWhere(
    _i2.Session session, {
    required _i2.WhereExpressionBuilder<UserTable> where,
    _i2.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<User>(
      where: where(User.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i2.Session session, {
    _i2.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    _i2.Transaction? transaction,
  }) async {
    return session.db.count<User>(
      where: where?.call(User.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UserAttachRepository {
  const UserAttachRepository._();

  /// Creates a relation between this [User] and the given [TattooArtist]s
  /// by setting each [TattooArtist]'s foreign key `userId` to refer to this [User].
  Future<void> tattooArtists(
    _i2.Session session,
    User user,
    List<_i4.TattooArtist> tattooArtist, {
    _i2.Transaction? transaction,
  }) async {
    if (tattooArtist.any((e) => e.id == null)) {
      throw ArgumentError.notNull('tattooArtist.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $tattooArtist = tattooArtist
        .map((e) => e.copyWith(userId: user.id))
        .toList();
    await session.db.update<_i4.TattooArtist>(
      $tattooArtist,
      columns: [_i4.TattooArtist.t.userId],
      transaction: transaction,
    );
  }
}

class UserAttachRowRepository {
  const UserAttachRowRepository._();

  /// Creates a relation between the given [User] and [AuthUser]
  /// by setting the [User]'s foreign key `authUserId` to refer to the [AuthUser].
  Future<void> authUser(
    _i2.Session session,
    User user,
    _i3.AuthUser authUser, {
    _i2.Transaction? transaction,
  }) async {
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }
    if (authUser.id == null) {
      throw ArgumentError.notNull('authUser.id');
    }

    var $user = user.copyWith(authUserId: authUser.id);
    await session.db.updateRow<User>(
      $user,
      columns: [User.t.authUserId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [TattooArtist]
  /// by setting the [TattooArtist]'s foreign key `userId` to refer to this [User].
  Future<void> tattooArtists(
    _i2.Session session,
    User user,
    _i4.TattooArtist tattooArtist, {
    _i2.Transaction? transaction,
  }) async {
    if (tattooArtist.id == null) {
      throw ArgumentError.notNull('tattooArtist.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $tattooArtist = tattooArtist.copyWith(userId: user.id);
    await session.db.updateRow<_i4.TattooArtist>(
      $tattooArtist,
      columns: [_i4.TattooArtist.t.userId],
      transaction: transaction,
    );
  }
}
