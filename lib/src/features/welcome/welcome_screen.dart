import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/router/models/route_path.dart';
import 'package:octattoo_app/core/services/firebase/authentication/auth_providers.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/src/shared/async_button.dart';
import 'package:octattoo_app/core/constants/sizes.dart';
import 'package:octattoo_app/core/l10n/utils/localization_extensions.dart';
import 'package:octattoo_app/src/shared/language_popup_menu.dart';
import 'package:octattoo_app/core/router/app_router_listenable.dart';
import 'package:octattoo_app/core/theme/theme_toggle_button.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});
  static const signInAnonButtonKey = 'signInAnonButton';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouterListenable = ref.watch(appRouterListenableProvider);
    final user = ref.watch(authServiceProvider).currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.appTitle),
        centerTitle: true,
        actions: const [
          ThemeModeToggleButton(),
          LanguagePopupMenu(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.loc.welcomeMessage,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            gapH48,
            if (user == null) _buildGuestButtons(context, appRouterListenable),
            if (user != null) _buildUserButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildGuestButtons(BuildContext context, AppRouterListenable appRouterListenable) {
    return Column(
      children: [
        _buildButton(context, context.loc.signinTitle, () => context.pushNamed(RoutePath.signin.name)),
        gapH12,
        _buildAsyncButton(context, context.loc.continueGuest, () async {
          try {
            await appRouterListenable.signInAnonymously();
          } catch (e) {
            logger.e('Failed to sign in anonymously: $e');
          }
        }, signInAnonButtonKey),
      ],
    );
  }

  Widget _buildUserButton(BuildContext context) {
    return _buildButton(context, context.loc.continueGuest, () => context.pushNamed(RoutePath.onboarding.name));
  }

  Widget _buildButton(BuildContext context, String label, VoidCallback onPressed) {
    return _buildPaddedButton(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }

  Widget _buildAsyncButton(BuildContext context, String label, Future<void> Function() onPressed, String uniqueKey) {
    return _buildPaddedButton(
      child: AsyncButton(
        label: label,
        onPressed: onPressed,
        uniqueKey: uniqueKey,
      ),
    );
  }

  Widget _buildPaddedButton({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0),
      child: child,
    );
  }
}
