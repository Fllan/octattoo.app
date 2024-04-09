
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/constants/sizes.dart';
import 'package:octattoo_app/core/l10n/language/localization.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SigninScreen extends ConsumerWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TextEditingController emailController;
    // TextEditingController passwordController;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.signinTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            gapH64,
            SignInButton(
              Buttons.Google,
              text: 'Sign In With Google'.hardcoded,
              onPressed: () {},
            ),
            gapH16,
            SignInButton(
              Buttons.Apple,
              text: 'Sign In With Apple'.hardcoded,
              onPressed: () {
                var snackBar = SnackBar(
                    content: Text(
                        'Not available right now. Please use another method.'
                            .hardcoded));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            gapH64,
            const Divider(
              height: 4,
            ),
            gapH32,
            Text(
              'Or you can use your email'.hardcoded,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            gapH16,
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
    //                controller: emailController,
                    decoration: InputDecoration(
                      label: Text('Email'.hardcoded),
                    ),
                  ),
                  gapH8,
                  TextField(
     //               controller: passwordController,
                    decoration: InputDecoration(
                      label: Text('Password'.hardcoded),
                    ),
                    obscureText: true,
                  ),
                  gapH16,
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Sign in with email'.hardcoded),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
