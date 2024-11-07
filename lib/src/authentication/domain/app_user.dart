import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:octattoo_app/core/constants/user_roles.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

/// A class that represents a [AppUser] in the app.
@freezed
class AppUser with _$AppUser {
  const AppUser._();
  factory AppUser({
    required DateTime createdAt,
    required DateTime updatedAt,
    required String uid,
    required UserRoles role,
    @Default(false) bool onboardingCompleted,
    @Default(false) bool emailVerified,
    required bool isAnonymous,
    String? email,
  }) = _AppUser;

  /// Creates a new [AppUser] from a JSON map.
  factory AppUser.fromJson(Map<String, Object?> json) =>
      _$AppUserFromJson(json);

  /// Creates a new [AppUser] from a Firestore document snapshot.
  factory AppUser.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? option) =>
      AppUser.fromJson(snapshot.data() as Map<String, dynamic>);

  /// Converts this [AppUser] to a JSON map.
  Map<String, Object?> toFirestore() => toJson();

  bool isOnboarded() {
    return onboardingCompleted;
  }
}
