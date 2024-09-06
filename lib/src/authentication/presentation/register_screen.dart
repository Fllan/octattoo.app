import 'package:flutter/material.dart';
import 'package:octattoo_app/core/layouts/app_pane.dart';
import 'package:octattoo_app/src/authentication/presentation/widgets/register_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPane(child: RegisterWidget());
  }
}
