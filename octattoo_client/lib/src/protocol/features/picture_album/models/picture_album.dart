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
import '../../../features/user/models/user.dart' as _i2;
import '../../../features/picture_album/models/picture.dart' as _i3;

/// A PictureAlbum is an album of related pictures
abstract class PictureAlbum implements _i1.SerializableModel {
  PictureAlbum._({
    this.id,
    required this.createdById,
    this.createdBy,
    this.pictures,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PictureAlbum({
    int? id,
    required int createdById,
    _i2.User? createdBy,
    List<_i3.Picture>? pictures,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PictureAlbumImpl;

  factory PictureAlbum.fromJson(Map<String, dynamic> jsonSerialization) {
    return PictureAlbum(
      id: jsonSerialization['id'] as int?,
      createdById: jsonSerialization['createdById'] as int,
      createdBy: jsonSerialization['createdBy'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['createdBy'] as Map<String, dynamic>)),
      pictures: (jsonSerialization['pictures'] as List?)
          ?.map((e) => _i3.Picture.fromJson((e as Map<String, dynamic>)))
          .toList(),
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

  int createdById;

  _i2.User? createdBy;

  List<_i3.Picture>? pictures;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [PictureAlbum]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PictureAlbum copyWith({
    int? id,
    int? createdById,
    _i2.User? createdBy,
    List<_i3.Picture>? pictures,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'createdById': createdById,
      if (createdBy != null) 'createdBy': createdBy?.toJson(),
      if (pictures != null)
        'pictures': pictures?.toJson(valueToJson: (v) => v.toJson()),
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

class _PictureAlbumImpl extends PictureAlbum {
  _PictureAlbumImpl({
    int? id,
    required int createdById,
    _i2.User? createdBy,
    List<_i3.Picture>? pictures,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          createdById: createdById,
          createdBy: createdBy,
          pictures: pictures,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [PictureAlbum]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PictureAlbum copyWith({
    Object? id = _Undefined,
    int? createdById,
    Object? createdBy = _Undefined,
    Object? pictures = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PictureAlbum(
      id: id is int? ? id : this.id,
      createdById: createdById ?? this.createdById,
      createdBy:
          createdBy is _i2.User? ? createdBy : this.createdBy?.copyWith(),
      pictures: pictures is List<_i3.Picture>?
          ? pictures
          : this.pictures?.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
