import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_flutter/core/l10n_extensions.dart';
import 'package:octattoo_flutter/core/router/routes/guest_routes.dart';
import 'package:octattoo_flutter/core/shared/components/buttons/primary_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 400,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    onPressed: () => context.goNamed(GuestRoutes.signIn.name),
                    label: Text("I have an account".hardcoded),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
