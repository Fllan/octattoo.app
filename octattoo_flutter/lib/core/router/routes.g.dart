// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$authenticationRoute, $appShellRouteData];

RouteBase get $authenticationRoute => GoRouteData.$route(
  path: '/authentication',
  factory: $AuthenticationRoute._fromState,
);

mixin $AuthenticationRoute on GoRouteData {
  static AuthenticationRoute _fromState(GoRouterState state) =>
      const AuthenticationRoute();

  @override
  String get location => GoRouteData.$location('/authentication');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $appShellRouteData => StatefulShellRouteData.$route(
  restorationScopeId: AppShellRouteData.$restorationScopeId,
  navigatorContainerBuilder: AppShellRouteData.$navigatorContainerBuilder,
  factory: $AppShellRouteDataExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/customers',
          factory: $CustomersRouteData._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/appointments',
          factory: $AppointmentsRouteData._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/artist-profile',
          factory: $ArtistProfileRouteData._fromState,
          routes: [
            GoRouteData.$route(
              path: 'workplaces',
              factory: $WorkplacesRouteData._fromState,
              routes: [
                GoRouteData.$route(
                  path: ':id',
                  factory: $WorkplaceDetailsRouteData._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/settings',
          factory: $SettingsRouteData._fromState,
        ),
      ],
    ),
  ],
);

extension $AppShellRouteDataExtension on AppShellRouteData {
  static AppShellRouteData _fromState(GoRouterState state) =>
      const AppShellRouteData();
}

mixin $CustomersRouteData on GoRouteData {
  static CustomersRouteData _fromState(GoRouterState state) =>
      const CustomersRouteData();

  @override
  String get location => GoRouteData.$location('/customers');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AppointmentsRouteData on GoRouteData {
  static AppointmentsRouteData _fromState(GoRouterState state) =>
      const AppointmentsRouteData();

  @override
  String get location => GoRouteData.$location('/appointments');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ArtistProfileRouteData on GoRouteData {
  static ArtistProfileRouteData _fromState(GoRouterState state) =>
      const ArtistProfileRouteData();

  @override
  String get location => GoRouteData.$location('/artist-profile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $WorkplacesRouteData on GoRouteData {
  static WorkplacesRouteData _fromState(GoRouterState state) =>
      const WorkplacesRouteData();

  @override
  String get location => GoRouteData.$location('/artist-profile/workplaces');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $WorkplaceDetailsRouteData on GoRouteData {
  static WorkplaceDetailsRouteData _fromState(GoRouterState state) =>
      WorkplaceDetailsRouteData(id: state.pathParameters['id']!);

  WorkplaceDetailsRouteData get _self => this as WorkplaceDetailsRouteData;

  @override
  String get location => GoRouteData.$location(
    '/artist-profile/workplaces/${Uri.encodeComponent(_self.id)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SettingsRouteData on GoRouteData {
  static SettingsRouteData _fromState(GoRouterState state) =>
      const SettingsRouteData();

  @override
  String get location => GoRouteData.$location('/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
