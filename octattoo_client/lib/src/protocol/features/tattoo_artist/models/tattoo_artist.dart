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
import '../../../features/tattoo_artist/models/company.dart' as _i3;

/// A TattooArtist is a User with capability to master ink
abstract class TattooArtist implements _i1.SerializableModel {
  TattooArtist._({
    this.id,
    required this.userId,
    this.user,
    this.companyId,
    this.company,
    required this.createdAt,
    required this.updatedAt,
    this.bio,
    required this.artistName,
    required this.showRealNames,
    required this.showPronoun,
  });

  factory TattooArtist({
    int? id,
    required int userId,
    _i2.User? user,
    int? companyId,
    _i3.Company? company,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? bio,
    required String artistName,
    required bool showRealNames,
    required bool showPronoun,
  }) = _TattooArtistImpl;

  factory TattooArtist.fromJson(Map<String, dynamic> jsonSerialization) {
    return TattooArtist(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      companyId: jsonSerialization['companyId'] as int?,
      company: jsonSerialization['company'] == null
          ? null
          : _i3.Company.fromJson(
              (jsonSerialization['company'] as Map<String, dynamic>)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      bio: jsonSerialization['bio'] as String?,
      artistName: jsonSerialization['artistName'] as String,
      showRealNames: jsonSerialization['showRealNames'] as bool,
      showPronoun: jsonSerialization['showPronoun'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  /// A User can have several TattooArtist
  _i2.User? user;

  int? companyId;

  _i3.Company? company;

  DateTime createdAt;

  DateTime updatedAt;

  String? bio;

  String artistName;

  bool showRealNames;

  bool showPronoun;

  /// Returns a shallow copy of this [TattooArtist]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TattooArtist copyWith({
    int? id,
    int? userId,
    _i2.User? user,
    int? companyId,
    _i3.Company? company,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? bio,
    String? artistName,
    bool? showRealNames,
    bool? showPronoun,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      if (companyId != null) 'companyId': companyId,
      if (company != null) 'company': company?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (bio != null) 'bio': bio,
      'artistName': artistName,
      'showRealNames': showRealNames,
      'showPronoun': showPronoun,
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
    required int userId,
    _i2.User? user,
    int? companyId,
    _i3.Company? company,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? bio,
    required String artistName,
    required bool showRealNames,
    required bool showPronoun,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          companyId: companyId,
          company: company,
          createdAt: createdAt,
          updatedAt: updatedAt,
          bio: bio,
          artistName: artistName,
          showRealNames: showRealNames,
          showPronoun: showPronoun,
        );

  /// Returns a shallow copy of this [TattooArtist]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TattooArtist copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    Object? companyId = _Undefined,
    Object? company = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? bio = _Undefined,
    String? artistName,
    bool? showRealNames,
    bool? showPronoun,
  }) {
    return TattooArtist(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      companyId: companyId is int? ? companyId : this.companyId,
      company: company is _i3.Company? ? company : this.company?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      bio: bio is String? ? bio : this.bio,
      artistName: artistName ?? this.artistName,
      showRealNames: showRealNames ?? this.showRealNames,
      showPronoun: showPronoun ?? this.showPronoun,
    );
  }
}
