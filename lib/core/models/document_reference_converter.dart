
// Custom converter for DocumentReference
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DocumentReferenceConverter implements JsonConverter<DocumentReference, Map<String, dynamic>> {
  const DocumentReferenceConverter();

  @override
  DocumentReference fromJson(Map<String, dynamic> json) {
    return FirebaseFirestore.instance.doc(json['path'] as String);
  }

  @override
  Map<String, dynamic> toJson(DocumentReference object) {
    return {"path": object.path};
  }
}