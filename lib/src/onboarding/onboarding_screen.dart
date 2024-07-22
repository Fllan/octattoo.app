import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app_mvp/core/constants/gaps.dart';
import 'package:octattoo_app_mvp/core/constants/user_roles.dart';
import 'package:octattoo_app_mvp/core/models/user.dart';
import 'package:octattoo_app_mvp/core/router/routes.dart';
import 'package:octattoo_app_mvp/core/services/firebase/authentication/authentication_repository.dart';
import 'package:octattoo_app_mvp/core/services/firebase/firestore/providers/users_repository.dart';
import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';
import 'package:octattoo_app_mvp/core/utils/logger.dart';
import 'package:octattoo_app_mvp/core/utils/shared_preferences.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
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
                      _createUserinFirestore();
                      GoRouter.of(context)
                          .pushNamed(OnboardingSubRoutes.artistProfile.name);
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
      ),
    );
  }

  Future<void> _updateStep() async {
    final prefs = SharedPreferencesService.instance;
    await prefs.saveInt(SharedPreferencesKeys.onboardingStep, 1);
    logger.d(
        'Onboarding step updated to :${await prefs.getInt(SharedPreferencesKeys.onboardingStep)}');
  }

  Future<void> _createUserinFirestore() async {
    // Create user in firestore
    final usersRepo = ref.read(usersRepositoryProvider);
    final authUserId = ref.watch(authStateChangesProvider).value!.uid;
    await usersRepo.create(
      User(
        id: authUserId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        role: UserRoles.artist,
        hasCompletedOnboarding: false,
        hasAnonymousAccount: false,
      ),
      authUserId,
    );
  }
}
