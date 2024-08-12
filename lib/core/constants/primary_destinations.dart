import 'package:flutter/material.dart';
import 'package:octattoo_app/l10n/l10n_extensions.dart';

class PrimaryDestination {
  const PrimaryDestination(this.icon, this.label);
  final Widget icon;
  final String label;
}

List<PrimaryDestination> welcomeDestinations = <PrimaryDestination>[
  PrimaryDestination(const Icon(Icons.inbox_rounded), 'Sign In'.hardcoded),
  PrimaryDestination(const Icon(Icons.article_outlined), 'Register'.hardcoded),
];

List<PrimaryDestination> onboardingDestinations = <PrimaryDestination>[
  PrimaryDestination(const Icon(Icons.inbox_rounded), 'Artist Name'.hardcoded),
  PrimaryDestination(const Icon(Icons.article_outlined), 'Workplace'.hardcoded),
];

List<PrimaryDestination> appDestinations = <PrimaryDestination>[
  PrimaryDestination(
      const Icon(Icons.calendar_today), 'Appointments'.hardcoded),
  PrimaryDestination(const Icon(Icons.people), 'Customers'.hardcoded),
  PrimaryDestination(const Icon(Icons.dashboard), 'Projects'.hardcoded),
  PrimaryDestination(const Icon(Icons.account_box), 'Artist Profile'.hardcoded),
  PrimaryDestination(const Icon(Icons.monetization_on), 'Finance'.hardcoded),
  PrimaryDestination(const Icon(Icons.inventory), 'Inventory'.hardcoded),
  PrimaryDestination(const Icon(Icons.settings), 'Settings'.hardcoded),
];
