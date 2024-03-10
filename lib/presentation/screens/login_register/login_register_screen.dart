import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/presentation/providers/locale_manager_provider.dart';
import 'package:octattoo_app/presentation/providers/theme_mode_provider.dart';
import 'login_tab.dart';
import 'register_tab.dart';

class LoginRegisterScreen extends ConsumerStatefulWidget {
  const LoginRegisterScreen({super.key});

  @override
  _LoginRegisterScreenState createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends ConsumerState<LoginRegisterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        actions: <Widget>[
          _buildLanguageMenu(context, ref),
          _buildThemeToggleButton(context, ref),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: AppLocalizations.of(context)!.loginTab),
            Tab(text: AppLocalizations.of(context)!.registerTab),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          LoginTab(),
          const RegisterTab(),
        ],
      ),
    );
  }
}

Widget _buildLanguageMenu(BuildContext context, WidgetRef ref) {
  return PopupMenuButton<String>(
    onSelected: (String value) {
      final localeManager = ref.read(localeManagerProvider);
      localeManager.setLocale(Locale(value));
    },
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
      const PopupMenuItem<String>(
        value: 'en',
        child: Text('English'),
      ),
      const PopupMenuItem<String>(
        value: 'fr',
        child: Text('Français'),
      ),
    ],
    icon: const Icon(Icons.language),
  );
}

Widget _buildThemeToggleButton(BuildContext context, WidgetRef ref) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;

  return IconButton(
    icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
    onPressed: () {
      // This will toggle between light and dark mode correctly.
      ref.read(themeModeProvider.notifier).state =
          isDarkMode ? ThemeMode.light : ThemeMode.dark;
      
      // To ensure that the MaterialApp rebuilds with the new theme,
      // call setState if this toggle button is within the Stateful Widget tree.
      // If your app does not update, you might need to call setState() here or ensure
      // that the MaterialApp is being rebuilt when the themeMode changes.
    },
  );
}
