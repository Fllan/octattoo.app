import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_flutter/core/constants/ui/gaps.dart';
import 'package:octattoo_flutter/core/l10n_extensions.dart';
import 'package:octattoo_flutter/core/router/routes/guest_routes.dart';
import 'package:octattoo_flutter/core/shared/components/async_value_ui.dart';
import 'package:octattoo_flutter/core/shared/components/buttons/primary_button.dart';
import 'package:octattoo_flutter/core/shared/components/buttons/tertiary_button.dart';
import 'package:octattoo_flutter/core/shared/components/form_fields/app_text_form_field.dart';
import 'package:octattoo_flutter/core/utils/validation_utils.dart';
import 'package:octattoo_flutter/features/authentication/components/password_reset_request_form_controller.dart';

class PasswordResetRequestForm extends ConsumerStatefulWidget {
  const PasswordResetRequestForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResetPasswordFormState();
}

class _ResetPasswordFormState extends ConsumerState<PasswordResetRequestForm> {
  final key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  bool isValidForm = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> validateForm() async {
    final resetPasswordFormController =
        ref.read(passwordResetRequestFormControllerProvider.notifier);
    final isValid = resetPasswordFormController.formValidator(
      email: emailController.text,
      formKey: key,
    );

    setState(() {
      isValidForm = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<void> state =
        ref.watch(passwordResetRequestFormControllerProvider);

    ref.listen<AsyncValue>(
      passwordResetRequestFormControllerProvider,
      (previous, next) async {
        next.showSnackbarOnError(context);
      },
    );

    final resetPasswordFormController =
        ref.read(passwordResetRequestFormControllerProvider.notifier);

    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 400,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: key,
                onChanged: () => validateForm(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    gapH32,
                    AppTextFormField(
                      controller: emailController,
                      validator: ValidationUtils.emailValidator,
                      label: 'Email'.hardcoded,
                      keyboardType: TextInputType.emailAddress,
                      hasAutoFocus: true,
                    ),
                    gapH16,
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            icon: const Icon(Icons.app_registration),
                            onPressed: state.isLoading || !isValidForm
                                ? null
                                : () => resetPasswordFormController
                                    .submitPasswordResetForm(
                                        email: emailController.text),
                            label: state.isLoading
                                ? const CircularProgressIndicator()
                                : Text('Send password reset email'.hardcoded),
                          ),
                        ),
                      ],
                    ),
                    gapH16,
                    Row(
                      children: [
                        Expanded(
                          child: TertiaryButton(
                            onPressed: () =>
                                context.goNamed(GuestRoutes.signIn.name),
                            label: Text('I know my password'.hardcoded),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
