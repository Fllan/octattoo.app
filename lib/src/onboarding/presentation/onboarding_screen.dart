import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/authentication/data/firebase_auth_repository.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';

class OnBoardingScreen extends ConsumerStatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  ConsumerState<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends ConsumerState<OnBoardingScreen> {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 900,
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialText.titleLarge('Artist Profile'.hardcoded, context),
                  gapH16,
                  MaterialText.labelLarge(
                      'First let\'s set the basics of your public artist identity',
                      context),
                  gapH32,
                  const TempLogOutButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TempLogOutButton extends StatelessWidget {
  const TempLogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) => ElevatedButton(
        onPressed: ref.read(authRepositoryProvider).signOut,
        child: const Text('Log out'),
      ),
    );
  }
}
