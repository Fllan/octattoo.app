part of '../routes.dart';

@TypedGoRoute<AuthenticationRoute>(path: '/authentication')
class AuthenticationRoute extends GoRouteData with $AuthenticationRoute {
  const AuthenticationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AuthenticationScreen();
}
