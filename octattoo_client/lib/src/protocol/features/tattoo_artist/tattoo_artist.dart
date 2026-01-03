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
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i2;
import 'package:octattoo_client/src/protocol/protocol.dart' as _i3;

abstract class TattooArtist implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i1.UuidValue authUserId;

  _i2.AuthUser? authUser;

  String artistName;

  String bio;

  String pictureUrl;

  String bannerUrl;

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
