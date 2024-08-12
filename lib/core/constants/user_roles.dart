/// Enum representing the different user roles.
enum UserRoles {
  admin,
  artist,
  customer,
}

/// An extension on [UserRoles] that provides a string representation of each role.
extension UserRoleExtension on UserRoles {
  /// Returns a string representation of the user role.
  ///
  /// Throws an exception if the role is not handled.
  String get value {
    switch (this) {
      case UserRoles.artist:
        return "artist";
      case UserRoles.customer:
        return "customer";
      case UserRoles.admin:
        return "admin";
      default:
        throw UnimplementedError('Role $this is not handled');
    }
  }
}
