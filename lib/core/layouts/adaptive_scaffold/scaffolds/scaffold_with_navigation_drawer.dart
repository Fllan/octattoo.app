import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/primary_destinations.dart';
import 'package:octattoo_app/core/layouts/adaptive_navigation/my_navigation_drawer.dart';

class ScaffoldWithNavigationDrawer extends StatelessWidget {
  const ScaffoldWithNavigationDrawer({
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
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Row(
        children: [
          MyNavigationDrawer(
            destinations: destinations,
            navigationShell: navigationShell,
            isModal: false,
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(child: navigationShell),
            ),
          ),
        ],
      ),
    );
  }
}
