import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/src/shared/async_button.dart';
import 'package:octattoo_app/core/constants/sizes.dart';
import 'package:octattoo_app/core/l10n/language/localization.dart';
import 'package:octattoo_app/core/l10n/language/language_popup_menu.dart';
import 'package:octattoo_app/core/router/app_router.dart';
import 'package:octattoo_app/core/router/app_router_listenable.dart';
import 'package:octattoo_app/core/theme/theme_toggle_button.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

  final appRouterListenable = ref.watch(appRouterListenableProvider);

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
              Text(context.loc.welcomeMessage),
              gapH48,
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  child: Text(context.loc.signinTitle),
                  onPressed: () => context.pushNamed(RoutePath.signin.name),
                ),
              ),
              gapH12,
              SizedBox(
                width: 200,
                child: AsyncButton(
                  label: context.loc.continueGuest,
                  onPressed: () async {
                    await appRouterListenable.signInAnonymously();
                  },
                ),
              ),
            ],
          ),
        ),
      );
  }
}
