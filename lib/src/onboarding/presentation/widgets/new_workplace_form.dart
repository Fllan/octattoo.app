import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/step_2_controller.dart';
import 'package:octattoo_app/src/shared/validators/default_3_char_validator.dart';
import 'package:octattoo_app/src/shared/widgets/app_text_form_field.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';

class NewWorkplaceForm extends ConsumerWidget {
  const NewWorkplaceForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step2Controller = ref.read(step2ControllerProvider.notifier);
    final state = ref.watch(step2ControllerProvider);
    return SizedBox(
      width: 400,
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialText.titleLarge('Create new workplace'.hardcoded, context),
            gapH32,
            AppTextFormField(
              controller: step2Controller.workplaceNameController,
              validator: (value) => default3CharValidator(
                  value, 'Please enter a name for the workplace'.hardcoded),
              label: 'Workplace name'.hardcoded,
              keyboardType: TextInputType.text,
              hasAutoFocus: true,
            ),
            gapH8,
            SwitchListTile(
              value: state.isManager,
              onChanged: (_) => step2Controller.toggleManager(),
              title: MaterialText.bodyLarge('I manage this place', context),
            ),
            gapH16,
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
