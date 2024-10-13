import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/authentication/presentation/controllers/anonymous_register_controller.dart';
import 'package:octattoo_app/src/authentication/presentation/controllers/register_form_controller.dart';
import 'package:octattoo_app/src/authentication/presentation/widgets/register_form.dart';
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
  final bool _isValidForm = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmedPasswordController.dispose();
    super.dispose();
  }

  Future<void> _validateForm() async {}

  @override
  Widget build(BuildContext context) {
    final AsyncValue<void> state = ref.watch(registerFormControllerProvider);
    ref.listen<AsyncValue>(
      registerFormControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );
    final registerFormController =
        ref.read(registerFormControllerProvider.notifier);
    final anonymousRegisterController =
        ref.read(anonymousRegisterControllerProvider.notifier);
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 400,
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
            PrimaryButton(
              label: Text('Register anonymously'.hardcoded),
              onPressed: () =>
                  anonymousRegisterController.registerAnonymously(),
              icon: const Icon(Icons.fingerprint),
            ),
            gapH32,
            const Divider(),
            gapH32,
            Form(
              key: _key,
              onChanged: () => _validateForm(),
              child: RegisterForm(
                emailController: _emailController,
                passwordController: _passwordController,
                confirmedPasswordController: _confirmedPasswordController,
                registerFormController: registerFormController,
                state: state,
                isValidForm: _isValidForm,
              ),
            )
          ],
        ),
      ),
    );
  }
}
