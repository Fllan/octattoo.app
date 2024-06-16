/// Enum for the workplace types
enum WorplaceTypes {
  guest,
  permanent,
}

/// An extension on [WorplaceTypes] that provides a string representation of each workplace type.
extension WorplaceTypesExtension on WorplaceTypes {
  /// Returns a string representation of the workplace type.
  ///
  /// Throws an exception if the role is not handled.
  String get value {
    switch (this) {
      case WorplaceTypes.guest:
        return "guest";
      case WorplaceTypes.permanent:
        return "permanent";
      default:
        throw UnimplementedError('Workplace type $this is not handled');
    }
  }
}