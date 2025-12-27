import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_flutter/src/navigation/nav_destination.dart';
import 'package:octattoo_flutter/src/shared/l10n_extensions.dart';

class ScaffoldWithModalDrawer extends StatelessWidget {
  const ScaffoldWithModalDrawer({
    required this.navigationShell,
    required this.children,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithModalDrawer'));

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            appNavDestinations[navigationShell.currentIndex].label,
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        body: IndexedStack(
          index: navigationShell.currentIndex,
          children: children,
        ),
        drawer: NavigationDrawer(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (index) {
            navigationShell.goBranch(index);
            Navigator.pop(context);
          },
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
              child: Text(
                'octattoo.app'.hardcoded,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ...appNavDestinations.map(
              (dest) => NavigationDrawerDestination(
                icon: Icon(dest.icon),
                label: Text(dest.label.hardcoded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
