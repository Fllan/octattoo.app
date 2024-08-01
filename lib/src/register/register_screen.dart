import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app_mvp/core/constants/gaps.dart';
import 'package:octattoo_app_mvp/core/services/firebase/authentication/authentication_repository.dart';
import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';
import 'package:octattoo_app_mvp/src/shared/validators/form_validators.dart';
import 'package:octattoo_app_mvp/src/shared/widgets/app_async_elevated_button.dart';
import 'package:octattoo_app_mvp/src/shared/widgets/app_text_form_field.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
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
    return await ref.read(authRepositoryProvider).signInAnonymously();
  }

  Future<void> _signUpCallback() async {
    return await ref
        .read(authRepositoryProvider)
        .createUserWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
          context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Register'.hardcoded),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'You can discover the app anonymously and decide later to create an account'
                        .hardcoded,
                    textAlign: TextAlign.left),
                gapH20,
                AppAsyncElevatedButton(
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
                      const Text('Or sign up with your email:',
                          style: TextStyle(fontSize: 16)),
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
                          child: Text('Sign Up'.hardcoded),
                        ),
                      if (_isValidForm)
                        AppAsyncElevatedButton(
                          callback: _signUpCallback,
                          label: 'Sign Up'.hardcoded,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
