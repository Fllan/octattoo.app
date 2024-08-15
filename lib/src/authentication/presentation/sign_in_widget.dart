import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/shared/widgets/async_button_with_icon.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        MaterialText.titleLarge(context.loc.signIn, context),
        const TextField(
          decoration: InputDecoration(labelText: 'Email'),
        ),
        const TextField(
          decoration: InputDecoration(labelText: 'Password'),
        ),
        gapH24,
        Row(
          children: [
            Expanded(
              child: AsyncButtonWithIcon.filled(
                callback: () => Future.delayed(const Duration(seconds: 2)),
                label: context.loc.signIn,
                icon: const Icon(Icons.login),
              ),
            ),
          ],
        ),
        gapH32,
        ElevatedButton(
          onPressed: () => context.goNamed('forgot-password'),
          child: const Text('Go to Forgot Password'),
        ),
      ],
    );
  }
}
