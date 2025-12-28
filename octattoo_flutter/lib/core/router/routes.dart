import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_flutter/src/screens/appointments_screen.dart';
import 'package:octattoo_flutter/src/artist_profile/artist_profile_screen.dart';
import 'package:octattoo_flutter/src/screens/authentication_screen.dart';
import 'package:octattoo_flutter/src/screens/customers_screen.dart';
import 'package:octattoo_flutter/src/screens/settings_screen.dart';
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
        TypedGoRoute<CustomersRoute>(path: '/customers'),
      ],
    ),
    TypedStatefulShellBranch<AppointmentsBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<AppointmentsRoute>(path: '/appointments'),
      ],
    ),
    TypedStatefulShellBranch<ArtistProfileBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ArtistProfileRoute>(path: '/artist-profile'),
      ],
    ),
    TypedStatefulShellBranch<SettingsBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<SettingsRoute>(path: '/settings'),
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

class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsScreen();
}
