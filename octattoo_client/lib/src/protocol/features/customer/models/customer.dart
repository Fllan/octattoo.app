/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../../features/tattoo_artist/models/tattoo_artist.dart' as _i2;
import '../../../features/shared/models/address.dart' as _i3;
import '../../../features/customer/models/customer_tag.dart' as _i4;

/// A Customer represents a human with a business relation with a TattooArtist
abstract class Customer implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
