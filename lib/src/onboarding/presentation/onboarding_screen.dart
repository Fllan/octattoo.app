import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/step1_form_controller.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/step_state_controllers.dart';
import 'package:octattoo_app/src/onboarding/presentation/widgets/step1_artist_profile.dart';
import 'package:octattoo_app/src/onboarding/presentation/widgets/step2_add_workplace.dart';
import 'package:octattoo_app/src/onboarding/presentation/widgets/step3_confirm.dart';
import 'package:octattoo_app/src/shared/widgets/buttons/custom_buttons.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';

class OnBoardingScreen extends ConsumerStatefulWidget {
  const OnBoardingScreen({
    super.key,
  });

  @override
  ConsumerState<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends ConsumerState<OnBoardingScreen> {
  int _currentStep = 0;
  final TextEditingController artistNameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController pronounController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isStep1Valid = false;

  @override
  void dispose() {
    artistNameController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    pronounController.dispose();
    super.dispose();
  }

  Future<void> _validateStep1Form() async {
    logger.e('onToggle();');
    final step1FormController = ref.read(step1FormControllerProvider.notifier);
    final isValid = step1FormController.formValidator(
      artistName: artistNameController.text,
      firstname: firstnameController.text,
      lastname: lastnameController.text,
      pronoun: pronounController.text,
      formKey: formKey,
    );

    logger.d('isValid: $isValid');

    setState(() {
      _isStep1Valid = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 900,
        child: Stepper(
          currentStep: _currentStep,
          onStepContinue: () {
            logger.e('onStepContinue');
            logger.d(
                '_currentStep: $_currentStep --- _isStep1Valid: $_isStep1Valid');
            if (_currentStep == 0 && _isStep1Valid) {
              setState(() {
                _currentStep++;
              });
            }
            null;
          },
          onStepCancel: () {
            setState(() {
              _currentStep--;
            });
          },
          type: StepperType.vertical,
          steps: <Step>[
            Step(
              isActive: _currentStep >= 0,
              title:
                  MaterialText.titleMedium('Artist Profile'.hardcoded, context),
              state: ref.watch(step1StateControllerProvider),
              content: Form(
                key: formKey,
                onChanged: () => _validateStep1Form(),
                child: Step1ArtistProfile(
                  artistNameController: artistNameController,
                  firstnameController: firstnameController,
                  lastnameController: lastnameController,
                  pronounController: pronounController,
                  onToggle: _validateStep1Form,
                ),
              ),
            ),
            Step(
              isActive: _currentStep >= 1,
              title: MaterialText.titleMedium(
                  'Add your Workplace'.hardcoded, context),
              content: const Step2AddWorkplace(),
              state: ref.watch(step2StateControllerProvider),
            ),
            Step(
              isActive: _currentStep >= 2,
              title: MaterialText.titleMedium('Confirm'.hardcoded, context),
              content: const Step3Confirm(),
              //TODO : adapt when step 1 and step 2 are valid then StepSTate.complete
              state: StepState.complete,
            ),
          ],
          controlsBuilder: (context, details) {
            logger.e('controlsBuilder');
            bool isLastStep = _currentStep == 2;
            bool isFirstStep = _currentStep == 0;
            logger.d('isLastStep: $isLastStep --- isFirstStep: $isFirstStep');
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 64, 0, 0),
              child: Row(
                children: [
                  isLastStep
                      ? PrimaryButton(
                          label: Text('Create account'.hardcoded),
                          onPressed: () {},
                        )
                      : PrimaryButton(
                          label: Text('Continue'.hardcoded),
                          //TODO: add logic to enable the button is the current step is Valid
                          onPressed: _currentStep == 0 && !_isStep1Valid
                              ? null
                              : details.onStepContinue,
                        ),
                  gapW48,
                  isFirstStep
                      ? Container()
                      : TertiaryButton(
                          label: Text('Cancel'.hardcoded),
                          onPressed: details.onStepCancel,
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
