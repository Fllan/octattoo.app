import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/authentication/presentation/controllers/forgot_password_form_controller.dart';
import 'package:octattoo_app/src/authentication/presentation/widgets/forms/forgot_password_form.dart';
import 'package:octattoo_app/src/shared/widgets/async_value_ui.dart';

class ForgotPasswordWidget extends ConsumerStatefulWidget {
  const ForgotPasswordWidget({super.key});

  @override
  ConsumerState<ForgotPasswordWidget> createState() =>
      _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends ConsumerState<ForgotPasswordWidget> {
  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isValidForm = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _validateForm() async {
    final forgotPasswordFormController =
        ref.read(forgotPasswordFormControllerProvider.notifier);
    final isValid = forgotPasswordFormController.formValidator(
      formKey: _key,
      emailField: _emailController.text,
    );
    setState(() {
      _isValidForm = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<void> state =
        ref.watch(forgotPasswordFormControllerProvider);
    ref.listen<AsyncValue>(
      forgotPasswordFormControllerProvider,
      (_, state) {
        state.showSnackbarOnError(context);
        if (!state.isLoading && !state.hasError && state.hasValue) {
          state.showSnackbarOnSuccess(
              context, 'Password reset email sent successfully.'.hardcoded);
          _emailController.clear();
        }
      },
    );
    final forgotPasswordFormController =
        ref.read(forgotPasswordFormControllerProvider.notifier);
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 400,
        child: Form(
          key: _key,
          onChanged: () => _validateForm(),
          child: ForgotPasswordForm(
            emailController: _emailController,
            forgotPasswordFormController: forgotPasswordFormController,
            state: state,
            isValidForm: _isValidForm,
          ),
        ),
      ),
    );
  }
}
