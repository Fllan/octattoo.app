import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/l10n_extensions.dart';
import 'package:octattoo_flutter/features/authentication/components/verification_code_form.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SignInWithEmailScreen".hardcoded)),
      body: SingleChildScrollView(child: VerificationCodeForm()),
    );
  }
}
