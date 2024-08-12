import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/shared/widgets/async_button.dart';
import 'package:octattoo_app/src/shared/widgets/async_button_with_icon.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  Future<void> callback() async {
    // Simulate a delay to mimic an async operation
    await Future.delayed(const Duration(seconds: 5));

    // Print a message to the console
    print('Button pressed!');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sign In', style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
