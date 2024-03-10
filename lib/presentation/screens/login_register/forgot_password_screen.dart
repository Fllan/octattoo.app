import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:octattoo_app/presentation/providers/auth_service_provider.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authServProvider = ref.read(authServiceProvider);
    final TextEditingController _emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.forgotPwdTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.resetLinkPrompt),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: AppLocalizations.of(context)!.emailLabel),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await authServProvider
                    .sendPasswordResetEmail(_emailController.text);
              },
              child: Text(AppLocalizations.of(context)!.sendResetLink),
            ),
          ],
        ),
      ),
    );
  }
}
