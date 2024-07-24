import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:octattoo_app_mvp/core/models/document_reference_converter.dart';

part 'public_profile.freezed.dart';
part 'public_profile.g.dart';

/// A class that represents a public profile.
@freezed
class PublicProfile with _$PublicProfile {
  /// Creates a new [PublicProfile].
  @DocumentReferenceConverter()
  factory PublicProfile({
    required DocumentReference tattooArtistRef,
    required String artistName,
    required String firstname,
    required String lastname,
    required String pronoun,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PublicProfile;

  /// Creates a new [PublicProfile] from a JSON map.
  factory PublicProfile.fromJson(Map<String, dynamic> json) =>
      _$PublicProfileFromJson(json);

  /// Creates a new [PublicProfile] from a Firestore document snapshot.
  factory PublicProfile.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? option) =>
      PublicProfile.fromJson(snapshot.data() as Map<String, dynamic>);

  /// Converts this [PublicProfile] to a JSON map.
  static Map<String, Object?> toFirestore(PublicProfile publicProfile) =>
      publicProfile.toJson();
}
