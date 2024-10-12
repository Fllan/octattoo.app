import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/authentication/presentation/controllers/sign_in_form_controller.dart';
import 'package:octattoo_app/src/shared/validators/email_validators.dart';
import 'package:octattoo_app/src/shared/widgets/app_text_form_field.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';
import 'package:octattoo_app/src/shared/widgets/password_text_form_field.dart';
import 'package:octattoo_app/src/shared/widgets/primary_button.dart';
import 'package:octattoo_app/src/shared/widgets/tertiary_button.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.signInFormController,
    required this.state,
    required bool isValidForm,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        _isValidForm = isValidForm;

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final SignInFormController signInFormController;
  final AsyncValue<void> state;
  final bool _isValidForm;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        MaterialText.titleLarge(context.loc.signIn, context),
        gapH32,
        AppTextFormField(
          controller: _emailController,
          validator: (value) => emailValidator(value),
          label: 'Email'.hardcoded,
          keyboardType: TextInputType.emailAddress,
          hasAutoFocus: true,
        ),
        gapH16,
        PasswordTextFormField(
          controller: _passwordController,
          onFieldSubmitted: (_) => signInFormController.submit(
              email: _emailController.text, password: _passwordController.text),
        ),
        gapH16,
        Row(
          children: [
            Expanded(
              child: PrimaryButton(
                icon: const Icon(Icons.login),
                onPressed: state.isLoading || !_isValidForm
                    ? null
                    : () => signInFormController.submit(
                        email: _emailController.text,
                        password: _passwordController.text),
                label: state.isLoading
                    ? const CircularProgressIndicator()
                    : Text('Sign In'.hardcoded),
              ),
            ),
          ],
        ),
        gapH16,
        Row(
          children: [
            Expanded(
              child: TertiaryButton(
                onPressed: () => context.goNamed('forgot-password'),
                label: Text('Retrieve my password'.hardcoded),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
