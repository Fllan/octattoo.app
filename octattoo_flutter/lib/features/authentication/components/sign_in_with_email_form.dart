import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_flutter/core/constants/ui/gaps.dart';
import 'package:octattoo_flutter/core/l10n_extensions.dart';
import 'package:octattoo_flutter/core/router/routes/guest_routes.dart';
import 'package:octattoo_flutter/core/shared/components/async_value_ui.dart';
import 'package:octattoo_flutter/core/shared/components/buttons/primary_button.dart';
import 'package:octattoo_flutter/core/shared/components/buttons/secondary_button.dart';
import 'package:octattoo_flutter/core/shared/components/buttons/tertiary_button.dart';
import 'package:octattoo_flutter/core/shared/components/form_fields/password_text_field.dart';
import 'package:octattoo_flutter/core/utils/validation_utils.dart';
import 'package:octattoo_flutter/core/shared/components/form_fields/app_text_form_field.dart';
import 'package:octattoo_flutter/features/authentication/components/sign_in_form_controller.dart';

class SignInWithEmailForm extends ConsumerStatefulWidget {
  const SignInWithEmailForm({super.key});

  @override
  ConsumerState<SignInWithEmailForm> createState() =>
      _SignInWithEmailFormState();
}

class _SignInWithEmailFormState extends ConsumerState<SignInWithEmailForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isValidForm = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> validateForm() async {
    final signInFormController =
        ref.read(signInFormControllerProvider.notifier);
    final isValid = signInFormController.formValidator(
      formKey: formKey,
      emailField: emailController.text,
      passwordField: passwordController.text,
    );

    setState(() {
      isValidForm = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signInFormControllerProvider);
    ref.listen(
      signInFormControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );

    final signInFormController =
        ref.read(signInFormControllerProvider.notifier);

    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 400,
        child: Form(
          key: formKey,
          onChanged: () => validateForm(),
          child: Column(
            children: [
              gapH32,
              AppTextFormField(
                label: "Email address".hardcoded,
                controller: emailController,
                validator: ValidationUtils.emailValidator,
                keyboardType: TextInputType.emailAddress,
                hasAutoFocus: true,
              ),
              gapH16,
              PasswordTextFormField(
                validator: ValidationUtils.passwordValidator,
                controller: passwordController,
                onFieldSubmitted: (_) => {},
              ),
              gapH32,
              gapH16,
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      icon: const Icon(Icons.login),
                      onPressed: state.isLoading || !isValidForm
                          ? null
                          : () => signInFormController.submit(
                              email: emailController.text,
                              password: passwordController.text),
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
                      onPressed: () =>
                          context.goNamed(GuestRoutes.forgotPassword.name),
                      label: Text('Retrieve my password'.hardcoded),
                    ),
                  ),
                ],
              ),
              gapH64,
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () =>
                          context.goNamed(GuestRoutes.register.name),
                      label: Text("I don't have an account".hardcoded),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
