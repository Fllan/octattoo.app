import 'package:freezed_annotation/freezed_annotation.dart';

part 'stepper_state.freezed.dart';

@freezed
class StepperState with _$StepperState {
  const StepperState._();
  factory StepperState({
    @Default(0) int currentStep,
    @Default(false) bool isValidStep1,
    @Default(false) bool isValidStep2,
  }) = _StepperState;

  StepperState nextStep() => copyWith(currentStep: currentStep + 1);

  StepperState previousStep() => copyWith(currentStep: currentStep - 1);

  StepperState setStep1Validation(bool isValid) =>
      copyWith(isValidStep1: isValid);

  StepperState setStep2Validation(bool isValid) =>
      copyWith(isValidStep2: isValid);
}
