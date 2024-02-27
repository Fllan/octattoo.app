import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:octattoo_app/services/auth.dart';
import 'package:octattoo_app/services/locale_manager.dart';
import 'package:provider/provider.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleManager localeManager = Provider.of<LocaleManager>(context, listen: false);

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
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
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
