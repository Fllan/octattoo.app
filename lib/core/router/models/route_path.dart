/// An enum representing the different routes in the app.
enum RoutePath {
  /// The root route.
  root(path: '/'),

  /// The sign in route.
  signin(path: 'signin'),

  /// The onboarding route.
  onboarding(path: 'onboarding'),

  /// The artist name route.
  artistName(path: 'artistName'),

  /// The workplaces route.
  workplaces(path: 'workplaces'),

  /// The settings route.
  settings(path: 'settings'),

  /// The artist profile route.
  artistProfile(path: 'artistProfile');

  /// Creates a RoutePath.
  ///
  /// The [path] parameter is required and is the string path associated with the route.
  const RoutePath({required this.path});
  final String path;
}