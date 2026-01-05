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
import '../../features/user/user.dart' as _i3;
import '../../features/availability/availability.dart' as _i4;
import 'package:octattoo_server/src/generated/protocol.dart' as _i5;

/// Tattoo Artist model representing artists in the application
abstract class TattooArtist extends _i1.BaseClass
    implements _i2.TableRow<_i2.UuidValue?>, _i2.ProtocolSerialization {
  TattooArtist._({
    this.id,
    super.createdAt,
    super.updatedAt,
    required this.userId,
    this.user,
    String? artistName,
    String? bio,
    String? pictureUrl,
    String? bannerUrl,
    this.availabilities,
  }) : artistName = artistName ?? '',
       bio = bio ?? '',
       pictureUrl = pictureUrl ?? '',
       bannerUrl = bannerUrl ?? '';

  factory TattooArtist({
    _i2.UuidValue? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    required _i2.UuidValue userId,
    _i3.User? user,
    String? artistName,
    String? bio,
    String? pictureUrl,
    String? bannerUrl,
    List<_i4.Availability>? availabilities,
  }) = _TattooArtistImpl;

  factory TattooArtist.fromJson(Map<String, dynamic> jsonSerialization) {
    return TattooArtist(
      id: jsonSerialization['id'] == null
          ? null
          : _i2.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      createdAt: _i2.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i2.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      userId: _i2.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.User>(jsonSerialization['user']),
      artistName: jsonSerialization['artistName'] as String,
      bio: jsonSerialization['bio'] as String,
      pictureUrl: jsonSerialization['pictureUrl'] as String,
      bannerUrl: jsonSerialization['bannerUrl'] as String,
      availabilities: jsonSerialization['availabilities'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i4.Availability>>(
              jsonSerialization['availabilities'],
            ),
    );
  }

  static final t = TattooArtistTable();

  static const db = TattooArtistRepository._();

  @override
  _i2.UuidValue? id;

  _i2.UuidValue userId;

  /// Reference to the user who owns the tattoo artist profile
  _i3.User? user;

  /// Name of the tattoo artist that must be unique for generated public profile URL (i.e. /octattoo.app/artist/artistName)
  String artistName;

  /// Tattoo artist's biography
  String bio;

  /// URL to the tattoo artist's profile picture
  String pictureUrl;

  /// URL to the tattoo artist's banner image
  String bannerUrl;

  /// List of availabilities associated with the tattoo artist
  List<_i4.Availability>? availabilities;

  @override
  _i2.Table<_i2.UuidValue?> get table => t;

  /// Returns a shallow copy of this [TattooArtist]
  /// with some or all fields replaced by the given arguments.
  @override
  @_i2.useResult
  TattooArtist copyWith({
    Object? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i2.UuidValue? userId,
    _i3.User? user,
    String? artistName,
    String? bio,
    String? pictureUrl,
    String? bannerUrl,
    List<_i4.Availability>? availabilities,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TattooArtist',
      if (id != null) 'id': id?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'artistName': artistName,
      'bio': bio,
      'pictureUrl': pictureUrl,
      'bannerUrl': bannerUrl,
      if (availabilities != null)
        'availabilities': availabilities?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TattooArtist',
      if (id != null) 'id': id?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'artistName': artistName,
      'bio': bio,
      'pictureUrl': pictureUrl,
      'bannerUrl': bannerUrl,
      if (availabilities != null)
        'availabilities': availabilities?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static TattooArtistInclude include({
    _i3.UserInclude? user,
    _i4.AvailabilityIncludeList? availabilities,
  }) {
    return TattooArtistInclude._(
      user: user,
      availabilities: availabilities,
    );
  }

  static TattooArtistIncludeList includeList({
    _i2.WhereExpressionBuilder<TattooArtistTable>? where,
    int? limit,
    int? offset,
    _i2.OrderByBuilder<TattooArtistTable>? orderBy,
    bool orderDescending = false,
    _i2.OrderByListBuilder<TattooArtistTable>? orderByList,
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
    return _i2.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TattooArtistImpl extends TattooArtist {
  _TattooArtistImpl({
    _i2.UuidValue? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    required _i2.UuidValue userId,
    _i3.User? user,
    String? artistName,
    String? bio,
    String? pictureUrl,
    String? bannerUrl,
    List<_i4.Availability>? availabilities,
  }) : super._(
         id: id,
         createdAt: createdAt,
         updatedAt: updatedAt,
         userId: userId,
         user: user,
         artistName: artistName,
         bio: bio,
         pictureUrl: pictureUrl,
         bannerUrl: bannerUrl,
         availabilities: availabilities,
       );

  /// Returns a shallow copy of this [TattooArtist]
  /// with some or all fields replaced by the given arguments.
  @_i2.useResult
  @override
  TattooArtist copyWith({
    Object? id = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i2.UuidValue? userId,
    Object? user = _Undefined,
    String? artistName,
    String? bio,
    String? pictureUrl,
    String? bannerUrl,
    Object? availabilities = _Undefined,
  }) {
    return TattooArtist(
      id: id is _i2.UuidValue? ? id : this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userId: userId ?? this.userId,
      user: user is _i3.User? ? user : this.user?.copyWith(),
      artistName: artistName ?? this.artistName,
      bio: bio ?? this.bio,
      pictureUrl: pictureUrl ?? this.pictureUrl,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      availabilities: availabilities is List<_i4.Availability>?
          ? availabilities
          : this.availabilities?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class TattooArtistUpdateTable extends _i2.UpdateTable<TattooArtistTable> {
  TattooArtistUpdateTable(super.table);

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

  _i2.ColumnValue<_i2.UuidValue, _i2.UuidValue> userId(_i2.UuidValue value) =>
      _i2.ColumnValue(
        table.userId,
        value,
      );

  _i2.ColumnValue<String, String> artistName(String value) => _i2.ColumnValue(
    table.artistName,
    value,
  );

  _i2.ColumnValue<String, String> bio(String value) => _i2.ColumnValue(
    table.bio,
    value,
  );

  _i2.ColumnValue<String, String> pictureUrl(String value) => _i2.ColumnValue(
    table.pictureUrl,
    value,
  );

  _i2.ColumnValue<String, String> bannerUrl(String value) => _i2.ColumnValue(
    table.bannerUrl,
    value,
  );
}

class TattooArtistTable extends _i2.Table<_i2.UuidValue?> {
  TattooArtistTable({super.tableRelation}) : super(tableName: 'tattoo_artist') {
    updateTable = TattooArtistUpdateTable(this);
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
    userId = _i2.ColumnUuid(
      'userId',
      this,
    );
    artistName = _i2.ColumnString(
      'artistName',
      this,
      hasDefault: true,
    );
    bio = _i2.ColumnString(
      'bio',
      this,
      hasDefault: true,
    );
    pictureUrl = _i2.ColumnString(
      'pictureUrl',
      this,
      hasDefault: true,
    );
    bannerUrl = _i2.ColumnString(
      'bannerUrl',
      this,
      hasDefault: true,
    );
  }

  late final TattooArtistUpdateTable updateTable;

  /// Timestamp of creation
  late final _i2.ColumnDateTime createdAt;

  /// Timestamp of last update
  late final _i2.ColumnDateTime updatedAt;

  late final _i2.ColumnUuid userId;

  /// Reference to the user who owns the tattoo artist profile
  _i3.UserTable? _user;

  /// Name of the tattoo artist that must be unique for generated public profile URL (i.e. /octattoo.app/artist/artistName)
  late final _i2.ColumnString artistName;

  /// Tattoo artist's biography
  late final _i2.ColumnString bio;

  /// URL to the tattoo artist's profile picture
  late final _i2.ColumnString pictureUrl;

  /// URL to the tattoo artist's banner image
  late final _i2.ColumnString bannerUrl;

  /// List of availabilities associated with the tattoo artist
  _i4.AvailabilityTable? ___availabilities;

  /// List of availabilities associated with the tattoo artist
  _i2.ManyRelation<_i4.AvailabilityTable>? _availabilities;

  _i3.UserTable get user {
    if (_user != null) return _user!;
    _user = _i2.createRelationTable(
      relationFieldName: 'user',
      field: TattooArtist.t.userId,
      foreignField: _i3.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  _i4.AvailabilityTable get __availabilities {
    if (___availabilities != null) return ___availabilities!;
    ___availabilities = _i2.createRelationTable(
      relationFieldName: '__availabilities',
      field: TattooArtist.t.id,
      foreignField: _i4.Availability.t.tattooArtistId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.AvailabilityTable(tableRelation: foreignTableRelation),
    );
    return ___availabilities!;
  }

  _i2.ManyRelation<_i4.AvailabilityTable> get availabilities {
    if (_availabilities != null) return _availabilities!;
    var relationTable = _i2.createRelationTable(
      relationFieldName: 'availabilities',
      field: TattooArtist.t.id,
      foreignField: _i4.Availability.t.tattooArtistId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.AvailabilityTable(tableRelation: foreignTableRelation),
    );
    _availabilities = _i2.ManyRelation<_i4.AvailabilityTable>(
      tableWithRelations: relationTable,
      table: _i4.AvailabilityTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _availabilities!;
  }

  @override
  List<_i2.Column> get columns => [
    id,
    createdAt,
    updatedAt,
    userId,
    artistName,
    bio,
    pictureUrl,
    bannerUrl,
  ];

  @override
  _i2.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'availabilities') {
      return __availabilities;
    }
    return null;
  }
}

class TattooArtistInclude extends _i2.IncludeObject {
  TattooArtistInclude._({
    _i3.UserInclude? user,
    _i4.AvailabilityIncludeList? availabilities,
  }) {
    _user = user;
    _availabilities = availabilities;
  }

  _i3.UserInclude? _user;

  _i4.AvailabilityIncludeList? _availabilities;

  @override
  Map<String, _i2.Include?> get includes => {
    'user': _user,
    'availabilities': _availabilities,
  };

  @override
  _i2.Table<_i2.UuidValue?> get table => TattooArtist.t;
}

class TattooArtistIncludeList extends _i2.IncludeList {
  TattooArtistIncludeList._({
    _i2.WhereExpressionBuilder<TattooArtistTable>? where,
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
  Map<String, _i2.Include?> get includes => include?.includes ?? {};

  @override
  _i2.Table<_i2.UuidValue?> get table => TattooArtist.t;
}

class TattooArtistRepository {
  const TattooArtistRepository._();

  final attach = const TattooArtistAttachRepository._();

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
    _i2.Session session, {
    _i2.WhereExpressionBuilder<TattooArtistTable>? where,
    int? limit,
    int? offset,
    _i2.OrderByBuilder<TattooArtistTable>? orderBy,
    bool orderDescending = false,
    _i2.OrderByListBuilder<TattooArtistTable>? orderByList,
    _i2.Transaction? transaction,
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
    _i2.Session session, {
    _i2.WhereExpressionBuilder<TattooArtistTable>? where,
    int? offset,
    _i2.OrderByBuilder<TattooArtistTable>? orderBy,
    bool orderDescending = false,
    _i2.OrderByListBuilder<TattooArtistTable>? orderByList,
    _i2.Transaction? transaction,
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
    _i2.Session session,
    _i2.UuidValue id, {
    _i2.Transaction? transaction,
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
    _i2.Session session,
    List<TattooArtist> rows, {
    _i2.Transaction? transaction,
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
    _i2.Session session,
    TattooArtist row, {
    _i2.Transaction? transaction,
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
    _i2.Session session,
    List<TattooArtist> rows, {
    _i2.ColumnSelections<TattooArtistTable>? columns,
    _i2.Transaction? transaction,
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
    _i2.Session session,
    TattooArtist row, {
    _i2.ColumnSelections<TattooArtistTable>? columns,
    _i2.Transaction? transaction,
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
    _i2.Session session,
    _i2.UuidValue id, {
    required _i2.ColumnValueListBuilder<TattooArtistUpdateTable> columnValues,
    _i2.Transaction? transaction,
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
    _i2.Session session, {
    required _i2.ColumnValueListBuilder<TattooArtistUpdateTable> columnValues,
    required _i2.WhereExpressionBuilder<TattooArtistTable> where,
    int? limit,
    int? offset,
    _i2.OrderByBuilder<TattooArtistTable>? orderBy,
    _i2.OrderByListBuilder<TattooArtistTable>? orderByList,
    bool orderDescending = false,
    _i2.Transaction? transaction,
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
    _i2.Session session,
    List<TattooArtist> rows, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.delete<TattooArtist>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TattooArtist].
  Future<TattooArtist> deleteRow(
    _i2.Session session,
    TattooArtist row, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TattooArtist>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TattooArtist>> deleteWhere(
    _i2.Session session, {
    required _i2.WhereExpressionBuilder<TattooArtistTable> where,
    _i2.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TattooArtist>(
      where: where(TattooArtist.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i2.Session session, {
    _i2.WhereExpressionBuilder<TattooArtistTable>? where,
    int? limit,
    _i2.Transaction? transaction,
  }) async {
    return session.db.count<TattooArtist>(
      where: where?.call(TattooArtist.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class TattooArtistAttachRepository {
  const TattooArtistAttachRepository._();

  /// Creates a relation between this [TattooArtist] and the given [Availability]s
  /// by setting each [Availability]'s foreign key `tattooArtistId` to refer to this [TattooArtist].
  Future<void> availabilities(
    _i2.Session session,
    TattooArtist tattooArtist,
    List<_i4.Availability> availability, {
    _i2.Transaction? transaction,
  }) async {
    if (availability.any((e) => e.id == null)) {
      throw ArgumentError.notNull('availability.id');
    }
    if (tattooArtist.id == null) {
      throw ArgumentError.notNull('tattooArtist.id');
    }

    var $availability = availability
        .map((e) => e.copyWith(tattooArtistId: tattooArtist.id))
        .toList();
    await session.db.update<_i4.Availability>(
      $availability,
      columns: [_i4.Availability.t.tattooArtistId],
      transaction: transaction,
    );
  }
}

class TattooArtistAttachRowRepository {
  const TattooArtistAttachRowRepository._();

  /// Creates a relation between the given [TattooArtist] and [User]
  /// by setting the [TattooArtist]'s foreign key `userId` to refer to the [User].
  Future<void> user(
    _i2.Session session,
    TattooArtist tattooArtist,
    _i3.User user, {
    _i2.Transaction? transaction,
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

  /// Creates a relation between this [TattooArtist] and the given [Availability]
  /// by setting the [Availability]'s foreign key `tattooArtistId` to refer to this [TattooArtist].
  Future<void> availabilities(
    _i2.Session session,
    TattooArtist tattooArtist,
    _i4.Availability availability, {
    _i2.Transaction? transaction,
  }) async {
    if (availability.id == null) {
      throw ArgumentError.notNull('availability.id');
    }
    if (tattooArtist.id == null) {
      throw ArgumentError.notNull('tattooArtist.id');
    }

    var $availability = availability.copyWith(tattooArtistId: tattooArtist.id);
    await session.db.updateRow<_i4.Availability>(
      $availability,
      columns: [_i4.Availability.t.tattooArtistId],
      transaction: transaction,
    );
  }
}
