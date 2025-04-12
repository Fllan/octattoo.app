import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_flutter/core/constants/ui/gaps.dart';
import 'package:octattoo_flutter/core/l10n_extensions.dart';
import 'package:octattoo_flutter/core/router/routes/guest_routes.dart';
import 'package:octattoo_flutter/core/shared/components/async_value_ui.dart';
import 'package:octattoo_flutter/core/shared/components/buttons/primary_button.dart';
import 'package:octattoo_flutter/core/shared/components/buttons/tertiary_button.dart';
import 'package:octattoo_flutter/core/shared/components/form_fields/app_text_form_field.dart';
import 'package:octattoo_flutter/core/shared/components/form_fields/password_text_field.dart';
import 'package:octattoo_flutter/core/utils/validation_utils.dart';
import 'package:octattoo_flutter/features/authentication/components/register_with_email_form_controller.dart';

class RegisterWithEmailForm extends ConsumerStatefulWidget {
  const RegisterWithEmailForm({super.key});

  @override
  ConsumerState<RegisterWithEmailForm> createState() =>
      _RegisterWithEmailFormState();
}

class _RegisterWithEmailFormState extends ConsumerState<RegisterWithEmailForm> {
  final key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmedPasswordController = TextEditingController();
  bool isValidForm = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmedPasswordController.dispose();
    super.dispose();
  }

  Future<void> validateForm() async {
    final registerWithEmailFormController =
        ref.read(registerWithEmailFormControllerProvider.notifier);
    final isValid = registerWithEmailFormController.formValidator(
      email: emailController.text,
      password: passwordController.text,
      confirmedPassword: confirmedPasswordController.text,
      formKey: key,
    );

    setState(() {
      isValidForm = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<void> state =
        ref.watch(registerWithEmailFormControllerProvider);

    ref.listen<AsyncValue>(
      registerWithEmailFormControllerProvider,
      (previous, next) async {
        next.showSnackbarOnError(context);
      },
    );

    final registerFormController =
        ref.read(registerWithEmailFormControllerProvider.notifier);

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
                      PasswordTextFormField(
                        controller: passwordController,
                      ),
                      gapH16,
                      PasswordTextFormField(
                        label: 'Confirm password'.hardcoded,
                        controller: confirmedPasswordController,
                        onFieldSubmitted: (_) =>
                            registerFormController.submitEmailForm(
                                email: emailController.text,
                                password: passwordController.text),
                        validator: (value) =>
                            ValidationUtils.confirmPasswordValidator(
                                value, passwordController.text),
                      ),
                      gapH16,
                      Row(
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              icon: const Icon(Icons.app_registration),
                              onPressed: state.isLoading || !isValidForm
                                  ? null
                                  : () =>
                                      registerFormController.submitEmailForm(
                                          email: emailController.text,
                                          password: passwordController.text),
                              label: state.isLoading
                                  ? const CircularProgressIndicator()
                                  : Text('Sign Up'.hardcoded),
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
                              label:
                                  Text('I already have an account'.hardcoded),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
