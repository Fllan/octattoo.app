import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// A custom converter for [DocumentReference].
class DocumentReferenceConverter implements JsonConverter<DocumentReference, Map<String, dynamic>> {
  const DocumentReferenceConverter();

  /// Converts a JSON map to a [DocumentReference].
  ///
  /// Throws a [FormatException] if the JSON does not represent a document reference.
  @override
  DocumentReference fromJson(Map<String, dynamic> json) {
    if (json['path'] is! String) {
      throw const FormatException('Expected a document path');
    }
    return FirebaseFirestore.instance.doc(json['path'] as String);
  }

  /// Converts a [DocumentReference] to a JSON map.
  @override
  Map<String, dynamic> toJson(DocumentReference object) {
    return {'path': object.path};
  }
}