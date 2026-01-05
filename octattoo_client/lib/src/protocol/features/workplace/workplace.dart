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
import '../../features/availability/availability.dart' as _i3;
import 'package:octattoo_client/src/protocol/protocol.dart' as _i4;

abstract class Workplace extends _i1.BaseClass
    implements _i2.SerializableModel {
  Workplace._({
    this.id,
    super.createdAt,
    super.updatedAt,
    required this.name,
    required this.address,
    this.availabilities,
  });

  factory Workplace({
    _i2.UuidValue? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    required String name,
    required String address,
    List<_i3.Availability>? availabilities,
  }) = _WorkplaceImpl;

  factory Workplace.fromJson(Map<String, dynamic> jsonSerialization) {
    return Workplace(
      id: jsonSerialization['id'] == null
          ? null
          : _i2.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      createdAt: _i2.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i2.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      name: jsonSerialization['name'] as String,
      address: jsonSerialization['address'] as String,
      availabilities: jsonSerialization['availabilities'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.Availability>>(
              jsonSerialization['availabilities'],
            ),
    );
  }

  /// Unique identifier
  _i2.UuidValue? id;

  String name;

  String address;

  List<_i3.Availability>? availabilities;

  /// Returns a shallow copy of this [Workplace]
  /// with some or all fields replaced by the given arguments.
  @override
  @_i2.useResult
  Workplace copyWith({
    Object? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? address,
    List<_i3.Availability>? availabilities,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Workplace',
      if (id != null) 'id': id?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'name': name,
      'address': address,
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

class _WorkplaceImpl extends Workplace {
  _WorkplaceImpl({
    _i2.UuidValue? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    required String name,
    required String address,
    List<_i3.Availability>? availabilities,
  }) : super._(
         id: id,
         createdAt: createdAt,
         updatedAt: updatedAt,
         name: name,
         address: address,
         availabilities: availabilities,
       );

  /// Returns a shallow copy of this [Workplace]
  /// with some or all fields replaced by the given arguments.
  @_i2.useResult
  @override
  Workplace copyWith({
    Object? id = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? address,
    Object? availabilities = _Undefined,
  }) {
    return Workplace(
      id: id is _i2.UuidValue? ? id : this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      address: address ?? this.address,
      availabilities: availabilities is List<_i3.Availability>?
          ? availabilities
          : this.availabilities?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
