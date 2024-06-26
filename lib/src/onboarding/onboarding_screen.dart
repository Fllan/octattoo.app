import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app_mvp/core/constants/gaps.dart';
import 'package:octattoo_app_mvp/core/router/routes.dart';
import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';
import 'package:octattoo_app_mvp/core/utils/logger.dart';
import 'package:octattoo_app_mvp/core/utils/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH64,
          Text(
            'Welcome in the community!'.hardcoded,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          gapH16,
          const Placeholder(
            fallbackHeight: 200,
            fallbackWidth: 200,
          ),
          gapH16,
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    _updateStep();
                    context.pushNamed(OnboardingSubRoutes.artistProfile.name);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.self_improvement_outlined),
                      Text('Start onboarding'.hardcoded),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _updateStep() async {
    final prefs = SharedPreferencesService.instance;
    await prefs.saveInt(SharedPreferencesKeys.onboardingStep, 1);
    logger.d(
        'Onboarding step updated to :${await prefs.getInt(SharedPreferencesKeys.onboardingStep)}');
  }
}
