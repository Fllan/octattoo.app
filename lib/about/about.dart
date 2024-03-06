import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/providers/locale_manager_provider.dart';
import 'package:octattoo_app/services/auth.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeManager = ref.watch(localeManagerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.helloWorld),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => localeManager.setLocale(const Locale('en')),
              child: const Text('Switch to English'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => localeManager.setLocale(const Locale('fr')),
              child: const Text('Passer en français'),
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () async {
                await AuthService().signOut();
                if (context.mounted) {
                  context.go('/login');
                }
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
