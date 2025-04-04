import 'package:octattoo_server/src/generated/features/user/models/user.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class UserEndpoint extends Endpoint {
  Future<User?> currentUser(Session session) async {
    final authenticationInfo = await session.authenticated;
    if (authenticationInfo == null) {
      return null;
    }

    final user = await User.db.findFirstRow(
      session,
      where: (row) => row.userInfoId.equals(authenticationInfo.userId),
      include: User.include(
        userInfo: UserInfo.include(),
      ),
    );

    return user;
  }
}
