import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app_mvp/core/constants/gaps.dart';
import 'package:octattoo_app_mvp/core/services/firebase/authentication/authentication_repository.dart';
import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';
import 'package:octattoo_app_mvp/src/shared/validators/email_password_validators.dart';
import 'package:octattoo_app_mvp/src/shared/widgets/app_async_elevated_button.dart';

import '../shared/widgets/app_text_form_field.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isNotEmptyEmail = false;
  bool _isNotEmptyPassword = false;
  bool _isValidForm = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _callback() async {
    if (context.mounted) {
      await ref.watch(authRepositoryProvider).signInWithEmailAndPassword(
            _emailController.text,
            _passwordController.text,
            // ignore: use_build_context_synchronously
            context,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'.hardcoded),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _key,
            onChanged: () {
              _isNotEmptyEmail = _emailController.text.isNotEmpty;
              _isNotEmptyPassword = _passwordController.text.isNotEmpty;

              if (_isNotEmptyEmail && _isNotEmptyPassword) {
                setState(() {
                  _isValidForm = _key.currentState!.validate();
                });
              }
            },
            child: AutofillGroup(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextFormField(
                    autofillHints: const [AutofillHints.email],
                    controller: _emailController,
                    validator: (value) => emailValidator(value),
                    label: 'Email'.hardcoded,
                    keyboardType: TextInputType.emailAddress,
                    hasAutoFocus: true,
                  ),
                  gapH16,
                  PasswordTextFormField(controller: _passwordController),
                  gapH24,
                  if (!_isValidForm)
                    ElevatedButton(
                      onPressed: null,
                      child: Text('Sign in'.hardcoded),
                    ),
                  if (_isValidForm)
                    AppAsyncElevatedButton(
                      callback: _callback,
                      label: 'Sign in'.hardcoded,
                    ),
                  gapH24,
                  TextButton(
                    onPressed: () {
                      context.pushNamed('forgotPassword');
                    },
                    child: Text('Forgot Password?'.hardcoded),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
