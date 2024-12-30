import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/step_2_controller.dart';
import 'package:octattoo_app/src/shared/validators/default_3_char_validator.dart';
import 'package:octattoo_app/src/shared/widgets/app_text_form_field.dart';
import 'package:octattoo_app/src/shared/widgets/buttons/custom_buttons.dart';
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
        onChanged: step2Controller.validateForm,
        key: step2Controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialText.labelLarge(
                  'Create new workplace'.hardcoded, context),
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
              gapH8,
              MaterialText.bodyMedium(
                  'As manager of the workplace, you will be able to add photos and details about the place later.'
                      .hardcoded,
                  context),
              gapH32,
              MaterialText.labelLarge('Address'.hardcoded, context),
              gapH8,
              AppTextFormField(
                controller: step2Controller.streetController,
                validator: (value) => default3CharValidator(
                    value, 'Please enter a street name'.hardcoded),
                label: 'Street'.hardcoded,
                keyboardType: TextInputType.streetAddress,
                hasAutoFocus: false,
              ),
              gapH8,
              Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      controller: step2Controller.cityController,
                      validator: (value) => default3CharValidator(
                          value, 'Please enter a city name'.hardcoded),
                      label: 'City'.hardcoded,
                      keyboardType: TextInputType.streetAddress,
                      hasAutoFocus: false,
                    ),
                  ),
                  gapW8,
                  Expanded(
                    child: AppTextFormField(
                      controller: step2Controller.provinceController,
                      validator: (value) => default3CharValidator(
                          value, 'Please enter a province name'.hardcoded),
                      label: 'Province'.hardcoded,
                      keyboardType: TextInputType.streetAddress,
                      hasAutoFocus: false,
                    ),
                  ),
                ],
              ),
              gapH8,
              Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      controller: step2Controller.countryController,
                      validator: (value) => default3CharValidator(
                          value, 'Please enter a country name'.hardcoded),
                      label: 'Country'.hardcoded,
                      keyboardType: TextInputType.streetAddress,
                      hasAutoFocus: false,
                    ),
                  ),
                  gapW8,
                  Expanded(
                    child: AppTextFormField(
                      controller: step2Controller.postalCodeController,
                      validator: (value) => default3CharValidator(
                          value, 'Please enter a postal code'.hardcoded),
                      label: 'Postal Code'.hardcoded,
                      keyboardType: TextInputType.streetAddress,
                      hasAutoFocus: false,
                    ),
                  ),
                ],
              ),
              gapH32,
              Row(
                children: [
                  TertiaryButton(
                    label: Text('Cancel'.hardcoded),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  gapW24,
                  PrimaryButton(
                    label: Text('Save'.hardcoded),
                    onPressed: state.isValidForm
                        ? () => step2Controller.saveNewWorkplaceForm()
                        : null,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
