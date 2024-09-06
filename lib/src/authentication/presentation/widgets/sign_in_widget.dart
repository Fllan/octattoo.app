import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/core/router/app_routes.dart';
import 'package:octattoo_app/src/shared/widgets/async_button_with_icon.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 250,
        maxWidth: 400,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          MaterialText.titleLarge(context.loc.signIn, context),
          gapH24,
          const TextField(
            decoration: InputDecoration(labelText: 'Email'),
          ),
          const TextField(
            decoration: InputDecoration(labelText: 'Password'),
          ),
          gapH24,
          AsyncButtonWithIcon.filled(
            callback: () => Future.delayed(const Duration(seconds: 2)),
            label: context.loc.signIn,
            icon: const Icon(Icons.login),
          ),
          gapH64,
          ElevatedButton(
            onPressed: () => context.goNamed(AppRoutes.forgotPassword.name),
            child: const Text('Go to Forgot Password'),
          ),
        ],
      ),
    );
  }
}
