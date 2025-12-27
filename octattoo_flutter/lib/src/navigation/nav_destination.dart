import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/l10n_extensions.dart';

class NavDestination {
  const NavDestination({
    required this.index,
    required this.label,
    required this.icon,
  });

  final int index;
  final String label;
  final IconData icon;
}

List<NavDestination> appNavDestinations = [
  NavDestination(
    index: 0,
    label: 'Customers'.hardcoded,
    icon: Icons.people,
  ),
  NavDestination(
    index: 1,
    label: 'Appointments'.hardcoded,
    icon: Icons.calendar_today,
  ),
  NavDestination(
    index: 2,
    label: 'Artist Profile'.hardcoded,
    icon: Icons.person,
  ),
  NavDestination(
    index: 3,
    label: 'Settings'.hardcoded,
    icon: Icons.settings,
  ),
];
