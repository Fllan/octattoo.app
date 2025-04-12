import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/l10n_extensions.dart';
import 'package:octattoo_flutter/features/authentication/components/password_reset_request_form.dart';

class PasswordResetRequestScreen extends StatelessWidget {
  const PasswordResetRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ResetPasswordScreen".hardcoded)),
      body: SingleChildScrollView(child: PasswordResetRequestForm()),
    );
  }
}
