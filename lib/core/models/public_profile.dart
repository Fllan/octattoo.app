import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:octattoo_app/core/models/document_reference_converter.dart';

part 'public_profile.freezed.dart';
part 'public_profile.g.dart';

@freezed
class PublicProfile with _$PublicProfile {
  @DocumentReferenceConverter()
  factory PublicProfile({
    required String id,
    required DocumentReference tattooArtistRef,
    required String artistName,
    required String firstname,
    required String lastname,
    required String pronoun,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PublicProfile;

  factory PublicProfile.fromJson(Map<String, dynamic> json) =>
      _$PublicProfileFromJson(json);
}