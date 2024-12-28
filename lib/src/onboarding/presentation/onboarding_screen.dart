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
    final stepperController = ref.watch(stepperControllerProvider);
    final stepperNotifier = ref.read(stepperControllerProvider.notifier);
    final currentStep = stepperController.currentStep;
    return Stepper(
      currentStep: currentStep,
      controlsBuilder: (context, details) {
        if (currentStep == 1) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 64, 0, 0),
            child: Row(
              children: [
                TertiaryButton(
                  label: Text('Go back'.hardcoded),
                  onPressed: () => stepperNotifier.previousStep(),
                ),
              ],
            ),
          );
        }
        bool isLastStep = currentStep == 2;
        bool isFirstStep = currentStep == 0;
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
                      onPressed: stepperController.isValidStep1
                          ? () => stepperNotifier.nextStep()
                          : null,
                    ),
              gapW48,
              isFirstStep
                  ? Container()
                  : TertiaryButton(
                      label: Text('Cancel'.hardcoded),
                      onPressed: () => stepperNotifier.previousStep(),
                    ),
            ],
          ),
        );
      },
      steps: [
        Step(
          state: stepperNotifier.getStepState(0),
          title: MaterialText.titleMedium('Artist Profile'.hardcoded, context),
          content: const Step1ArtistProfile(),
        ),
        Step(
          state: stepperNotifier.getStepState(1),
          title: MaterialText.titleMedium('Workplace'.hardcoded, context),
          content: const Step2AddWorkplace(),
        ),
        Step(
          state: stepperNotifier.getStepState(2),
          title: MaterialText.titleMedium('Confirmation'.hardcoded, context),
          content: const Step3Confirmation(),
        ),
      ],
    );
  }
}
