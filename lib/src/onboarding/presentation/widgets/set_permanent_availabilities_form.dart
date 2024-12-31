import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/step_2_controller.dart';
import 'package:octattoo_app/src/shared/widgets/app_text_form_field.dart';
import 'package:octattoo_app/src/shared/widgets/buttons/custom_buttons.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';

class SetPermanentAvailabilitiesForm extends ConsumerWidget {
  const SetPermanentAvailabilitiesForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step2Controller = ref.read(step2ControllerProvider.notifier);
    final state = ref.watch(step2ControllerProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Card(
              child: SizedBox(
                width: 150,
                height: 50,
              ),
            ),
            gapW24,
            IconButton.outlined(
              onPressed: () =>
                  ref.read(step2ControllerProvider.notifier).setWorkplace(null),
              icon: Icon(Icons.cancel),
            ),
          ],
        ),
        gapH12,
        MaterialText.titleLarge(
            'Availabilities @${ref.watch(step2ControllerProvider).workplace!.name}'
                .hardcoded,
            context),
        gapH16,
        MaterialText.labelLarge(
            "Let's set your availabilities for this permanent workplace"
                .hardcoded,
            context),
        gapH32,
        Form(
          child: Column(
            children: [
              AppTextFormField(
                controller: step2Controller.startDate,
                validator: (value) {
                  return null;
                },
                label: 'Start date'.hardcoded,
                hasAutoFocus: false,
                keyboardType: TextInputType.datetime,
              ),
              Visibility(
                visible: !state.hasNoEndDate,
                child: Column(
                  children: [
                    gapH8,
                    AppTextFormField(
                      controller: step2Controller.endDate,
                      validator: (value) {
                        return null;
                      },
                      label: 'End date'.hardcoded,
                      hasAutoFocus: false,
                      keyboardType: TextInputType.datetime,
                    ),
                  ],
                ),
              ),
              gapH8,
              SwitchListTile(
                title: Text('I want to show my real name'.hardcoded),
                controlAffinity: ListTileControlAffinity.leading,
                value: state.hasNoEndDate,
                onChanged: (value) => step2Controller.toggleNoEndDate(),
              ),
            ],
          ),
        ),
        //! for development only
        const Divider(),
        gapH64,
        TertiaryButton(
          label: const Text('Reset type selection'),
          onPressed: () =>
              ref.read(step2ControllerProvider.notifier).setWorkplaceType(null),
        ),
        TertiaryButton(
          label: const Text('Reset workplace selection'),
          onPressed: () =>
              ref.read(step2ControllerProvider.notifier).setWorkplace(null),
        ),
        //! for development only
      ],
    );
  }
}
