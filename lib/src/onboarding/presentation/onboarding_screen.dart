import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/stepper_controller.dart';
import 'package:octattoo_app/src/onboarding/presentation/step_1_artist_profile.dart';
import 'package:octattoo_app/src/onboarding/presentation/step_2_add_workplace.dart';
import 'package:octattoo_app/src/onboarding/presentation/step_3_confirmation.dart';
import 'package:octattoo_app/src/shared/widgets/buttons/custom_buttons.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: OnBoardingStepper(),
    );
  }
}

class OnBoardingStepper extends ConsumerWidget {
  const OnBoardingStepper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stepperNotifier = ref.read(stepperControllerProvider.notifier);
    return Stepper(
      currentStep: stepperNotifier.currentStep,
      controlsBuilder: (context, details) {
        bool isLastStep = stepperNotifier.currentStep == 2;
        bool isFirstStep = stepperNotifier.currentStep == 0;
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
                      //!
                      //!
                      //! Trigger UI when change of state....
                      //!
                      //!
                      onPressed: stepperNotifier.isValidStep1
                          ? () => stepperNotifier.nextStep()
                          : null,
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
      steps: [
        Step(
          title: MaterialText.titleMedium('Artist Profile'.hardcoded, context),
          content: const Step1ArtistProfile(),
        ),
        Step(
          title:
              MaterialText.titleMedium('Add your Workplace'.hardcoded, context),
          content: const Step2AddWorkplace(),
        ),
        Step(
          title: MaterialText.titleMedium('Confirmation'.hardcoded, context),
          content: const Step3Confirmation(),
        ),
      ],
    );
  }
}
