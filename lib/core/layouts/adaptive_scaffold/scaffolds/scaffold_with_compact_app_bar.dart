import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/layouts/adaptive_navigation/modal_drawer.dart';
import 'package:octattoo_app/core/constants/primary_destinations.dart';

class ScaffoldWithCompactAppBar extends StatelessWidget {
  const ScaffoldWithCompactAppBar({
    super.key,
    required this.navigationShell,
    required this.destinations,
    this.backgroundColor,
  });

  final StatefulNavigationShell navigationShell;
  final List<PrimaryDestination> destinations;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor,
      body: navigationShell,
      drawer: ModalDrawer(
        destinations: destinations,
        navigationShell: navigationShell,
      ),
    );
  }
}
