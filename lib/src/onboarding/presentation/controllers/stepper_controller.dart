import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stepper_controller.g.dart';

@riverpod
class StepperController extends _$StepperController {
  //!
  //!
  //! WORK IN PROGRESS
  //!
  //!
  int currentStep = 0;
  bool isValidStep1 = false;
  bool isValidStep2 = false;

  @override
  FutureOr<void> build() {}

  void updateStepValidation(int step, bool isValid) {
    if (step == 0) {
      isValidStep1 = isValid;
    } else if (step == 1) {
      isValidStep2 = isValid;
    }
    state = const AsyncValue.data(null);
  }

  void nextStep() {
    currentStep += 1;
  }
}
