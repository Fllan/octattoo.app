import 'package:octattoo_app/core/models/app_user.dart';

abstract class UserRepository {
  Future<void> addUser(AppUser user);
  Future<void> updateUser(String uid, AppUser user);
  Future<void> deleteUser(String uid);
  Future<AppUser?> getUser(String uid);
}
