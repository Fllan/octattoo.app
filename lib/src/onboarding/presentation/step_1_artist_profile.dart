import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/step_1_controller.dart';
import 'package:octattoo_app/src/shared/validators/default_3_char_validator.dart';
import 'package:octattoo_app/src/shared/widgets/app_text_form_field.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';

class Step1ArtistProfile extends ConsumerWidget {
  const Step1ArtistProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(step1ControllerProvider);
    final step1Controller = ref.read(step1ControllerProvider.notifier);
    const keyboardType = TextInputType.name;
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Form(
        onChanged: step1Controller.validateForm,
        key: step1Controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialText.labelLarge(
                'Let\'s set the basics of your public artist identity'
                    .hardcoded,
                context),
            gapH32,
            AppTextFormField(
              controller: step1Controller.artistNameController,
              validator: (value) => default3CharValidator(
                  value, 'Please enter your artist name'.hardcoded),
              label: 'Your artist name'.hardcoded,
              keyboardType: keyboardType,
              hasAutoFocus: true,
            ),
            gapH16,
            SwitchListTile(
              title: Text('I want to show my real name'.hardcoded),
              controlAffinity: ListTileControlAffinity.leading,
              value: state.realNameIsVisible,
              onChanged: (value) => step1Controller.toggleRealName(),
            ),
            Visibility(
              visible: state.realNameIsVisible,
              child: Column(
                children: [
                  gapH16,
                  AppTextFormField(
                    controller: step1Controller.realNameController,
                    validator: (value) => state.realNameIsVisible
                        ? default3CharValidator(
                            value, 'Please enter your real name'.hardcoded)
                        : null,
                    label: 'Real name'.hardcoded,
                    keyboardType: keyboardType,
                    hasAutoFocus: false,
                  ),
                ],
              ),
            ),
            gapH16,
            SwitchListTile(
              title: Text('I want to show my pronoun'.hardcoded),
              controlAffinity: ListTileControlAffinity.leading,
              value: state.pronounIsVisible,
              onChanged: (value) => step1Controller.togglePronoun(),
            ),
            Visibility(
              visible: state.pronounIsVisible,
              child: Column(
                children: [
                  gapH16,
                  AppTextFormField(
                    controller: step1Controller.pronounController,
                    validator: (value) => state.pronounIsVisible
                        ? default3CharValidator(
                            value, 'Please enter your pronoun'.hardcoded)
                        : null,
                    label: 'Pronoun'.hardcoded,
                    keyboardType: keyboardType,
                    hasAutoFocus: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
