import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/breakpoints.dart';
import 'package:octattoo_app/core/layouts/adaptive_navigation/modal_drawer.dart';
import 'package:octattoo_app/core/layouts/adaptive_navigation/my_navigation_rail.dart';
import 'package:octattoo_app/core/constants/primary_destinations.dart';
import 'package:octattoo_app/core/layouts/adaptive_scaffold/scaffolds/scaffold_with_compact_app_bar.dart';

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
    super.key,
    required this.destinations,
    required this.navigationShell,
    this.backgroundColor,
  });

  final List<PrimaryDestination> destinations;
  final StatefulNavigationShell navigationShell;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    if (BreakpointsExtension.isHeightCompact(context)) {
      return ScaffoldWithCompactAppBar(
        navigationShell: navigationShell,
        destinations: destinations,
        backgroundColor: backgroundColor,
      );
    } else {
      return Scaffold(
        backgroundColor: backgroundColor,
        body: Row(
          children: [
            MyNavigationRail(
              destinations: destinations,
              navigationShell: navigationShell,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 24, 0),
                child: navigationShell,
              ),
            ),
          ],
        ),
        drawer: ModalDrawer(
          destinations: destinations,
          navigationShell: navigationShell,
        ),
      );
    }
  }
}
