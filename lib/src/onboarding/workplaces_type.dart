import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app_mvp/core/constants/gaps.dart';
import 'package:octattoo_app_mvp/core/router/routes.dart';
import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';
import 'package:octattoo_app_mvp/core/constants/worplace_types.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:octattoo_app_mvp/core/utils/shared_preferences/shared_preferences_keys.dart';
import 'package:octattoo_app_mvp/core/utils/shared_preferences/shared_preferences_repository.dart';

class WorkplacesTypeScreen extends ConsumerStatefulWidget {
  const WorkplacesTypeScreen({super.key});

  @override
  ConsumerState<WorkplacesTypeScreen> createState() =>
      _WorkplacesTypeScreenState();
}

class _WorkplacesTypeScreenState extends ConsumerState<WorkplacesTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add a workplace'.hardcoded,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    )),
            gapH16,
            Text(
              'Select a type of workplace to add your first one. You can add other workplaces later.'
                  .hardcoded,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            gapH32,
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Guest'.hardcoded,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  gapH24,
                                  Icon(
                                    Icons.work_history_outlined,
                                    size: 68,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                                  gapH24,
                                  const Text(
                                    'When you tattoo for a period of time in a specific workplace',
                                    textAlign: TextAlign.center,
                                  ),
                                  gapH24,
                                ],
                              ),
                              FilledButton(
                                onPressed: () {
                                  _updateStep();
                                  GoRouter.of(context).pushNamed(
                                    WorkplaceSubRoutes.add.name,
                                    pathParameters: {
                                      'selectedType':
                                          WorkplaceTypes.guest.value,
                                    },
                                  );
                                },
                                child: Text('New guest'.hardcoded),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  gapW16,
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Permanent'.hardcoded,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  gapH24,
                                  Icon(
                                    Icons.storefront_outlined,
                                    size: 68,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                                  gapH24,
                                  const Text(
                                    'Where you tattoo most of your time',
                                    textAlign: TextAlign.center,
                                  ),
                                  gapH24,
                                ],
                              ),
                              FilledButton(
                                onPressed: () {
                                  _updateStep();
                                  GoRouter.of(context).pushNamed(
                                    WorkplaceSubRoutes.add.name,
                                    pathParameters: {
                                      'selectedType':
                                          WorkplaceTypes.permanent.value
                                    },
                                  );
                                },
                                child: Text('New Permanent'.hardcoded),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            gapH24,
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.arrow_back),
                  gapW4,
                  Text('Back'.hardcoded),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _updateStep() async {
    final prefs = ref.watch(sharedPreferencesRepositoryProvider);

    await prefs.saveInt(SharedPreferencesKeys.onboardingStep, 3);
    logger.d(
        'Onboarding step updated to :${prefs.getInt(SharedPreferencesKeys.onboardingStep)}');
  }
}
