import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:octattoo_app/src/authentication/presentation/controllers/sign_in_form_controller.dart';
import 'package:octattoo_app/src/authentication/presentation/widgets/sign_in_form.dart';
import 'package:octattoo_app/src/shared/widgets/async_value_ui.dart';

class SignInWidget extends ConsumerStatefulWidget {
  const SignInWidget({super.key});

  @override
  ConsumerState<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends ConsumerState<SignInWidget> {
  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isValidForm = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _validateForm() async {
    final signInFormController =
        ref.read(signInFormControllerProvider.notifier);
    final isValid = signInFormController.formValidator(
      formKey: _key,
      emailField: _emailController.text,
      passwordField: _passwordController.text,
    );

    setState(() {
      _isValidForm = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<void> state = ref.watch(signInFormControllerProvider);
    ref.listen<AsyncValue>(
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
          key: _key,
          onChanged: () => _validateForm(),
          child: SignInForm(
            emailController: _emailController,
            passwordController: _passwordController,
            signInFormController: signInFormController,
            state: state,
            isValidForm: _isValidForm,
          ),
        ),
      ),
    );
  }
}
