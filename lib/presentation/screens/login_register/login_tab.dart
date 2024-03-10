import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/presentation/providers/auth_service_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginTab extends ConsumerWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authServProvider = ref.read(authServiceProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.emailLabel,
              prefixIcon: const Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.passwordLabel,
              prefixIcon: const Icon(Icons.lock),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () async {
              await authServProvider.signInWithEmail(
                _emailController.text,
                _passwordController.text,
              );
            },
            child: Text(AppLocalizations.of(context)!.loginAction),
          ),
          TextButton(
            onPressed: () => context.go('/forgotPassword'),
            child: Text(AppLocalizations.of(context)!.forgotPwd),
          ),
          const SizedBox(height: 16.0),
          const Divider(height: 12),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () async {
              // Login with Google
              await authServProvider.googleLogin();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FaIcon(FontAwesomeIcons.google),
                const SizedBox(width: 10),
                Text(AppLocalizations.of(context)!.signInWithGoogle),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          // SignInWithAppleButton(
          //   onPressed: () async {
          //     await authServProvider.googleLogin();
          //   }
          // ),
        ],
      ),
    );
  }
}
