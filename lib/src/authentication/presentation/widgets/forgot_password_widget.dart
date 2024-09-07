import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/shared/widgets/async_button_with_icon.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          gapH24,
          MaterialText.titleLarge(context.loc.forgotPassword, context),
          gapH24,
          TextField(
            decoration: InputDecoration(labelText: 'Email'.hardcoded),
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
          gapH24,
        ],
      ),
    );
  }
}
