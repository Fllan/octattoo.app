import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/locale/supported_locales.dart';
import 'package:octattoo_flutter/core/serverpod_client_service.dart';
import 'package:octattoo_flutter/core/settings/app_settings_provider.dart';
import 'package:octattoo_flutter/core/theme/theme_data.dart';
import 'package:octattoo_flutter/src/shared/gaps.dart';
import 'package:octattoo_flutter/src/shared/l10n_extensions.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _showColorBottomSheet(BuildContext context) {
    // Use read() for callbacks - no rebuild dependency needed
    final settings = AppSettingsProvider.read(context);

    showModalBottomSheet(
      context: context,
      builder: (sheetContext) {
        // ListenableBuilder for the sheet's local rebuild
        return ListenableBuilder(
          listenable: settings,
          builder: (context, _) {
            final currentColorImage = settings.colorImage;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 8.0,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: MaterialText.titleMedium(
                      'Select Color'.hardcoded,
                      context,
                    ),
                  ),
                  gapH12,
                  ...ColorImage.values.map((colorImage) {
                    final isSelected = currentColorImage == colorImage;
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          colorImage.assetPath,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(colorImage.displayName.hardcoded),
                      trailing: isSelected
                          ? Icon(
                              Icons.check_circle,
                              color: Theme.of(context).colorScheme.primary,
                            )
                          : null,
                      onTap: () {
                        settings.setColorImage(colorImage);
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

  void _showModeBottomSheet(BuildContext context) {
    // Use read() for callbacks - no rebuild dependency needed
    final settings = AppSettingsProvider.read(context);

    showModalBottomSheet(
      context: context,
      builder: (sheetContext) {
        // ListenableBuilder for the sheet's local rebuild
        return ListenableBuilder(
          listenable: settings,
          builder: (context, _) {
            final currentThemeMode = settings.themeMode;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: MaterialText.titleMedium(
                      'Select Theme'.hardcoded,
                      context,
                    ),
                  ),
                  gapH12,
                  ...ThemeMode.values.map((themeMode) {
                    final isSelected = currentThemeMode == themeMode;
                    return ListTile(
                      title: MaterialText.bodyMedium(
                        themeMode.name.hardcoded,
                        context,
                      ),
                      trailing: isSelected
                          ? Icon(
                              Icons.check_circle,
                              color: Theme.of(context).colorScheme.primary,
                            )
                          : null,
                      onTap: () {
                        settings.setThemeMode(themeMode);
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
    final settings = AppSettingsProvider.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH32,
          MaterialText.titleSmall('Appearance'.hardcoded, context),
          gapH8,
          ListTile(
            leading: Icon(Icons.language_outlined),
            title: Text('Language'.hardcoded),
            subtitle: Text(SupportedLocales.displayName(settings.locale)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showLanguageBottomSheet(context),
          ),
          ListTile(
            leading: Icon(Icons.brightness_6_outlined),
            title: Text('Mode (light / dark)'.hardcoded),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showModeBottomSheet(context),
          ),
          ListTile(
            leading: Icon(Icons.palette_outlined),
            title: Text('Color'.hardcoded),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showColorBottomSheet(context),
          ),
          gapH20,
          Divider(),
          gapH20,
          MaterialText.titleSmall('Test Showcase - Color change', context),
          gapH8,
          _buildColorShowcase(context),
        ],
      ),
    );
  }

  Widget _buildColorShowcase(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _colorTile('Primary', colorScheme.primary, colorScheme.onPrimary),
        _colorTile('Secondary', colorScheme.secondary, colorScheme.onSecondary),
        _colorTile('Tertiary', colorScheme.tertiary, colorScheme.onTertiary),
        _colorTile(
          'Primary\nContainer',
          colorScheme.primaryContainer,
          colorScheme.onPrimaryContainer,
        ),
        _colorTile(
          'Secondary\nContainer',
          colorScheme.secondaryContainer,
          colorScheme.onSecondaryContainer,
        ),
        _colorTile(
          'Tertiary\nContainer',
          colorScheme.tertiaryContainer,
          colorScheme.onTertiaryContainer,
        ),
        _colorTile('Surface', colorScheme.surface, colorScheme.onSurface),
        _colorTile(
          'Surface\nVariant',
          colorScheme.surfaceContainerHighest,
          colorScheme.onSurfaceVariant,
        ),
        _colorTile('Error', colorScheme.error, colorScheme.onError),
      ],
    );
  }

  Widget _colorTile(String label, Color background, Color foreground) {
    return Container(
      width: 100,
      height: 80,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: foreground.withValues(alpha: 0.2)),
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: foreground,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
