import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/shared/widgets/async_button_with_icon.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialText.titleLarge(context.loc.forgotPassword, context),
        const TextField(
          decoration: InputDecoration(labelText: 'Email'),
        ),
        gapH24,
        Row(
          children: [
            Expanded(
              child: AsyncButtonWithIcon.filled(
                callback: () => Future.delayed(const Duration(seconds: 2)),
                label: 'Send reset link'.hardcoded,
                icon: const Icon(Icons.send),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
