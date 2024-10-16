import 'package:flutter/material.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';

class PrimaryDestination {
  const PrimaryDestination(this.icon, this.label, this.selectedIcon);
  final Widget icon;
  final Widget selectedIcon;
  final String label;
}

// Function to create the localized destinations
List<PrimaryDestination> createWelcomeDestinations(BuildContext context) {
  return <PrimaryDestination>[
    PrimaryDestination(
      const Icon(Icons.login),
      context.loc.signIn,
      const Icon(Icons.login_outlined),
    ),
    PrimaryDestination(
      const Icon(Icons.app_registration),
      context.loc.register,
      const Icon(Icons.app_registration_outlined),
    ),
  ];
}

List<PrimaryDestination> createOnboardingDestinations(BuildContext context) {
  return <PrimaryDestination>[
    PrimaryDestination(
      const Icon(Icons.waving_hand),
      'Onboarding'.hardcoded,
      const Icon(Icons.waving_hand_outlined),
    ),
  ];
}

List<PrimaryDestination> createAppDestinations(BuildContext context) {
  return <PrimaryDestination>[
    PrimaryDestination(
      const Icon(Icons.calendar_today),
      context.loc.appointments,
      const Icon(Icons.calendar_today_outlined),
    ),
    PrimaryDestination(
      const Icon(Icons.people),
      context.loc.customers,
      const Icon(Icons.people_outlined),
    ),
    PrimaryDestination(
      const Icon(Icons.dashboard),
      context.loc.projects,
      const Icon(Icons.dashboard_outlined),
    ),
    PrimaryDestination(
      const Icon(Icons.account_box),
      context.loc.artistProfile,
      const Icon(Icons.account_box_outlined),
    ),
    PrimaryDestination(
      const Icon(Icons.monetization_on),
      context.loc.finance,
      const Icon(Icons.monetization_on_outlined),
    ),
    PrimaryDestination(
      const Icon(Icons.inventory),
      context.loc.inventory,
      const Icon(Icons.inventory_outlined),
    ),
    PrimaryDestination(
      const Icon(Icons.settings),
      context.loc.settings,
      const Icon(Icons.settings_outlined),
    ),
  ];
}
