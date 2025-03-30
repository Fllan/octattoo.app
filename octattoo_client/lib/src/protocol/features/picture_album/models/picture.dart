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

/// A picture is a file image uploaded by a User
abstract class Picture implements _i1.SerializableModel {
  Picture._({
    this.id,
    required this.ownerId,
    this.owner,
    required this.path,
  });

  factory Picture({
    int? id,
    required int ownerId,
    _i2.User? owner,
    required String path,
  }) = _PictureImpl;

  factory Picture.fromJson(Map<String, dynamic> jsonSerialization) {
    return Picture(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      path: jsonSerialization['path'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int ownerId;

  _i2.User? owner;

  String path;

  /// Returns a shallow copy of this [Picture]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Picture copyWith({
    int? id,
    int? ownerId,
    _i2.User? owner,
    String? path,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'path': path,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PictureImpl extends Picture {
  _PictureImpl({
    int? id,
    required int ownerId,
    _i2.User? owner,
    required String path,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          path: path,
        );

  /// Returns a shallow copy of this [Picture]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Picture copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    String? path,
  }) {
    return Picture(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.User? ? owner : this.owner?.copyWith(),
      path: path ?? this.path,
    );
  }
}
