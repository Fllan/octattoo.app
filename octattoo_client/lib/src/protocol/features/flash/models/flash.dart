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
import '../../../features/picture_album/models/picture_album.dart' as _i3;

/// A Flash is a drawing for a tattoo initiated by a TattooArtist
abstract class Flash implements _i1.SerializableModel {
  Flash._({
    this.id,
    required this.createdById,
    this.createdBy,
    required this.name,
    required this.description,
    required this.albumId,
    this.album,
    required this.isAvailable,
    this.suggestedPosition,
    required this.createdAt,
    required this.updatedAt,
    this.estimatedPrice,
  });

  factory Flash({
    int? id,
    required int createdById,
    _i2.TattooArtist? createdBy,
    required String name,
    required String description,
    required int albumId,
    _i3.PictureAlbum? album,
    required bool isAvailable,
    String? suggestedPosition,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? estimatedPrice,
  }) = _FlashImpl;

  factory Flash.fromJson(Map<String, dynamic> jsonSerialization) {
    return Flash(
      id: jsonSerialization['id'] as int?,
      createdById: jsonSerialization['createdById'] as int,
      createdBy: jsonSerialization['createdBy'] == null
          ? null
          : _i2.TattooArtist.fromJson(
              (jsonSerialization['createdBy'] as Map<String, dynamic>)),
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      albumId: jsonSerialization['albumId'] as int,
      album: jsonSerialization['album'] == null
          ? null
          : _i3.PictureAlbum.fromJson(
              (jsonSerialization['album'] as Map<String, dynamic>)),
      isAvailable: jsonSerialization['isAvailable'] as bool,
      suggestedPosition: jsonSerialization['suggestedPosition'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      estimatedPrice: jsonSerialization['estimatedPrice'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int createdById;

  _i2.TattooArtist? createdBy;

  String name;

  String description;

  int albumId;

  _i3.PictureAlbum? album;

  bool isAvailable;

  String? suggestedPosition;

  DateTime createdAt;

  DateTime updatedAt;

  int? estimatedPrice;

  /// Returns a shallow copy of this [Flash]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Flash copyWith({
    int? id,
    int? createdById,
    _i2.TattooArtist? createdBy,
    String? name,
    String? description,
    int? albumId,
    _i3.PictureAlbum? album,
    bool? isAvailable,
    String? suggestedPosition,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? estimatedPrice,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'createdById': createdById,
      if (createdBy != null) 'createdBy': createdBy?.toJson(),
      'name': name,
      'description': description,
      'albumId': albumId,
      if (album != null) 'album': album?.toJson(),
      'isAvailable': isAvailable,
      if (suggestedPosition != null) 'suggestedPosition': suggestedPosition,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (estimatedPrice != null) 'estimatedPrice': estimatedPrice,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FlashImpl extends Flash {
  _FlashImpl({
    int? id,
    required int createdById,
    _i2.TattooArtist? createdBy,
    required String name,
    required String description,
    required int albumId,
    _i3.PictureAlbum? album,
    required bool isAvailable,
    String? suggestedPosition,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? estimatedPrice,
  }) : super._(
          id: id,
          createdById: createdById,
          createdBy: createdBy,
          name: name,
          description: description,
          albumId: albumId,
          album: album,
          isAvailable: isAvailable,
          suggestedPosition: suggestedPosition,
          createdAt: createdAt,
          updatedAt: updatedAt,
          estimatedPrice: estimatedPrice,
        );

  /// Returns a shallow copy of this [Flash]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Flash copyWith({
    Object? id = _Undefined,
    int? createdById,
    Object? createdBy = _Undefined,
    String? name,
    String? description,
    int? albumId,
    Object? album = _Undefined,
    bool? isAvailable,
    Object? suggestedPosition = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? estimatedPrice = _Undefined,
  }) {
    return Flash(
      id: id is int? ? id : this.id,
      createdById: createdById ?? this.createdById,
      createdBy: createdBy is _i2.TattooArtist?
          ? createdBy
          : this.createdBy?.copyWith(),
      name: name ?? this.name,
      description: description ?? this.description,
      albumId: albumId ?? this.albumId,
      album: album is _i3.PictureAlbum? ? album : this.album?.copyWith(),
      isAvailable: isAvailable ?? this.isAvailable,
      suggestedPosition: suggestedPosition is String?
          ? suggestedPosition
          : this.suggestedPosition,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      estimatedPrice:
          estimatedPrice is int? ? estimatedPrice : this.estimatedPrice,
    );
  }
}
