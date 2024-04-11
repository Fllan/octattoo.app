enum RoutePath {
  root(path: '/'),
  signin(path: 'signin'),
  onboarding(path: 'onboarding'),
  artistName(path: 'artistName'),
  workplaces(path: 'workplaces'),
  settings(path: 'settings'),
  artistProfile(path: 'artistProfile');

  const RoutePath({required this.path});
  final String path;
}