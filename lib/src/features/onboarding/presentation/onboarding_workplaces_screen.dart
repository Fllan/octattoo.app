import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/constants/sizes.dart';
import 'package:octattoo_app/core/l10n/utils/localization_extensions.dart';
import 'package:octattoo_app/core/router/app_router_listenable.dart';

class OnboardingWorkplacesScreen extends ConsumerStatefulWidget {
  const OnboardingWorkplacesScreen({super.key});

  @override
  ConsumerState<OnboardingWorkplacesScreen> createState() =>
      _OnboardingWorkplacesScreenState();
}

class _OnboardingWorkplacesScreenState
    extends ConsumerState<OnboardingWorkplacesScreen> {
  @override
  Widget build(BuildContext context) {
    final appRouterListenable = ref.watch(appRouterListenableProvider);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            gapH64,
            Text(
              'Workplaces'.hardcoded,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            gapH16,
            Text(
              "Select a type of workplace to add your first one. You can add other workplaces later."
                  .hardcoded,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            gapH32,
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.all(20),
                    child: const Text('Left'),
                  ),
                ),
                Container(
                  color: Colors.green,
                  padding: const EdgeInsets.all(20),
                  child: const Text('Right'),
                ),
              ],
            ),
            //
            //  TODO : remove logout button - for dev purpose
            //
            gapH64,
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: ElevatedButton(
                child: Text(context.loc.signOutAction),
                onPressed: () => appRouterListenable.signOut(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
