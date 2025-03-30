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

/// A Company is owned by a TattooArtist
abstract class Company implements _i1.SerializableModel {
  Company._({
    this.id,
    required this.ownerId,
    this.owner,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    this.vat,
    this.officialId,
  });

  factory Company({
    int? id,
    required int ownerId,
    _i2.TattooArtist? owner,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String name,
    int? vat,
    String? officialId,
  }) = _CompanyImpl;

  factory Company.fromJson(Map<String, dynamic> jsonSerialization) {
    return Company(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.TattooArtist.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      name: jsonSerialization['name'] as String,
      vat: jsonSerialization['vat'] as int?,
      officialId: jsonSerialization['officialId'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int ownerId;

  _i2.TattooArtist? owner;

  DateTime createdAt;

  DateTime updatedAt;

  String name;

  int? vat;

  /// The identifier of the company (SIREN, VAT number, ...)
  String? officialId;

  /// Returns a shallow copy of this [Company]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Company copyWith({
    int? id,
    int? ownerId,
    _i2.TattooArtist? owner,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    int? vat,
    String? officialId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'name': name,
      if (vat != null) 'vat': vat,
      if (officialId != null) 'officialId': officialId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CompanyImpl extends Company {
  _CompanyImpl({
    int? id,
    required int ownerId,
    _i2.TattooArtist? owner,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String name,
    int? vat,
    String? officialId,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          createdAt: createdAt,
          updatedAt: updatedAt,
          name: name,
          vat: vat,
          officialId: officialId,
        );

  /// Returns a shallow copy of this [Company]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Company copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    Object? vat = _Undefined,
    Object? officialId = _Undefined,
  }) {
    return Company(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.TattooArtist? ? owner : this.owner?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      vat: vat is int? ? vat : this.vat,
      officialId: officialId is String? ? officialId : this.officialId,
    );
  }
}
