import 'package:octattoo_client/octattoo_client.dart';

class UserService {
  final Client client;

  const UserService(this.client);

  Future<User?> currentUser() async {
    try {
      final user = await client.user.currentUser();
      if (user == null) {
        return null;
      }
      return user;
    } on Exception catch (e, st) {
      print(e);
      print(st);
      throw Exception(e.toString());
    }
  }
}
