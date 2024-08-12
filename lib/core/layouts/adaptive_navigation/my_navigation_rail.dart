import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/primary_destinations.dart';

class MyNavigationRail extends StatelessWidget {
  const MyNavigationRail({
    super.key,
    required this.destinations,
    required this.navigationShell,
  });

  final List<PrimaryDestination> destinations;
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      groupAlignment: 0.0,
      extended: false,
      labelType: NavigationRailLabelType.all,
      destinations: destinations
          .map<NavigationRailDestination>((PrimaryDestination destination) {
        return NavigationRailDestination(
          icon: destination.icon,
          label: Text(destination.label),
          selectedIcon: destination.selectedIcon,
        );
      }).toList(),
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: (index) {
        navigationShell.goBranch(
          index,
          // A common pattern when using bottom navigation bars is to support
          // navigating to the initial location when tapping the item that is
          // already active. This example demonstrates how to support this behavior,
          // using the initialLocation parameter of goBranch.
          initialLocation: index == navigationShell.currentIndex,
        );
      },
    );
  }
}
