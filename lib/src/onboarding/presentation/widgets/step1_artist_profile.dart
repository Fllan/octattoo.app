import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/step1_switch_controllers.dart';
import 'package:octattoo_app/src/shared/validators/default_3_char_validator.dart';
import 'package:octattoo_app/src/shared/widgets/app_text_form_field.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';

class Step1ArtistProfile extends ConsumerWidget {
  const Step1ArtistProfile({
    super.key,
    required TextEditingController artistNameController,
    required TextEditingController firstnameController,
    required TextEditingController lastnameController,
    required TextEditingController pronounController,
    required this.onToggle,
  })  : _artistNameController = artistNameController,
        _firstnameController = firstnameController,
        _lastnameController = lastnameController,
        _pronounController = pronounController;

  final TextEditingController _artistNameController;
  final TextEditingController _firstnameController;
  final TextEditingController _lastnameController;
  final TextEditingController _pronounController;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showNames = ref.watch(showNamesProvider);
    final showPronoun = ref.watch(showPronounProvider);
    const keyboardType = TextInputType.name;
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: SizedBox(
        width: 470,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialText.labelLarge(
                'Let\'s set the basics of your public artist identity'
                    .hardcoded,
                context),
            gapH32,
            AppTextFormField(
              controller: _artistNameController,
              validator: (value) => default3CharValidator(
                  value, 'Please enter your artist name'.hardcoded),
              label: 'Your artist name'.hardcoded,
              keyboardType: keyboardType,
              hasAutoFocus: true,
            ),
            gapH16,
            SwitchListTile(
              title: Text('I want to show my real names'.hardcoded),
              controlAffinity: ListTileControlAffinity.leading,
              value: showNames,
              onChanged: (value) {
                ref.read(showNamesProvider.notifier).toggle();
                onToggle();
              },
            ),
            Visibility(
              visible: showNames,
              child: Column(
                children: [
                  gapH16,
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: AppTextFormField(
                          keyboardType: keyboardType,
                          controller: _firstnameController,
                          label: 'Firstname'.hardcoded,
                          // controller: firstNameController,
                          validator: (value) => showNames
                              ? default3CharValidator(value,
                                  'Please enter your firstname'.hardcoded)
                              : null,
                          hasAutoFocus: false,
                        ),
                      ),
                      gapW8,
                      Expanded(
                        flex: 1,
                        child: AppTextFormField(
                          keyboardType: keyboardType,
                          controller: _lastnameController,
                          label: 'Lastname'.hardcoded,
                          // controller: lastNameController,
                          validator: (value) => showNames
                              ? default3CharValidator(
                                  value, 'Please enter your lastname'.hardcoded)
                              : null,
                          hasAutoFocus: false,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            gapH16,
            SwitchListTile(
              title: Text('I want to show my pronoun'.hardcoded),
              controlAffinity: ListTileControlAffinity.leading,
              value: showPronoun,
              onChanged: (value) {
                ref.read(showPronounProvider.notifier).toggle();
                onToggle();
              },
            ),
            Visibility(
              visible: showPronoun,
              child: Column(
                children: [
                  gapH16,
                  AppTextFormField(
                    keyboardType: keyboardType,
                    controller: _pronounController,
                    label: 'Pronoun'.hardcoded,
                    // controller: _firstNameController,
                    validator: (value) => showPronoun
                        ? default3CharValidator(
                            value, 'Please enter your pronoun'.hardcoded)
                        : null,
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
