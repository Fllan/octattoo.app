import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/constants/workplace_types.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/step_2_controller.dart';
import 'package:octattoo_app/src/onboarding/presentation/widgets/availabilities_week_day.dart';
import 'package:octattoo_app/src/onboarding/presentation/widgets/selected_option_card.dart';
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
        Wrap(
          children: [
            SelectedOptionCard(
              onPressed: () => ref
                  .read(step2ControllerProvider.notifier)
                  .setWorkplaceType(null),
              iconData: state.workplaceType! == WorkplaceTypes.guest
                  ? Icons.work_history_outlined
                  : Icons.store,
              title: state.workplaceType! == WorkplaceTypes.guest
                  ? 'Guest'.hardcoded
                  : 'Permanent'.hardcoded,
              hasSubTitle: false,
            ),
            SelectedOptionCard(
              iconData: Icons.store,
              title: state.workplace!.name,
              hasSubTitle: true,
              subTitle:
                  '${state.workplace!.city} - ${state.workplace!.country}',
              onPressed: () =>
                  ref.read(step2ControllerProvider.notifier).setWorkplace(null),
            ),
          ],
        ),
        gapH32,
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                title: Text('No end date'.hardcoded),
                controlAffinity: ListTileControlAffinity.leading,
                value: state.hasNoEndDate,
                onChanged: (value) => step2Controller.toggleNoEndDate(),
              ),
              gapH16,
              MaterialText.labelLarge(
                  "For permanent workplace, your availabilities are set on a \"common\" week for each day"
                      .hardcoded,
                  context),
              gapH32,
              AvailabilitiesWeekDay(),
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

  Widget buildWorkplaceTypeCard(
      WorkplaceTypes workplaceType, BuildContext context, WidgetRef ref) {
    switch (workplaceType) {
      case WorkplaceTypes.guest:
        return SelectedOptionCard(
          onPressed: () =>
              ref.read(step2ControllerProvider.notifier).setWorkplaceType(null),
          iconData: Icons.work_history_outlined,
          title: 'Guest'.hardcoded,
          hasSubTitle: false,
        );
      case WorkplaceTypes.permanent:
        return SelectedOptionCard(
          onPressed: () =>
              ref.read(step2ControllerProvider.notifier).setWorkplaceType(null),
          iconData: Icons.storefront_outlined,
          title: 'Permanent'.hardcoded,
          hasSubTitle: false,
        );
    }
  }
}
