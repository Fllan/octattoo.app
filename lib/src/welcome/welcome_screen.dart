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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            context.loc.appTitle,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          gapH64,
          ElevatedButton(
            onPressed: () {
              context.pushNamed(WelcomeSubRoutes.signin.name);
            },
            child: Text(
              'Sign In'.hardcoded,
            ),
          ),
          gapH24,
          ElevatedButton(
            onPressed: () {
              context.pushNamed(WelcomeSubRoutes.register.name);
            },
            child: Text(
              'Register'.hardcoded,
            ),
          ),
        ],
      ),
    );
  }
}
