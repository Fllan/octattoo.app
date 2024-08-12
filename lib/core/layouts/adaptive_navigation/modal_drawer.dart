import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/primary_destinations.dart';
import 'package:octattoo_app/core/layouts/adaptive_navigation/my_navigation_drawer.dart';

class ModalDrawer extends StatelessWidget {
  const ModalDrawer({
    super.key,
    required this.destinations,
    required this.navigationShell,
  });

  final List<PrimaryDestination> destinations;
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MyNavigationDrawer(
        navigationShell: navigationShell,
        destinations: destinations,
        isModal: true,
      ),
    );
  }
}
