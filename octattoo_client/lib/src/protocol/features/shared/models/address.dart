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

abstract class Address implements _i1.SerializableModel {
  Address._({
    this.id,
    required this.street,
    required this.city,
    required this.postalCode,
    required this.country,
    this.note,
  });

  factory Address({
    int? id,
    required String street,
    required String city,
    required String postalCode,
    required String country,
    String? note,
  }) = _AddressImpl;

  factory Address.fromJson(Map<String, dynamic> jsonSerialization) {
    return Address(
      id: jsonSerialization['id'] as int?,
      street: jsonSerialization['street'] as String,
      city: jsonSerialization['city'] as String,
      postalCode: jsonSerialization['postalCode'] as String,
      country: jsonSerialization['country'] as String,
      note: jsonSerialization['note'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String street;

  String city;

  String postalCode;

  String country;

  String? note;

  /// Returns a shallow copy of this [Address]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Address copyWith({
    int? id,
    String? street,
    String? city,
    String? postalCode,
    String? country,
    String? note,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'street': street,
      'city': city,
      'postalCode': postalCode,
      'country': country,
      if (note != null) 'note': note,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AddressImpl extends Address {
  _AddressImpl({
    int? id,
    required String street,
    required String city,
    required String postalCode,
    required String country,
    String? note,
  }) : super._(
          id: id,
          street: street,
          city: city,
          postalCode: postalCode,
          country: country,
          note: note,
        );

  /// Returns a shallow copy of this [Address]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Address copyWith({
    Object? id = _Undefined,
    String? street,
    String? city,
    String? postalCode,
    String? country,
    Object? note = _Undefined,
  }) {
    return Address(
      id: id is int? ? id : this.id,
      street: street ?? this.street,
      city: city ?? this.city,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
      note: note is String? ? note : this.note,
    );
  }
}
