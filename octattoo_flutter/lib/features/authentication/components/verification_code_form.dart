import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_flutter/core/constants/ui/gaps.dart';
import 'package:octattoo_flutter/core/l10n_extensions.dart';
import 'package:octattoo_flutter/core/shared/components/async_value_ui.dart';
import 'package:octattoo_flutter/core/shared/components/buttons/primary_button.dart';
import 'package:octattoo_flutter/core/shared/components/form_fields/app_text_form_field.dart';
import 'package:octattoo_flutter/core/utils/validation_utils.dart';
import 'package:octattoo_flutter/features/authentication/components/verification_code_form_controller.dart';

class VerificationCodeForm extends ConsumerStatefulWidget {
  const VerificationCodeForm({super.key});

  @override
  ConsumerState<VerificationCodeForm> createState() =>
      _VerificationCodeFormState();
}

class _VerificationCodeFormState extends ConsumerState<VerificationCodeForm> {
  final formKey = GlobalKey<FormState>();
  final codeController = TextEditingController();
  bool isValidForm = false;

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  Future<void> validateForm() async {
    final verificationCodeFormController =
        ref.read(verificationCodeFormControllerProvider.notifier);
    final isValid = verificationCodeFormController.formValidator(
      code: codeController.text,
      formKey: formKey,
    );

    setState(() {
      isValidForm = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(verificationCodeFormControllerProvider);
    ref.listen(
      verificationCodeFormControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );

    final verificationCodeFormController =
        ref.read(verificationCodeFormControllerProvider.notifier);

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
                label: "Verification code".hardcoded,
                controller: codeController,
                validator: ValidationUtils.verificationCodeValidator,
                keyboardType: TextInputType.text,
                hasAutoFocus: true,
              ),
              gapH16,
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      icon: const Icon(Icons.safety_check),
                      onPressed: state.isLoading || !isValidForm
                          ? null
                          : () => verificationCodeFormController.submit(
                              verificationCode: codeController.text),
                      label: state.isLoading
                          ? const CircularProgressIndicator()
                          : Text('Verify your email'.hardcoded),
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
