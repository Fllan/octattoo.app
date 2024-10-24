import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/constants/primary_destinations.dart';
import 'package:octattoo_app/core/localization/widgets/language_selection_menu.dart';
import 'package:octattoo_app/core/theme/widgets/brightness_button.dart';
import 'package:octattoo_app/core/theme/widgets/color_selection_menu.dart';
import 'package:octattoo_app/core/theme/widgets/image_selection_menu.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/authentication/data/firebase_auth_repository.dart';

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
      backgroundColor: Theme.of(context).colorScheme.surfaceDim,
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
            context.loc.appTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        ...destinations.asMap().entries.map(
          (entry) {
            return NavigationDrawerDestination(
              icon: entry.value.icon,
              label: Text(entry.value.label),
              selectedIcon: entry.value.selectedIcon,
            );
          },
        ),
        gapH64,
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Divider(
                color: Theme.of(context).colorScheme.outline,
                thickness: 1,
                height: 1,
              ),
              gapH16,
              Text(
                'Personalization'.hardcoded,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              gapH16,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BrightnessButton(),
                  LanguageSelectionMenu(),
                  ColorSelectionMenu(),
                  ImageSelectionMenu(),
                ],
              ),
              gapH16,
              Divider(
                color: Theme.of(context).colorScheme.outline,
                thickness: 1,
                height: 1,
              ),
            ],
          ),
        ),
        gapH64,
        const Align(
          alignment: Alignment.bottomCenter,
          child: TempLogOutButton(),
        )
      ],
    );
  }
}

class TempLogOutButton extends StatelessWidget {
  const TempLogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) => ElevatedButton(
        onPressed: ref.read(authRepositoryProvider).signOut,
        child: const Text('Log out'),
      ),
    );
  }
}
