import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/authentication/data/firebase_auth_repository.dart';
import 'package:octattoo_app/src/shared/widgets/app_text_form_field.dart';
import 'package:octattoo_app/src/shared/widgets/async_button.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';
import 'package:octattoo_app/src/shared/validators/email_validators.dart';
import 'package:octattoo_app/src/shared/widgets/password_text_form_field.dart';

class OldRegisterWidget extends ConsumerStatefulWidget {
  const OldRegisterWidget({super.key});

  @override
  ConsumerState<OldRegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends ConsumerState<OldRegisterWidget> {
  final GlobalKey<FormState> _key = GlobalKey();
  final _confirmedPasswordKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmedPasswordController = TextEditingController();
  bool _isNotEmptyEmail = false;
  bool _isNotEmptyPassword = false;
  bool _isNotEmptyConfirmedPassword = false;
  bool _isValidForm = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmedPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signInCallback() async {
    await ref.read(authRepositoryProvider).signInAnonymously();
  }

  Future<void> _signUpCallback() async {
    if (context.mounted) {
      await ref.read(authRepositoryProvider).createUserWithEmailAndPassword(
            _emailController.text,
            _passwordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    String buttonLable = 'Sign Up'.hardcoded;
    return Align(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 250,
          maxWidth: 400,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialText.titleLarge('Register'.hardcoded, context),
              gapH64,
              Text(
                  'You can discover the app anonymously and decide later to create an account'
                      .hardcoded,
                  textAlign: TextAlign.left),
              gapH20,
              AsyncButton.elevated(
                callback: _signInCallback,
                label: 'Start as Guest'.hardcoded,
              ),
              gapH32,
              const Divider(),
              gapH32,
              Form(
                key: _key,
                onChanged: () {
                  _isNotEmptyEmail = _emailController.text.isNotEmpty;
                  _isNotEmptyPassword = _passwordController.text.isNotEmpty;
                  _isNotEmptyConfirmedPassword =
                      _confirmedPasswordController.text.isNotEmpty;

                  if (_isNotEmptyEmail &&
                      _isNotEmptyPassword &&
                      _isNotEmptyConfirmedPassword) {
                    setState(() {
                      _isValidForm = _key.currentState!.validate();
                    });
                  }
                },
                child: Column(
                  children: [
                    Text('Or sign up with your email:'.hardcoded),
                    gapH20,
                    AppTextFormField(
                      controller: _emailController,
                      validator: (value) => emailValidator(value),
                      label: 'Email'.hardcoded,
                      keyboardType: TextInputType.emailAddress,
                      hasAutoFocus: false,
                    ),
                    gapH20,
                    PasswordTextFormField(controller: _passwordController),
                    gapH20,
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _confirmedPasswordKey,
                      controller: _confirmedPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: 'Confirm password'.hardcoded,
                        border: const OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return 'Passwords do not match'.hardcoded;
                        }
                        return null;
                      },
                    ),
                    gapH20,
                    if (!_isValidForm)
                      ElevatedButton(
                        onPressed: null,
                        child: Text(buttonLable),
                      ),
                    if (_isValidForm)
                      AsyncButton.elevated(
                        callback: _signUpCallback,
                        label: buttonLable,
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
