/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import '../../protocol.dart' as _i1;
import 'package:serverpod_client/serverpod_client.dart' as _i2;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i3;
import '../../features/tattoo_artist/tattoo_artist.dart' as _i4;
import 'package:octattoo_client/src/protocol/protocol.dart' as _i5;

/// User model representing application users
abstract class User extends _i1.BaseClass implements _i2.SerializableModel {
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

  /// Unique identifier
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
