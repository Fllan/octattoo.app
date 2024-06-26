/// Enum for the workplace types
enum WorkplaceTypes {
  guest,
  permanent,
}

/// An extension on [WorkplaceTypes] that provides a string representation of each workplace type.
extension WorplaceTypesExtension on WorkplaceTypes {
  /// Returns a string representation of the workplace type.
  ///
  /// Throws an exception if the role is not handled.
  String get value {
    switch (this) {
      case WorkplaceTypes.guest:
        return "guest";
      case WorkplaceTypes.permanent:
        return "permanent";
      default:
        throw UnimplementedError('Workplace type $this is not handled');
    }
  }
}
