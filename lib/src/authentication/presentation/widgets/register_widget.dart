import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/authentication/presentation/controllers/anonymous_register_controller.dart';
import 'package:octattoo_app/src/authentication/presentation/controllers/register_form_controller.dart';
import 'package:octattoo_app/src/authentication/presentation/widgets/forms/email_password_register_form.dart';
import 'package:octattoo_app/src/shared/widgets/async_value_ui.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';
import 'package:octattoo_app/src/shared/widgets/primary_button.dart';

class RegisterWidget extends ConsumerStatefulWidget {
  const RegisterWidget({super.key});

  @override
  ConsumerState<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends ConsumerState<RegisterWidget> {
  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmedPasswordController = TextEditingController();
  bool _isValidForm = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmedPasswordController.dispose();
    super.dispose();
  }

  Future<void> _validateForm() async {
    final registerFormController =
        ref.read(registerFormControllerProvider.notifier);
    final isValid = registerFormController.formValidator(
      emailField: _emailController.text,
      passwordField: _passwordController.text,
      confirmedPasswordField: _confirmedPasswordController.text,
      formKey: _key,
    );

    setState(() {
      _isValidForm = isValid;
    });
  }

  void _showAnonymousAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Start as Guest'.hardcoded),
          content: SizedBox(
            width: 700,
            child: Text(
                "If you start as a guest, your account will be linked to this device, and you won't be able to sign in from another device. Would you like to proceed or register using an email and password?"
                    .hardcoded),
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: Text('Cancel'.hardcoded),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _startAsGuest();
              },
              child: Text('Stay Anonymous'.hardcoded),
            ),
          ],
        );
      },
    );
  }

  Future<void> _startAsGuest() async {
    final anonymousRegisterController =
        ref.read(anonymousRegisterControllerProvider.notifier);
    await anonymousRegisterController.registerAnonymously();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<void> stateRegisterForm =
        ref.watch(registerFormControllerProvider);
    final AsyncValue<void> stateRegisterAnon =
        ref.watch(anonymousRegisterControllerProvider);
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
              MaterialText.titleLarge(context.loc.register, context),
              gapH32,
              Align(
                alignment: AlignmentDirectional.topStart,
                child: MaterialText.bodyMedium(
                  'Discover the app anonymously without giving us any of your info. '
                          'You can decide later to create an account.'
                      .hardcoded,
                  context,
                ),
              ),
              gapH16,
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      icon: const Icon(Icons.psychology_alt),
                      onPressed: stateRegisterAnon.isLoading
                          ? null
                          : () => _showAnonymousAlertDialog(context),
                      label: stateRegisterAnon.isLoading
                          ? const CircularProgressIndicator()
                          : Text('Register anonymously'.hardcoded),
                    ),
                  ),
                ],
              ),
              gapH32,
              const Divider(),
              gapH32,
              Form(
                key: _key,
                onChanged: () => _validateForm(),
                child: EmailPasswordRegisterForm(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  confirmedPasswordController: _confirmedPasswordController,
                  registerFormController: registerFormController,
                  state: stateRegisterForm,
                  isValidForm: _isValidForm,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
