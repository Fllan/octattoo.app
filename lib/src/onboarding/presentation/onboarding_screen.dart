import 'package:flutter/material.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/onboarding/presentation/step_1_artist_profile.dart';
import 'package:octattoo_app/src/onboarding/presentation/step_2_add_workplace.dart';
import 'package:octattoo_app/src/onboarding/presentation/step_3_confirmation.dart';
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

class OnBoardingStepper extends StatelessWidget {
  const OnBoardingStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Stepper(
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
