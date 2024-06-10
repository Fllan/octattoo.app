import 'package:flutter/material.dart';
import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';
import 'package:octattoo_app_mvp/core/utils/logger.dart';
import 'package:octattoo_app_mvp/src/onboarding/artist_profile_step1.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const int firstStep = 0;
  int currentStep = firstStep;

  final step1FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var steps = [
      Step(
        isActive: currentStep >= 0,
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        title: Text('Artist Profile'.hardcoded),
        content: ArtistProfileStep1(formKey: step1FormKey),
      ),
      Step(
        isActive: currentStep >= 1,
        state: currentStep > 1
            ? StepState.complete
            : (currentStep < 1 ? StepState.indexed : StepState.editing),
        title: Text('Workplace'.hardcoded),
        content: const Placeholder(),
      ),
      Step(
        isActive: currentStep >= 2,
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        title: Text('Confirm'.hardcoded),
        content: const Placeholder(),
      ),
    ];

    bool isLastStep = currentStep == steps.length - 1;
    int lastStep = steps.length - 1;

    return Stepper(
      onStepTapped: (step) => setState(() => currentStep = step),
      steps: steps,
      type: StepperType.vertical,
      currentStep: currentStep,
      onStepContinue: () async {
        await Future.delayed(Duration.zero);
        bool isStep1FormValid = step1FormKey.currentState?.validate() ?? false;
        if (currentStep == firstStep) {
          if (isStep1FormValid) {
            logger.d('Step 1 is valid');
          } else {
            logger.d('Step 1 is invalid');
            setState(() {});
            return;
          }
        }
        if (isLastStep) {
          logger.d('Create the profile and move the user to dashboard');
          return;
        }
        if (currentStep < lastStep) {
          setState(() {
            currentStep += 1;
          });
        }
      },
      onStepCancel: () {
        if (currentStep > firstStep) {
          setState(() {
            currentStep -= 1;
          });
        }
      },
      controlsBuilder: (context, details) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (currentStep > firstStep)
              ElevatedButton(
                onPressed: details.onStepCancel,
                child: Text('Back'.hardcoded),
              ),
            if (!isLastStep)
              FilledButton(
                onPressed: details.onStepContinue,
                child: Text('Next'.hardcoded),
              ),
            if (isLastStep)
              FilledButton(
                onPressed: details.onStepContinue,
                child: Text('Confirm'.hardcoded),
              ),
          ],
        );
      },
    );
  }
}
