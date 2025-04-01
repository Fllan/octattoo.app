import 'package:fpdart/fpdart.dart';
import 'package:octattoo_client/octattoo_client.dart';

class UserService {
  final Client client;

  const UserService(this.client);

  Future<Either<String, User>> currentUser() async {
    try {
      final user = await client.user.currentUser();
      if (user == null) {
        return left("Not authenticated");
      }
      return right(user);
    } on Exception catch (e, st) {
      print(e);
      print(st);
      return left(e.toString());
    }
  }
}
