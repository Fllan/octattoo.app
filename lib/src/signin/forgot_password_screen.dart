import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app_mvp/core/constants/gaps.dart';
import 'package:octattoo_app_mvp/core/services/firebase/authentication/authentication_repository.dart';
import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';
import 'package:octattoo_app_mvp/src/shared/validators/email_password_validators.dart';
import 'package:octattoo_app_mvp/src/shared/widgets/app_async_elevated_button.dart';
import 'package:octattoo_app_mvp/src/shared/widgets/app_text_form_field.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final GlobalKey<FormState> _key = GlobalKey();
  final _emailController = TextEditingController();
  bool _isNotEmptyEmail = false;
  bool _isValidForm = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _callback() async {
    return await ref
        .watch(authRepositoryProvider)
        .sendPasswordResetEmail(_emailController.text, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot password'.hardcoded),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          onChanged: () {
            _isNotEmptyEmail = _emailController.text.isNotEmpty;
            if (_isNotEmptyEmail) {
              setState(() {
                _isValidForm = _key.currentState!.validate();
              });
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Please fill out your email below in order to receive a reset password link.'
                    .hardcoded,
              ),
              gapH20,
              AppTextFormField(
                controller: _emailController,
                validator: emailValidator,
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                hasAutoFocus: true,
              ),
              gapH20,
              if (!_isValidForm)
                ElevatedButton(
                  onPressed: null,
                  child: Text('Send reset link'.hardcoded),
                ),
              if (_isValidForm)
                AppAsyncElevatedButton(
                  callback: _callback,
                  label: 'Send reset link'.hardcoded,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
