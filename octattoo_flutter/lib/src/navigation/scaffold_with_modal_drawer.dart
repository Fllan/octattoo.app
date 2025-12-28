import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_flutter/src/navigation/nav_destination.dart';
import 'package:octattoo_flutter/src/shared/l10n_extensions.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

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
          title: MaterialText.titleLarge(
            appNavDestinations[navigationShell.currentIndex].label,
            context,
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
              child: MaterialText.titleSmall(
                'octattoo.app'.hardcoded,
                context,
              ),
            ),
            ...appNavDestinations.map(
              (dest) => NavigationDrawerDestination(
                icon: Icon(dest.icon),
                label: MaterialText.labelLarge(dest.label.hardcoded, context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
