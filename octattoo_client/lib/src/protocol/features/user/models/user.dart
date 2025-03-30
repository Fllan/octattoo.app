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
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
import '../../../features/shared/models/address.dart' as _i3;

/// A User is the human using the app
abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.createdAt,
    required this.updatedAt,
    this.firstName,
    this.lastName,
    this.pronoun,
    required this.userInfoId,
    this.userInfo,
    this.addressId,
    this.address,
  });

  factory User({
    int? id,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? firstName,
    String? lastName,
    String? pronoun,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    int? addressId,
    _i3.Address? address,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      firstName: jsonSerialization['firstName'] as String?,
      lastName: jsonSerialization['lastName'] as String?,
      pronoun: jsonSerialization['pronoun'] as String?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      addressId: jsonSerialization['addressId'] as int?,
      address: jsonSerialization['address'] == null
          ? null
          : _i3.Address.fromJson(
              (jsonSerialization['address'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime createdAt;

  DateTime updatedAt;

  String? firstName;

  String? lastName;

  String? pronoun;

  int userInfoId;

  _i2.UserInfo? userInfo;

  int? addressId;

  _i3.Address? address;

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  User copyWith({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? firstName,
    String? lastName,
    String? pronoun,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    int? addressId,
    _i3.Address? address,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (pronoun != null) 'pronoun': pronoun,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      if (addressId != null) 'addressId': addressId,
      if (address != null) 'address': address?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? firstName,
    String? lastName,
    String? pronoun,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    int? addressId,
    _i3.Address? address,
  }) : super._(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
          firstName: firstName,
          lastName: lastName,
          pronoun: pronoun,
          userInfoId: userInfoId,
          userInfo: userInfo,
          addressId: addressId,
          address: address,
        );

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  User copyWith({
    Object? id = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? firstName = _Undefined,
    Object? lastName = _Undefined,
    Object? pronoun = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    Object? addressId = _Undefined,
    Object? address = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      firstName: firstName is String? ? firstName : this.firstName,
      lastName: lastName is String? ? lastName : this.lastName,
      pronoun: pronoun is String? ? pronoun : this.pronoun,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      addressId: addressId is int? ? addressId : this.addressId,
      address: address is _i3.Address? ? address : this.address?.copyWith(),
    );
  }
}
