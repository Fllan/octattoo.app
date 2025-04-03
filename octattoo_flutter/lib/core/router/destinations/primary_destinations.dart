import 'package:flutter/material.dart';

class PrimaryDestination {
  const PrimaryDestination(this.icon, this.label, this.selectedIcon);
  final Widget icon;
  final Widget selectedIcon;
  final String label;
}

// Function to create the localized destinations
List<PrimaryDestination> createGuestDestinations(BuildContext context) {
  return <PrimaryDestination>[
    PrimaryDestination(
      const Icon(Icons.login),
      "signIn",
      const Icon(Icons.login_outlined),
    ),
    PrimaryDestination(
      const Icon(Icons.app_registration),
      "register",
      const Icon(Icons.app_registration_outlined),
    ),
  ];
}

List<PrimaryDestination> createAppDestinations(BuildContext context) {
  return <PrimaryDestination>[
    PrimaryDestination(
      const Icon(Icons.calendar_today),
      "appointments",
      const Icon(Icons.calendar_today_outlined),
    ),
    PrimaryDestination(
      const Icon(Icons.people),
      "customers",
      const Icon(Icons.people_outlined),
    ),
    PrimaryDestination(
      const Icon(Icons.dashboard),
      "projects",
      const Icon(Icons.dashboard_outlined),
    ),
    PrimaryDestination(
      const Icon(Icons.account_box),
      "artistProfile",
      const Icon(Icons.account_box_outlined),
    ),
    PrimaryDestination(
      const Icon(Icons.monetization_on),
      "finance",
      const Icon(Icons.monetization_on_outlined),
    ),
    PrimaryDestination(
      const Icon(Icons.inventory),
      "inventory",
      const Icon(Icons.inventory_outlined),
    ),
    PrimaryDestination(
      const Icon(Icons.settings),
      "settings",
      const Icon(Icons.settings_outlined),
    ),
  ];
}
