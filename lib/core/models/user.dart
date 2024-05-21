import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:octattoo_app/core/constants/user_roles.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// A class that represents a user.
@freezed
class User with _$User  {
  /// Creates a new [User].
  ///
  /// All parameters are required.
  factory User({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required UserRoles role,
    required bool hasCompletedOnboarding,
    required bool hasAnonymousAccount,
  }) = _User;

  /// Creates a new [User] from a JSON map.
  factory User.fromJson(Map<String, dynamic> json) =>
    _$UserFromJson(json);
}