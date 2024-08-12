import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:octattoo_app/core/constants/user_roles.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// A class that represents a [User] in the app.
@freezed
class User with _$User {
  factory User({
    required DateTime createdAt,
    required DateTime updatedAt,
    required UserRoles role,
    required bool hasCompletedOnboarding,
    required bool hasAnonymousAccount,
    required String? firstname,
    required String? lastname,
    required bool showPronoun,
    required String? pronoun,
    required String? email,
    required String? phoneNumber,
    required String? photoURL,
    required String? bio,
    required String? street,
    required String? city,
    required String? province,
    required String? country,
    required String? postalCode,
  }) = _User;

  /// Creates a new [User] from a JSON map.
  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  /// Creates a new [User] from a Firestore document snapshot.
  factory User.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? option) =>
      User.fromJson(snapshot.data() as Map<String, dynamic>);

  /// Converts this [User] to a JSON map.
  static Map<String, Object?> toFirestore(User user) => user.toJson();
}
