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
import 'package:octattoo_app_mvp/src/shared/widgets/app_async_elevated_button.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  Future<void> _createUserinFirestore() async {
    // Create user in firestore
    final usersRepo = ref.read(usersRepositoryProvider);
    final authUserId = ref.read(authStateChangesProvider).value!.uid;
    final hasAnonymousAccount =
        ref.read(authStateChangesProvider).value!.email == null;

    await usersRepo.create(
      User(
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        role: UserRoles.artist,
        hasCompletedOnboarding: false,
        hasAnonymousAccount: hasAnonymousAccount,
        firstname: null,
        lastname: null,
        showPronoun: false,
        pronoun: null,
        email: hasAnonymousAccount
            ? null
            : ref.read(authStateChangesProvider).value!.email,
        phoneNumber: null,
        photoURL: null,
        bio: null,
        street: null,
        city: null,
        province: null,
        country: null,
        postalCode: null,
      ),
      authUserId,
    );
  }

  Future<void> _callback() async {
    await _createUserinFirestore();
    if (context.mounted) {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).goNamed(OnboardingSubRoutes.artistProfile.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome in the community!'.hardcoded,
            ),
            gapH32,
            const Icon(
              Icons.volunteer_activism,
              size: 48,
            ),
            gapH32,
            AppAsyncElevatedButton(
              callback: _callback,
              label: 'Start onboarding'.hardcoded,
            ),
          ],
        ),
      ),
    );
  }
}
