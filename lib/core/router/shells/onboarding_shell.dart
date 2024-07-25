import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app_mvp/core/services/firebase/authentication/authentication_repository.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:octattoo_app_mvp/core/utils/shared_preferences/shared_preferences_keys.dart';
import 'package:octattoo_app_mvp/core/utils/shared_preferences/shared_preferences_repository.dart';

class OnboardingShell extends ConsumerWidget {
  const OnboardingShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(authStateChangesProvider).value != null;
    final prefs = ref.read(sharedPreferencesRepositoryProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding'),
        actions: [
          IconButton(
            onPressed: () => _checkSharedPreferencesData(prefs),
            icon: const Icon(Icons.developer_board),
          ),
          if (isAuthenticated)
            IconButton(
              onPressed: () {
                ref.read(authRepositoryProvider).signOut();
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          if (!isAuthenticated)
            const IconButton(
              onPressed: null,
              icon: Icon(Icons.exit_to_app),
              disabledColor: Colors.grey,
            ),
        ],
      ),
      body: child,
    );
  }

  _checkSharedPreferencesData(SharedPreferencesRepository prefs) {
    for (final key in SharedPreferencesKeys.values) {
      if (key.name.startsWith('onboardingStep')) {
        final value = prefs.getInt(key);
        logger.d('SharedPreferences key: ${key.name}, value: $value');
      } else if (key.name.startsWith('onboardingShow')) {
        final value = prefs.getBool(key);
        logger.d('SharedPreferences key: ${key.name}, value: $value');
      } else if (key.name.startsWith('onboarding')) {
        final value = prefs.getString(key);
        logger.d('SharedPreferences key: ${key.name}, value: $value');
      }
    }
  }
}
