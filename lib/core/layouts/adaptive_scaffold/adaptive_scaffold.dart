import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/breakpoints.dart';
import 'package:octattoo_app/core/layouts/adaptive_scaffold/scaffolds/scaffold_with_app_bar.dart';
import 'package:octattoo_app/core/layouts/adaptive_scaffold/scaffolds/scaffold_with_compact_app_bar.dart';
import 'package:octattoo_app/core/constants/primary_destinations.dart';
import 'package:octattoo_app/core/layouts/adaptive_scaffold/scaffolds/scaffold_with_navigation_drawer.dart';
import 'package:octattoo_app/core/layouts/adaptive_scaffold/scaffolds/scaffold_with_navigation_rail.dart';

class AdaptiveScaffold extends StatelessWidget {
  const AdaptiveScaffold({
    super.key,
    required this.navigationShell,
    required this.destinations,
  });
  final StatefulNavigationShell navigationShell;
  final List<PrimaryDestination> destinations;

  @override
  Widget build(BuildContext context) {
    final adaptiveScaffoldType = BreakpointsExtension.getScaffold(context);

    switch (adaptiveScaffoldType) {
      case AdaptiveScaffoldType.appBar:
        return ScaffoldWithAppBar(
          navigationShell: navigationShell,
          destinations: destinations,
        );
      case AdaptiveScaffoldType.navigationRail:
        return ScaffoldWithNavigationRail(
          navigationShell: navigationShell,
          destinations: destinations,
        );
      case AdaptiveScaffoldType.navigationDrawer:
        return ScaffoldWithNavigationDrawer(
          navigationShell: navigationShell,
          destinations: destinations,
        );
      default:
        return ScaffoldWithCompactAppBar(
          navigationShell: navigationShell,
          destinations: destinations,
        );
    }
  }
}
