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

/// A CustomerTag is a tag created by a TattooArtist to manage customers
abstract class CustomerTag implements _i1.SerializableModel {
  CustomerTag._({
    this.id,
    required this.name,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.ownerId,
    this.owner,
  });

  factory CustomerTag({
    int? id,
    required String name,
    String? description,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int ownerId,
    _i2.TattooArtist? owner,
  }) = _CustomerTagImpl;

  factory CustomerTag.fromJson(Map<String, dynamic> jsonSerialization) {
    return CustomerTag(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.TattooArtist.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String? description;

  DateTime createdAt;

  DateTime updatedAt;

  int ownerId;

  _i2.TattooArtist? owner;

  /// Returns a shallow copy of this [CustomerTag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CustomerTag copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? ownerId,
    _i2.TattooArtist? owner,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomerTagImpl extends CustomerTag {
  _CustomerTagImpl({
    int? id,
    required String name,
    String? description,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int ownerId,
    _i2.TattooArtist? owner,
  }) : super._(
          id: id,
          name: name,
          description: description,
          createdAt: createdAt,
          updatedAt: updatedAt,
          ownerId: ownerId,
          owner: owner,
        );

  /// Returns a shallow copy of this [CustomerTag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CustomerTag copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? ownerId,
    Object? owner = _Undefined,
  }) {
    return CustomerTag(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.TattooArtist? ? owner : this.owner?.copyWith(),
    );
  }
}
