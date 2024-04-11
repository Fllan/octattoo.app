import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:octattoo_app/core/constants/user_roles.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser  {
  factory AppUser({
    required String uid,
    required DateTime createdAt,
    required DateTime updatedAt,
    required UserRoles role,
    required bool hasCompletedOnboarding,
    required bool hasAnonymousAccount,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
    _$AppUserFromJson(json);
}