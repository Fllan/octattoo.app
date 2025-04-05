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
import 'package:octattoo_flutter/core/shared/components/material_text.dart';
import 'package:octattoo_flutter/core/utils/validation_utils.dart';
import 'package:octattoo_flutter/features/authentication/components/register_form_controller.dart';

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
    final registerFormController =
        ref.read(registerFormControllerProvider.notifier);
    final isValid = registerFormController.formValidator(
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
    final AsyncValue<void> state = ref.watch(registerFormControllerProvider);
    ref.listen<AsyncValue>(
      registerFormControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );
    final registerFormController =
        ref.read(registerFormControllerProvider.notifier);
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
                        onFieldSubmitted: (_) => registerFormController.submit(
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
                                  : () => registerFormController.submit(
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
