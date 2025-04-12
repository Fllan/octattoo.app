import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/l10n_extensions.dart';
import 'package:octattoo_flutter/features/authentication/components/register_with_email_form.dart';

class RegisterWithEmailScreen extends StatelessWidget {
  const RegisterWithEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RegisterWithEmailScreen".hardcoded)),
      body: SingleChildScrollView(child: RegisterWithEmailForm()),
    );
  }
}
