import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/constants/sizes.dart';
import 'package:octattoo_app/src/features/language/localization.dart';
import 'package:octattoo_app/src/features/router/app_router_listenable.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouterListenable = ref.watch(appRouterListenableProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text(context.loc.onboardingTitle),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            gapH48,
            SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: ElevatedButton(
                  child: Text(context.loc.signOutAction),
                  onPressed: () => appRouterListenable.signOut(),
                ),
              ),
            ),

          ],
        ));
  }
}
