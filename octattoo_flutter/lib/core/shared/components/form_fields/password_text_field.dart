import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/l10n_extensions.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    super.key,
    required TextEditingController controller,
    this.label,
    this.validator,
    this.onFieldSubmitted,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String? label;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

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
        labelText: label ?? 'Password'.hardcoded,
        border: const OutlineInputBorder(),
      ),
      obscureText: true,
      validator: validator,
    );
  }
}
