import 'package:flutter/material.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/stepper_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stepper_controller.g.dart';

@riverpod
class StepperController extends _$StepperController {
  @override
  StepperState build() {
    return StepperState();
  }

  void updateStepValidation(int step, bool isValid) {
    if (step == 0) {
      state = state.setStep1Validation(isValid);
    } else if (step == 1) {
      state = state.setStep2Validation(isValid);
    }
  }

  void nextStep() => state = state.nextStep();

  void previousStep() => state = state.previousStep();

  StepState getStepState(int stepIndex) {
    if (stepIndex == 0) {
      return state.isValidStep1
          ? StepState.complete
          : state.currentStep == stepIndex
              ? StepState.editing
              : StepState.indexed;
    } else if (stepIndex == 1) {
      return state.isValidStep2
          ? StepState.complete
          : state.currentStep == stepIndex
              ? StepState.editing
              : StepState.indexed;
    } else {
      return state.currentStep == stepIndex
          ? StepState.complete
          : StepState.indexed;
    }
  }
}
