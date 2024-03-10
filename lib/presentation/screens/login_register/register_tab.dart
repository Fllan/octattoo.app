import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/presentation/providers/auth_service_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterTab extends ConsumerWidget {

  const RegisterTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authServProvider = ref.read(authServiceProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // Perform anonymous sign-in
                  authServProvider.anonLogin();
                },
                child: Text(AppLocalizations.of(context)!.continueGuest),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
