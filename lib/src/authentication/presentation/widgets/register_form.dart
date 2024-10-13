import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/authentication/presentation/controllers/register_form_controller.dart';
import 'package:octattoo_app/src/shared/validators/confirmed_password_validator.dart';
import 'package:octattoo_app/src/shared/validators/email_validator.dart';
import 'package:octattoo_app/src/shared/widgets/app_text_form_field.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';
import 'package:octattoo_app/src/shared/widgets/password_text_form_field.dart';
import 'package:octattoo_app/src/shared/widgets/primary_button.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController confirmedPasswordController,
    required this.registerFormController,
    required this.state,
    required bool isValidForm,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        _confirmedPasswordController = confirmedPasswordController,
        _isValidForm = isValidForm;

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _confirmedPasswordController;
  final RegisterFormController registerFormController;
  final AsyncValue<void> state;
  final bool _isValidForm;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        MaterialText.bodyMedium(
            'Or sign up with your email:'.hardcoded, context),
        gapH16,
        AppTextFormField(
          controller: _emailController,
          validator: (value) => emailValidator(value),
          label: 'Email'.hardcoded,
          keyboardType: TextInputType.emailAddress,
          hasAutoFocus: false,
        ),
        gapH16,
        PasswordTextFormField(
          controller: _passwordController,
        ),
        gapH16,
        PasswordTextFormField(
          label: 'Confirm password'.hardcoded,
          controller: _confirmedPasswordController,
          onFieldSubmitted: (_) => registerFormController.submit(
              email: _emailController.text, password: _passwordController.text),
          validator: (value) =>
              confirmPasswordValidator(value, _passwordController.text),
        ),
        gapH16,
        Row(
          children: [
            Expanded(
              child: PrimaryButton(
                icon: const Icon(Icons.app_registration),
                onPressed: state.isLoading || !_isValidForm
                    ? null
                    : () => registerFormController.submit(
                        email: _emailController.text,
                        password: _passwordController.text),
                label: state.isLoading
                    ? const CircularProgressIndicator()
                    : Text('Sign Up'.hardcoded),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
