import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:octattoo_app/core/constants/user_roles.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

/// A class that represents a [AppUser] in the app.
@freezed
class AppUser with _$AppUser {
  factory AppUser({
    DateTime? createdAt,
    DateTime? updatedAt,
    required String uid,
    UserRoles? role,
    bool? onboardingCompleted,
    bool? emailVerified,
    bool? isAnonymous,
    String? firstname,
    String? lastname,
    bool? showPronoun,
    String? pronoun,
    String? email,
    String? phoneNumber,
    String? photoURL,
    String? bio,
    String? street,
    String? city,
    String? province,
    String? country,
    String? postalCode,
  }) = _AppUser;

  /// Creates a new [AppUser] from a JSON map.
  factory AppUser.fromJson(Map<String, Object?> json) =>
      _$AppUserFromJson(json);

  /// Creates a new [AppUser] from a Firestore document snapshot.
  factory AppUser.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? option) =>
      AppUser.fromJson(snapshot.data() as Map<String, dynamic>);

  /// Converts this [AppUser] to a JSON map.
  static Map<String, Object?> toFirestore(AppUser user) => user.toJson();
}
