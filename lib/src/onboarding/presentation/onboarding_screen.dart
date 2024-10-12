import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/authentication/data/firebase_auth_repository.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, _) => ElevatedButton(
            onPressed: ref.read(authRepositoryProvider).signOut,
            child: const Text('Log out'),
          ),
        ),
      ),
    );
  }
}
