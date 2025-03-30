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
import '../../../features/shared/models/address.dart' as _i3;
import '../../../features/customer/models/customer_tag.dart' as _i4;

/// A Customer represents a human with a business relation with a TattooArtist
abstract class Customer implements _i1.TableRow, _i1.ProtocolSerialization {
  Customer._({
    this.id,
    required this.tattooArtistId,
    this.tattooArtist,
    this.email,
    this.phone,
    this.addressId,
    this.address,
    required this.createdAt,
    required this.updatedAt,
    required this.firstName,
    this.lastName,
    this.tags,
  });

  factory Customer({
    int? id,
    required int tattooArtistId,
    _i2.TattooArtist? tattooArtist,
    String? email,
    String? phone,
    int? addressId,
    _i3.Address? address,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String firstName,
    String? lastName,
    List<_i4.CustomerTag>? tags,
  }) = _CustomerImpl;

  factory Customer.fromJson(Map<String, dynamic> jsonSerialization) {
    return Customer(
      id: jsonSerialization['id'] as int?,
      tattooArtistId: jsonSerialization['tattooArtistId'] as int,
      tattooArtist: jsonSerialization['tattooArtist'] == null
          ? null
          : _i2.TattooArtist.fromJson(
              (jsonSerialization['tattooArtist'] as Map<String, dynamic>)),
      email: jsonSerialization['email'] as String?,
      phone: jsonSerialization['phone'] as String?,
      addressId: jsonSerialization['addressId'] as int?,
      address: jsonSerialization['address'] == null
          ? null
          : _i3.Address.fromJson(
              (jsonSerialization['address'] as Map<String, dynamic>)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      firstName: jsonSerialization['firstName'] as String,
      lastName: jsonSerialization['lastName'] as String?,
      tags: (jsonSerialization['tags'] as List?)
          ?.map((e) => _i4.CustomerTag.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = CustomerTable();

  static const db = CustomerRepository._();

  @override
  int? id;

  int tattooArtistId;

  _i2.TattooArtist? tattooArtist;

  String? email;

  String? phone;

  int? addressId;

  _i3.Address? address;

  DateTime createdAt;

  DateTime updatedAt;

  String firstName;

  String? lastName;

  List<_i4.CustomerTag>? tags;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [Customer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Customer copyWith({
    int? id,
    int? tattooArtistId,
    _i2.TattooArtist? tattooArtist,
    String? email,
    String? phone,
    int? addressId,
    _i3.Address? address,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? firstName,
    String? lastName,
    List<_i4.CustomerTag>? tags,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tattooArtistId': tattooArtistId,
      if (tattooArtist != null) 'tattooArtist': tattooArtist?.toJson(),
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (addressId != null) 'addressId': addressId,
      if (address != null) 'address': address?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (tags != null) 'tags': tags?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'tattooArtistId': tattooArtistId,
      if (tattooArtist != null)
        'tattooArtist': tattooArtist?.toJsonForProtocol(),
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (addressId != null) 'addressId': addressId,
      if (address != null) 'address': address?.toJsonForProtocol(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (tags != null)
        'tags': tags?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static CustomerInclude include({
    _i2.TattooArtistInclude? tattooArtist,
    _i3.AddressInclude? address,
  }) {
    return CustomerInclude._(
      tattooArtist: tattooArtist,
      address: address,
    );
  }

  static CustomerIncludeList includeList({
    _i1.WhereExpressionBuilder<CustomerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerTable>? orderByList,
    CustomerInclude? include,
  }) {
    return CustomerIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Customer.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Customer.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomerImpl extends Customer {
  _CustomerImpl({
    int? id,
    required int tattooArtistId,
    _i2.TattooArtist? tattooArtist,
    String? email,
    String? phone,
    int? addressId,
    _i3.Address? address,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String firstName,
    String? lastName,
    List<_i4.CustomerTag>? tags,
  }) : super._(
          id: id,
          tattooArtistId: tattooArtistId,
          tattooArtist: tattooArtist,
          email: email,
          phone: phone,
          addressId: addressId,
          address: address,
          createdAt: createdAt,
          updatedAt: updatedAt,
          firstName: firstName,
          lastName: lastName,
          tags: tags,
        );

  /// Returns a shallow copy of this [Customer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Customer copyWith({
    Object? id = _Undefined,
    int? tattooArtistId,
    Object? tattooArtist = _Undefined,
    Object? email = _Undefined,
    Object? phone = _Undefined,
    Object? addressId = _Undefined,
    Object? address = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? firstName,
    Object? lastName = _Undefined,
    Object? tags = _Undefined,
  }) {
    return Customer(
      id: id is int? ? id : this.id,
      tattooArtistId: tattooArtistId ?? this.tattooArtistId,
      tattooArtist: tattooArtist is _i2.TattooArtist?
          ? tattooArtist
          : this.tattooArtist?.copyWith(),
      email: email is String? ? email : this.email,
      phone: phone is String? ? phone : this.phone,
      addressId: addressId is int? ? addressId : this.addressId,
      address: address is _i3.Address? ? address : this.address?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      firstName: firstName ?? this.firstName,
      lastName: lastName is String? ? lastName : this.lastName,
      tags: tags is List<_i4.CustomerTag>?
          ? tags
          : this.tags?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class CustomerTable extends _i1.Table {
  CustomerTable({super.tableRelation}) : super(tableName: 'customer') {
    tattooArtistId = _i1.ColumnInt(
      'tattooArtistId',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    phone = _i1.ColumnString(
      'phone',
      this,
    );
    addressId = _i1.ColumnInt(
      'addressId',
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
    firstName = _i1.ColumnString(
      'firstName',
      this,
    );
    lastName = _i1.ColumnString(
      'lastName',
      this,
    );
    tags = _i1.ColumnSerializable(
      'tags',
      this,
    );
  }

  late final _i1.ColumnInt tattooArtistId;

  _i2.TattooArtistTable? _tattooArtist;

  late final _i1.ColumnString email;

  late final _i1.ColumnString phone;

  late final _i1.ColumnInt addressId;

  _i3.AddressTable? _address;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnString firstName;

  late final _i1.ColumnString lastName;

  late final _i1.ColumnSerializable tags;

  _i2.TattooArtistTable get tattooArtist {
    if (_tattooArtist != null) return _tattooArtist!;
    _tattooArtist = _i1.createRelationTable(
      relationFieldName: 'tattooArtist',
      field: Customer.t.tattooArtistId,
      foreignField: _i2.TattooArtist.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TattooArtistTable(tableRelation: foreignTableRelation),
    );
    return _tattooArtist!;
  }

  _i3.AddressTable get address {
    if (_address != null) return _address!;
    _address = _i1.createRelationTable(
      relationFieldName: 'address',
      field: Customer.t.addressId,
      foreignField: _i3.Address.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.AddressTable(tableRelation: foreignTableRelation),
    );
    return _address!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        tattooArtistId,
        email,
        phone,
        addressId,
        createdAt,
        updatedAt,
        firstName,
        lastName,
        tags,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'tattooArtist') {
      return tattooArtist;
    }
    if (relationField == 'address') {
      return address;
    }
    return null;
  }
}

class CustomerInclude extends _i1.IncludeObject {
  CustomerInclude._({
    _i2.TattooArtistInclude? tattooArtist,
    _i3.AddressInclude? address,
  }) {
    _tattooArtist = tattooArtist;
    _address = address;
  }

  _i2.TattooArtistInclude? _tattooArtist;

  _i3.AddressInclude? _address;

  @override
  Map<String, _i1.Include?> get includes => {
        'tattooArtist': _tattooArtist,
        'address': _address,
      };

  @override
  _i1.Table get table => Customer.t;
}

class CustomerIncludeList extends _i1.IncludeList {
  CustomerIncludeList._({
    _i1.WhereExpressionBuilder<CustomerTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Customer.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Customer.t;
}

class CustomerRepository {
  const CustomerRepository._();

  final attachRow = const CustomerAttachRowRepository._();

  final detachRow = const CustomerDetachRowRepository._();

  /// Returns a list of [Customer]s matching the given query parameters.
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
  Future<List<Customer>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerTable>? orderByList,
    _i1.Transaction? transaction,
    CustomerInclude? include,
  }) async {
    return session.db.find<Customer>(
      where: where?.call(Customer.t),
      orderBy: orderBy?.call(Customer.t),
      orderByList: orderByList?.call(Customer.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Customer] matching the given query parameters.
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
  Future<Customer?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerTable>? where,
    int? offset,
    _i1.OrderByBuilder<CustomerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerTable>? orderByList,
    _i1.Transaction? transaction,
    CustomerInclude? include,
  }) async {
    return session.db.findFirstRow<Customer>(
      where: where?.call(Customer.t),
      orderBy: orderBy?.call(Customer.t),
      orderByList: orderByList?.call(Customer.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Customer] by its [id] or null if no such row exists.
  Future<Customer?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CustomerInclude? include,
  }) async {
    return session.db.findById<Customer>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Customer]s in the list and returns the inserted rows.
  ///
  /// The returned [Customer]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Customer>> insert(
    _i1.Session session,
    List<Customer> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Customer>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Customer] and returns the inserted row.
  ///
  /// The returned [Customer] will have its `id` field set.
  Future<Customer> insertRow(
    _i1.Session session,
    Customer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Customer>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Customer]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Customer>> update(
    _i1.Session session,
    List<Customer> rows, {
    _i1.ColumnSelections<CustomerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Customer>(
      rows,
      columns: columns?.call(Customer.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Customer]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Customer> updateRow(
    _i1.Session session,
    Customer row, {
    _i1.ColumnSelections<CustomerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Customer>(
      row,
      columns: columns?.call(Customer.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Customer]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Customer>> delete(
    _i1.Session session,
    List<Customer> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Customer>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Customer].
  Future<Customer> deleteRow(
    _i1.Session session,
    Customer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Customer>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Customer>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CustomerTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Customer>(
      where: where(Customer.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Customer>(
      where: where?.call(Customer.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CustomerAttachRowRepository {
  const CustomerAttachRowRepository._();

  /// Creates a relation between the given [Customer] and [TattooArtist]
  /// by setting the [Customer]'s foreign key `tattooArtistId` to refer to the [TattooArtist].
  Future<void> tattooArtist(
    _i1.Session session,
    Customer customer,
    _i2.TattooArtist tattooArtist, {
    _i1.Transaction? transaction,
  }) async {
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }
    if (tattooArtist.id == null) {
      throw ArgumentError.notNull('tattooArtist.id');
    }

    var $customer = customer.copyWith(tattooArtistId: tattooArtist.id);
    await session.db.updateRow<Customer>(
      $customer,
      columns: [Customer.t.tattooArtistId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Customer] and [Address]
  /// by setting the [Customer]'s foreign key `addressId` to refer to the [Address].
  Future<void> address(
    _i1.Session session,
    Customer customer,
    _i3.Address address, {
    _i1.Transaction? transaction,
  }) async {
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }
    if (address.id == null) {
      throw ArgumentError.notNull('address.id');
    }

    var $customer = customer.copyWith(addressId: address.id);
    await session.db.updateRow<Customer>(
      $customer,
      columns: [Customer.t.addressId],
      transaction: transaction,
    );
  }
}

class CustomerDetachRowRepository {
  const CustomerDetachRowRepository._();

  /// Detaches the relation between this [Customer] and the [Address] set in `address`
  /// by setting the [Customer]'s foreign key `addressId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> address(
    _i1.Session session,
    Customer customer, {
    _i1.Transaction? transaction,
  }) async {
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $customer = customer.copyWith(addressId: null);
    await session.db.updateRow<Customer>(
      $customer,
      columns: [Customer.t.addressId],
      transaction: transaction,
    );
  }
}
