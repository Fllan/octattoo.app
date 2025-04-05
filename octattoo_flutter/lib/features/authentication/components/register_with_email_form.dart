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

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
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

    // ref.listen<AsyncValue>(
    //   registerWithEmailFormControllerProvider,
    //   (_, state) => state.showSnackbarOnError(context),
    // );
    ref.listen<AsyncValue>(
      registerWithEmailFormControllerProvider,
      (previous, next) async {
        next.showSnackbarOnError(context);

        if (previous?.isLoading == true && next.hasError == false) {
          await showDialog(
            context: context,
            builder: (context) => EmailValidationDialog(
              email: emailController.text,
              password: passwordController.text,
            ),
          );
        }
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

class EmailValidationDialog extends ConsumerWidget {
  final String email;
  final String password;

  const EmailValidationDialog({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codeController = TextEditingController();
    final registerFormController =
        ref.read(registerWithEmailFormControllerProvider.notifier);
    // Watch the state for the validation step
    final AsyncValue<void> state =
        ref.watch(registerWithEmailFormControllerProvider);

    return AlertDialog(
      title: Text('Enter Verification Code'.hardcoded),
      content: AppTextFormField(
        controller: codeController,
        validator: (_) => null,
        label: "Code".hardcoded,
        keyboardType: TextInputType.text,
        hasAutoFocus: true,
      ),
      actions: [
        TertiaryButton(
          label: Text("Cancel".hardcoded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        PrimaryButton(
          icon: const Icon(Icons.how_to_reg),
          label: state.isLoading
              ? const CircularProgressIndicator()
              : Text("Verify email".hardcoded),
          onPressed: state.isLoading
              ? null
              : () async {
                  final code = codeController.text.trim();
                  await registerFormController.submitValidationCode(
                    email: email,
                    password: password,
                    verificationCode: code,
                  );
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
        ),
      ],
    );
  }
}
