import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/primary_destinations.dart';
import 'package:octattoo_app/core/layouts/adaptive_navigation/modal_drawer.dart';

class ScaffoldWithAppBar extends StatelessWidget {
  const ScaffoldWithAppBar({
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
      extendBody: false,
      extendBodyBehindAppBar: false,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
      ),
      // body: Center(child: SingleChildScrollView(child: navigationShell)),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: navigationShell),
      drawer: ModalDrawer(
        destinations: destinations,
        navigationShell: navigationShell,
      ),
    );
  }
}
