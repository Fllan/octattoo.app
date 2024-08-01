import 'package:flutter/material.dart';
import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';
import 'package:octattoo_app_mvp/src/shared/validators/form_validators.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required TextEditingController controller,
    required this.validator,
    required this.label,
    required this.keyboardType,
    this.autofillHints,
    required this.hasAutoFocus,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String? Function(String?) validator;
  final String label;
  final TextInputType keyboardType;
  final List<String>? autofillHints;
  final bool hasAutoFocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: hasAutoFocus,
      autofillHints: autofillHints,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) => validator(value),
    );
  }
}

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      autofillHints: const <String>[AutofillHints.password],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _controller,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: 'Password'.hardcoded,
        border: const OutlineInputBorder(),
      ),
      obscureText: true,
      validator: (value) => passwordValidator(value),
    );
  }
}
