import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_flutter/src/features/artist_profile/public_profile_screen.dart';
import 'package:octattoo_flutter/src/features/artist_profile/workplace_details_screen.dart';
import 'package:octattoo_flutter/src/features/artist_profile/workplaces_screen.dart';
import 'package:octattoo_flutter/src/features/appointments/appointments_screen.dart';
import 'package:octattoo_flutter/src/features/artist_profile/artist_profile_screen.dart';
import 'package:octattoo_flutter/src/features/authentication/authentication_screen.dart';
import 'package:octattoo_flutter/src/features/customers/customers_screen.dart';
import 'package:octattoo_flutter/src/features/settings/settings_screen.dart';
import 'package:octattoo_flutter/src/navigation/scaffold_with_nav_bar.dart';

part 'routes.g.dart';

@TypedGoRoute<AuthenticationRoute>(path: '/authentication')
class AuthenticationRoute extends GoRouteData with $AuthenticationRoute {
  const AuthenticationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AuthenticationScreen();
}

@TypedStatefulShellRoute<AppShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<CustomersBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<CustomersRoute>(
          path: '/customers',
        ),
      ],
    ),
    TypedStatefulShellBranch<AppointmentsBranchData>(
      routes: [
        TypedGoRoute<AppointmentsRoute>(
          path: '/appointments',
        ),
      ],
    ),
    TypedStatefulShellBranch<ArtistProfileBranchData>(
      routes: [
        TypedGoRoute<ArtistProfileRoute>(
          path: '/artist-profile',
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<WorkplacesRoute>(
              path: 'workplaces',
              routes: <TypedRoute<RouteData>>[
                TypedGoRoute<WorkplaceDetailsRoute>(path: ':id'),
              ],
            ),
            TypedGoRoute<PublicProfileRoute>(path: 'public-profile'),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<SettingsBranchData>(
      routes: [
        TypedGoRoute<SettingsRoute>(
          path: '/settings',
        ),
      ],
    ),
  ],
)
class AppShellRouteData extends StatefulShellRouteData {
  const AppShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return navigationShell;
  }

  static const String $restorationScopeId = 'restorationScopeId';

  static Widget $navigatorContainerBuilder(
    BuildContext context,
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  ) {
    return ScaffoldWithNavBar(
      navigationShell: navigationShell,
      children: children,
    );
  }
}

// ============================================================================
// BRANCH DATA (One for each tab)
// ============================================================================

class CustomersBranchData extends StatefulShellBranchData {
  const CustomersBranchData();
}

class AppointmentsBranchData extends StatefulShellBranchData {
  const AppointmentsBranchData();
}

class ArtistProfileBranchData extends StatefulShellBranchData {
  const ArtistProfileBranchData();
}

class SettingsBranchData extends StatefulShellBranchData {
  const SettingsBranchData();
}

// ============================================================================
// ROUTE DATA (The actual routes)
// ============================================================================

class CustomersRoute extends GoRouteData with $CustomersRoute {
  const CustomersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CustomersScreen();
}

class AppointmentsRoute extends GoRouteData with $AppointmentsRoute {
  const AppointmentsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AppointmentsScreen();
}

class ArtistProfileRoute extends GoRouteData with $ArtistProfileRoute {
  const ArtistProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ArtistProfileScreen();
}

class WorkplacesRoute extends GoRouteData with $WorkplacesRoute {
  const WorkplacesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WorkplacesScreen();
}

class WorkplaceDetailsRoute extends GoRouteData with $WorkplaceDetailsRoute {
  WorkplaceDetailsRoute({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WorkplaceDetailsScreen(id: id);
  }
}

class PublicProfileRoute extends GoRouteData with $PublicProfileRoute {
  const PublicProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PublicProfileScreen();
}

class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsScreen();
}
