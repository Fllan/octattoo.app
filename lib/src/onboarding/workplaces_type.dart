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
import 'package:octattoo_app_mvp/src/onboarding/app_onboarding_scaffold.dart';

class WorkplacesTypeScreen extends ConsumerStatefulWidget {
  const WorkplacesTypeScreen({super.key});

  @override
  ConsumerState<WorkplacesTypeScreen> createState() =>
      _WorkplacesTypeScreenState();
}

class _WorkplacesTypeScreenState extends ConsumerState<WorkplacesTypeScreen> {
  Future<void> _updateStep() async {
    final prefs = ref.watch(sharedPreferencesRepositoryProvider);

    await prefs.saveInt(SharedPreferencesKeys.onboardingStep, 3);
    logger.d(
        'Onboarding step updated to :${prefs.getInt(SharedPreferencesKeys.onboardingStep)}');
  }

  Widget _buildTypeCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    String selectedType,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  gapH24,
                  Icon(
                    icon,
                    size: 68,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  gapH24,
                  Text(
                    description,
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
                      'selectedType': selectedType,
                    },
                  );
                },
                child: Text(
                  'New $title'.hardcoded,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppOnboardingScaffold(
      title: Text('Add a workplace'.hardcoded,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              )),
      children: [
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
                child: _buildTypeCard(
                  context,
                  'Guest'.hardcoded,
                  'When you tattoo for a period of time in a specific workplace'
                      .hardcoded,
                  Icons.work_history_outlined,
                  WorkplaceTypes.guest.value,
                ),
              ),
              gapW16,
              Expanded(
                flex: 1,
                child: _buildTypeCard(
                  context,
                  'Permanent'.hardcoded,
                  'Where you tattoo most of your time'.hardcoded,
                  Icons.storefront_outlined,
                  WorkplaceTypes.permanent.value,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
