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
import '../../features/user/user.dart' as _i3;
import '../../features/availability/availability.dart' as _i4;
import 'package:octattoo_client/src/protocol/protocol.dart' as _i5;

/// Tattoo Artist model representing artists in the application
abstract class TattooArtist extends _i1.BaseClass
    implements _i2.SerializableModel {
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

  /// Unique identifier
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
