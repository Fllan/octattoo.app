import 'package:octattoo_app/core/models/user.dart';

abstract class UserRepository {
  Future<void> addUser(User user);
  Future<void> updateUser(String uid, User user);
  Future<void> deleteUser(String uid);
  Future<User?> getUser(String uid);
}
