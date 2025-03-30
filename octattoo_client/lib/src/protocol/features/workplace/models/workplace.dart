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
import '../../../features/shared/models/address.dart' as _i2;
import '../../../features/tattoo_artist/models/tattoo_artist.dart' as _i3;

/// A Workplace is a place where TattooArtists work (i.e. Tattoo Shop)
abstract class Workplace implements _i1.SerializableModel {
  Workplace._({
    this.id,
    required this.name,
    required this.addressId,
    this.address,
    required this.isPublic,
    required this.createdAt,
    required this.updatedAt,
    this.managedBy,
  });

  factory Workplace({
    int? id,
    required String name,
    required int addressId,
    _i2.Address? address,
    required bool isPublic,
    required DateTime createdAt,
    required DateTime updatedAt,
    List<_i3.TattooArtist>? managedBy,
  }) = _WorkplaceImpl;

  factory Workplace.fromJson(Map<String, dynamic> jsonSerialization) {
    return Workplace(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      addressId: jsonSerialization['addressId'] as int,
      address: jsonSerialization['address'] == null
          ? null
          : _i2.Address.fromJson(
              (jsonSerialization['address'] as Map<String, dynamic>)),
      isPublic: jsonSerialization['isPublic'] as bool,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      managedBy: (jsonSerialization['managedBy'] as List?)
          ?.map((e) => _i3.TattooArtist.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  int addressId;

  _i2.Address? address;

  bool isPublic;

  DateTime createdAt;

  DateTime updatedAt;

  List<_i3.TattooArtist>? managedBy;

  /// Returns a shallow copy of this [Workplace]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Workplace copyWith({
    int? id,
    String? name,
    int? addressId,
    _i2.Address? address,
    bool? isPublic,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i3.TattooArtist>? managedBy,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'addressId': addressId,
      if (address != null) 'address': address?.toJson(),
      'isPublic': isPublic,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (managedBy != null)
        'managedBy': managedBy?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WorkplaceImpl extends Workplace {
  _WorkplaceImpl({
    int? id,
    required String name,
    required int addressId,
    _i2.Address? address,
    required bool isPublic,
    required DateTime createdAt,
    required DateTime updatedAt,
    List<_i3.TattooArtist>? managedBy,
  }) : super._(
          id: id,
          name: name,
          addressId: addressId,
          address: address,
          isPublic: isPublic,
          createdAt: createdAt,
          updatedAt: updatedAt,
          managedBy: managedBy,
        );

  /// Returns a shallow copy of this [Workplace]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Workplace copyWith({
    Object? id = _Undefined,
    String? name,
    int? addressId,
    Object? address = _Undefined,
    bool? isPublic,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? managedBy = _Undefined,
  }) {
    return Workplace(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      addressId: addressId ?? this.addressId,
      address: address is _i2.Address? ? address : this.address?.copyWith(),
      isPublic: isPublic ?? this.isPublic,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      managedBy: managedBy is List<_i3.TattooArtist>?
          ? managedBy
          : this.managedBy?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
