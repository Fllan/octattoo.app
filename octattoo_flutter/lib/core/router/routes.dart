import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_flutter/src/features/artist_profile/workplace_details_screen.dart';
import 'package:octattoo_flutter/src/features/artist_profile/workplaces_screen.dart';
import 'package:octattoo_flutter/src/features/appointments/appointments_screen.dart';
import 'package:octattoo_flutter/src/features/artist_profile/artist_profile_screen.dart';
import 'package:octattoo_flutter/src/features/appointments/authentication_screen.dart';
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
        TypedGoRoute<CustomersRouteData>(
          path: '/customers',
        ),
      ],
    ),
    TypedStatefulShellBranch<AppointmentsBranchData>(
      routes: [
        TypedGoRoute<AppointmentsRouteData>(
          path: '/appointments',
        ),
      ],
    ),
    TypedStatefulShellBranch<ArtistProfileBranchData>(
      routes: [
        TypedGoRoute<ArtistProfileRouteData>(
          path: '/artist-profile',
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<WorkplacesRouteData>(
              path: 'workplaces',
              routes: <TypedRoute<RouteData>>[
                TypedGoRoute<WorkplaceDetailsRouteData>(path: ':id'),
              ],
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<SettingsBranchData>(
      routes: [
        TypedGoRoute<SettingsRouteData>(
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

class CustomersRouteData extends GoRouteData with $CustomersRouteData {
  const CustomersRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CustomersScreen();
}

class AppointmentsRouteData extends GoRouteData with $AppointmentsRouteData {
  const AppointmentsRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AppointmentsScreen();
}

class ArtistProfileRouteData extends GoRouteData with $ArtistProfileRouteData {
  const ArtistProfileRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ArtistProfileScreen();
}

class WorkplacesRouteData extends GoRouteData with $WorkplacesRouteData {
  const WorkplacesRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WorkplacesScreen();
}

class WorkplaceDetailsRouteData extends GoRouteData
    with $WorkplaceDetailsRouteData {
  WorkplaceDetailsRouteData({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WorkplaceDetailsScreen(id: id);
  }
}

class SettingsRouteData extends GoRouteData with $SettingsRouteData {
  const SettingsRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsScreen();
}
