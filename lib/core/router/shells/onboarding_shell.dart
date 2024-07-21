import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app_mvp/core/services/firebase/authentication/authentication_repository.dart';
import 'package:octattoo_app_mvp/core/utils/logger.dart';
import 'package:octattoo_app_mvp/core/utils/shared_preferences.dart';

class OnboardingShell extends ConsumerWidget {
  const OnboardingShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(authStateChangesProvider).value != null;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding'),
        actions: [
          IconButton(
            onPressed: _checkSharedPreferencesData,
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

  void _checkSharedPreferencesData() async {
    final prefs = SharedPreferencesService.instance;
    for (final key in SharedPreferencesKeys.values) {
      if (key.name.startsWith('onboardingStep')) {
        final value = await prefs.getInt(key);
        logger.d('SharedPreferences key: ${key.name}, value: $value');
      } else if (key.name.startsWith('onboardingShow')) {
        final value = await prefs.getBool(key);
        logger.d('SharedPreferences key: ${key.name}, value: $value');
      } else if (key.name.startsWith('onboarding')) {
        final value = await prefs.getString(key);
        logger.d('SharedPreferences key: ${key.name}, value: $value');
      }
    }
  }
}
