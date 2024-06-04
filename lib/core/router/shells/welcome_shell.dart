import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app_mvp/core/services/firebase/authentication/authentication_repository.dart';

class WelcomeShell extends ConsumerWidget {
  const WelcomeShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(authStateChangesProvider).value != null;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: [
          if (isAuthenticated)
            IconButton(
              onPressed: () {
                ref.read(authRepositoryProvider).signOut();
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          if (!isAuthenticated)
            const IconButton(
              onPressed: null,
              icon: Icon(Icons.exit_to_app),
              disabledColor: Colors.grey,
            ),
         ],
      ),
      body: child,
    );
  }
}