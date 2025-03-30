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
import '../../../features/customer/models/customer.dart' as _i3;
import '../../../features/picture_album/models/picture_album.dart' as _i4;

/// A TattooProject is a tattoo project between a Customer and a TattooArtist
abstract class TattooProject implements _i1.SerializableModel {
  TattooProject._({
    this.id,
    required this.tattooArtistId,
    this.tattooArtist,
    required this.customerId,
    this.customer,
    required this.name,
    required this.description,
    required this.albumId,
    this.album,
    this.position,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TattooProject({
    int? id,
    required int tattooArtistId,
    _i2.TattooArtist? tattooArtist,
    required int customerId,
    _i3.Customer? customer,
    required String name,
    required String description,
    required int albumId,
    _i4.PictureAlbum? album,
    String? position,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TattooProjectImpl;

  factory TattooProject.fromJson(Map<String, dynamic> jsonSerialization) {
    return TattooProject(
      id: jsonSerialization['id'] as int?,
      tattooArtistId: jsonSerialization['tattooArtistId'] as int,
      tattooArtist: jsonSerialization['tattooArtist'] == null
          ? null
          : _i2.TattooArtist.fromJson(
              (jsonSerialization['tattooArtist'] as Map<String, dynamic>)),
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i3.Customer.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      albumId: jsonSerialization['albumId'] as int,
      album: jsonSerialization['album'] == null
          ? null
          : _i4.PictureAlbum.fromJson(
              (jsonSerialization['album'] as Map<String, dynamic>)),
      position: jsonSerialization['position'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int tattooArtistId;

  _i2.TattooArtist? tattooArtist;

  int customerId;

  _i3.Customer? customer;

  String name;

  String description;

  int albumId;

  _i4.PictureAlbum? album;

  String? position;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [TattooProject]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TattooProject copyWith({
    int? id,
    int? tattooArtistId,
    _i2.TattooArtist? tattooArtist,
    int? customerId,
    _i3.Customer? customer,
    String? name,
    String? description,
    int? albumId,
    _i4.PictureAlbum? album,
    String? position,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tattooArtistId': tattooArtistId,
      if (tattooArtist != null) 'tattooArtist': tattooArtist?.toJson(),
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      'name': name,
      'description': description,
      'albumId': albumId,
      if (album != null) 'album': album?.toJson(),
      if (position != null) 'position': position,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TattooProjectImpl extends TattooProject {
  _TattooProjectImpl({
    int? id,
    required int tattooArtistId,
    _i2.TattooArtist? tattooArtist,
    required int customerId,
    _i3.Customer? customer,
    required String name,
    required String description,
    required int albumId,
    _i4.PictureAlbum? album,
    String? position,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          tattooArtistId: tattooArtistId,
          tattooArtist: tattooArtist,
          customerId: customerId,
          customer: customer,
          name: name,
          description: description,
          albumId: albumId,
          album: album,
          position: position,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [TattooProject]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TattooProject copyWith({
    Object? id = _Undefined,
    int? tattooArtistId,
    Object? tattooArtist = _Undefined,
    int? customerId,
    Object? customer = _Undefined,
    String? name,
    String? description,
    int? albumId,
    Object? album = _Undefined,
    Object? position = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TattooProject(
      id: id is int? ? id : this.id,
      tattooArtistId: tattooArtistId ?? this.tattooArtistId,
      tattooArtist: tattooArtist is _i2.TattooArtist?
          ? tattooArtist
          : this.tattooArtist?.copyWith(),
      customerId: customerId ?? this.customerId,
      customer:
          customer is _i3.Customer? ? customer : this.customer?.copyWith(),
      name: name ?? this.name,
      description: description ?? this.description,
      albumId: albumId ?? this.albumId,
      album: album is _i4.PictureAlbum? ? album : this.album?.copyWith(),
      position: position is String? ? position : this.position,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
