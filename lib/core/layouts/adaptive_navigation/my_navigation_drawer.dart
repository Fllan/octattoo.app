import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/primary_destinations.dart';

class MyNavigationDrawer extends StatelessWidget {
  const MyNavigationDrawer({
    super.key,
    required this.navigationShell,
    required this.destinations,
    required this.isModal,
  });

  final StatefulNavigationShell navigationShell;
  final List<PrimaryDestination> destinations;
  final bool isModal;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: (int index) {
        navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        );
        if (isModal) {
          Navigator.of(context).pop();
        }
      },
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            'octattoo.app',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        ...destinations.asMap().entries.map(
          (entry) {
            return NavigationDrawerDestination(
              icon: entry.value.icon,
              label: Text(entry.value.label),
            );
          },
        ),
      ],
    );
  }
}
