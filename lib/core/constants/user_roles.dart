enum UserRoles { artist, customer }

extension UserRoleExtension on UserRoles {
  String get value {
    switch (this) {
      case UserRoles.artist:
        return "artist";
      case UserRoles.customer:
        return "customer";
    }
  }
}
