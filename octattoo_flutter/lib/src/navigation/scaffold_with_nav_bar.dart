import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_flutter/src/navigation/nav_destination.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    required this.children,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: navigationShell.currentIndex,
          children: children,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          selectedIconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
          selectedLabelStyle: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
          unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
          unselectedLabelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          unselectedIconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          type: .shifting,
          useLegacyColorScheme: true,
          showUnselectedLabels: true,
          items: appNavDestinations
              .map(
                (dest) => BottomNavigationBarItem(
                  icon: Icon(dest.icon),
                  label: dest.label,
                  activeIcon: Icon(dest.activeIcon),
                ),
              )
              .toList(),
          currentIndex: navigationShell.currentIndex,
          onTap: (int index) => _onTap(context, index),
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
