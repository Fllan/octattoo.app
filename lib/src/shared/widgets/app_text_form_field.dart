import 'package:flutter/material.dart';
import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';
import 'package:octattoo_app_mvp/src/shared/validators/email_password_validators.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required TextEditingController controller,
    required this.validator,
    required this.label,
    required this.keyboardType,
    this.autofillHints,
    this.maxLength,
    required this.hasAutoFocus,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String? Function(String?) validator;
  final String label;
  final TextInputType keyboardType;
  final List<String>? autofillHints;
  final int? maxLength;
  final bool hasAutoFocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
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
  const PasswordTextFormField(
      {super.key,
      required TextEditingController controller,
      this.onFieldSubmitted})
      : _controller = controller;

  final TextEditingController _controller;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
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
