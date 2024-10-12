import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/authentication/presentation/controllers/forgot_password_form_controller.dart';
import 'package:octattoo_app/src/shared/validators/email_validators.dart';
import 'package:octattoo_app/src/shared/widgets/app_text_form_field.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';
import 'package:octattoo_app/src/shared/widgets/primary_button.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({
    super.key,
    required TextEditingController emailController,
    required this.forgotPasswordFormController,
    required this.state,
    required bool isValidForm,
  })  : _emailController = emailController,
        _isValidForm = isValidForm;

  final TextEditingController _emailController;
  final ForgotPasswordFormController forgotPasswordFormController;
  final AsyncValue<void> state;
  final bool _isValidForm;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        MaterialText.titleLarge(context.loc.forgotPassword, context),
        gapH32,
        AppTextFormField(
          controller: _emailController,
          validator: (value) => emailValidator(value),
          label: 'Email'.hardcoded,
          keyboardType: TextInputType.emailAddress,
          hasAutoFocus: true,
        ),
        gapH16,
        Align(
          alignment: AlignmentDirectional.topStart,
          child: MaterialText.bodyMedium(
            'Even if your email is not known by us, you will receive a successful response. '
                    'This is due to security settings protecting user enumeration.'
                .hardcoded,
            context,
          ),
        ),
        gapH16,
        Row(
          children: [
            Expanded(
              child: PrimaryButton(
                icon: const Icon(Icons.send),
                onPressed: state.isLoading || !_isValidForm
                    ? null
                    : () => forgotPasswordFormController.submit(
                        email: _emailController.text),
                label: state.isLoading
                    ? const CircularProgressIndicator()
                    : Text('Send reset link'.hardcoded),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
