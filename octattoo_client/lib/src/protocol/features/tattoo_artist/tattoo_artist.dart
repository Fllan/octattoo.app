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
import 'package:octattoo_client/src/protocol/protocol.dart' as _i4;

abstract class TattooArtist extends _i1.OctattooBaseClass
    implements _i2.SerializableModel {
  TattooArtist._({
    this.id,
    super.createdAt,
    super.updatedAt,
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
    _i2.UuidValue? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    required _i2.UuidValue authUserId,
    _i3.AuthUser? authUser,
    String? artistName,
    String? bio,
    String? pictureUrl,
    String? bannerUrl,
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
      authUserId: _i2.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      authUser: jsonSerialization['authUser'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.AuthUser>(
              jsonSerialization['authUser'],
            ),
      artistName: jsonSerialization['artistName'] as String,
      bio: jsonSerialization['bio'] as String,
      pictureUrl: jsonSerialization['pictureUrl'] as String,
      bannerUrl: jsonSerialization['bannerUrl'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i2.UuidValue? id;

  _i2.UuidValue authUserId;

  _i3.AuthUser? authUser;

  String artistName;

  String bio;

  String pictureUrl;

  String bannerUrl;

  /// Returns a shallow copy of this [TattooArtist]
  /// with some or all fields replaced by the given arguments.
  @override
  @_i2.useResult
  TattooArtist copyWith({
    Object? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i2.UuidValue? authUserId,
    _i3.AuthUser? authUser,
    String? artistName,
    String? bio,
    String? pictureUrl,
    String? bannerUrl,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TattooArtist',
      if (id != null) 'id': id?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'authUserId': authUserId.toJson(),
      if (authUser != null) 'authUser': authUser?.toJson(),
      'artistName': artistName,
      'bio': bio,
      'pictureUrl': pictureUrl,
      'bannerUrl': bannerUrl,
    };
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
    required _i2.UuidValue authUserId,
    _i3.AuthUser? authUser,
    String? artistName,
    String? bio,
    String? pictureUrl,
    String? bannerUrl,
  }) : super._(
         id: id,
         createdAt: createdAt,
         updatedAt: updatedAt,
         authUserId: authUserId,
         authUser: authUser,
         artistName: artistName,
         bio: bio,
         pictureUrl: pictureUrl,
         bannerUrl: bannerUrl,
       );

  /// Returns a shallow copy of this [TattooArtist]
  /// with some or all fields replaced by the given arguments.
  @_i2.useResult
  @override
  TattooArtist copyWith({
    Object? id = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i2.UuidValue? authUserId,
    Object? authUser = _Undefined,
    String? artistName,
    String? bio,
    String? pictureUrl,
    String? bannerUrl,
  }) {
    return TattooArtist(
      id: id is _i2.UuidValue? ? id : this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      authUserId: authUserId ?? this.authUserId,
      authUser: authUser is _i3.AuthUser?
          ? authUser
          : this.authUser?.copyWith(),
      artistName: artistName ?? this.artistName,
      bio: bio ?? this.bio,
      pictureUrl: pictureUrl ?? this.pictureUrl,
      bannerUrl: bannerUrl ?? this.bannerUrl,
    );
  }
}
