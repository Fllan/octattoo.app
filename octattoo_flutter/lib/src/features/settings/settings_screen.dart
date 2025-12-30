import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/locale/supported_locales.dart';
import 'package:octattoo_flutter/core/serverpod_client_service.dart';
import 'package:octattoo_flutter/core/settings/app_settings_provider.dart';
import 'package:octattoo_flutter/src/shared/async_button.dart';
import 'package:octattoo_flutter/src/shared/gaps.dart';
import 'package:octattoo_flutter/src/shared/l10n_extensions.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _showLanguageBottomSheet(BuildContext context) {
    // Use read() for callbacks - no rebuild dependency needed
    final settings = AppSettingsProvider.read(context);

    showModalBottomSheet(
      context: context,
      builder: (sheetContext) {
        // ListenableBuilder for the sheet's local rebuild
        return ListenableBuilder(
          listenable: settings,
          builder: (context, _) {
            final currentLocale = settings.locale;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: MaterialText.titleMedium(
                      'Select Language'.hardcoded,
                      context,
                    ),
                  ),
                  gapH12,
                  ...SupportedLocales.all.map((locale) {
                    final isSelected = currentLocale == locale;
                    return ListTile(
                      leading: MaterialText.headlineMedium(
                        SupportedLocales.flag(locale),
                        context,
                      ),
                      title: MaterialText.bodyMedium(
                        SupportedLocales.displayName(locale),
                        context,
                      ),
                      trailing: isSelected
                          ? Icon(
                              Icons.check_circle,
                              color: Theme.of(context).colorScheme.primary,
                            )
                          : null,
                      onTap: () {
                        settings.setLocale(locale);
                        Navigator.pop(context);
                      },
                    );
                  }),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final client = ServerpodClientService().client;
    final settings = AppSettingsProvider.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH32,
          MaterialText.titleSmall('Appearance'.hardcoded, context),
          gapH8,
          SwitchListTile(
            value: settings.themeMode == ThemeMode.dark,
            onChanged: (_) => settings.toggleTheme(),
            title: MaterialText.bodyMedium(
              'Switch light'.hardcoded,
              context,
            ),
            subtitle: MaterialText.bodySmall(
              'Current: ${settings.themeMode.name}'.hardcoded,
              context,
            ),
          ),
          ListTile(
            leading: MaterialText.headlineMedium(
              SupportedLocales.flag(settings.locale),
              context,
            ),
            title: MaterialText.bodyMedium('Language'.hardcoded, context),
            subtitle: MaterialText.bodySmall(
              SupportedLocales.displayName(settings.locale),
              context,
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showLanguageBottomSheet(context),
          ),
          gapH20,
          MaterialText.titleSmall('Disconnection'.hardcoded, context),
          gapH8,
          Center(
            child: AsyncButton.elevated(
              callback: client.auth.signOutDevice,
              label: 'Sign out'.hardcoded,
            ),
          ),
        ],
      ),
    );
  }
}
