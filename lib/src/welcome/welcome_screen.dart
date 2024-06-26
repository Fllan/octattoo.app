import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app_mvp/core/constants/gaps.dart';
import 'package:octattoo_app_mvp/core/router/routes.dart';
import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.loc.appTitle,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          gapH64,
          gapH64,
          ElevatedButton(
            onPressed: () {
              context.pushNamed(WelcomeSubRoutes.signin.name);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text('Sign In'.hardcoded),
          ),
          gapH24,
          ElevatedButton(
            onPressed: () {
              context.pushNamed(WelcomeSubRoutes.register.name);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}
