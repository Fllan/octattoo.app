import 'package:flutter/material.dart';

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
