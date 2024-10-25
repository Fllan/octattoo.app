import 'package:flutter/material.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/stepper_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'step_1_controller.g.dart';

@riverpod
class Step1Controller extends _$Step1Controller {
  bool realNameIsVisible = false;
  bool pronounIsVisible = false;
  final TextEditingController artistNameController = TextEditingController();
  final TextEditingController realNameController = TextEditingController();
  final TextEditingController pronounController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  FutureOr<void> build() {}

  void toggleRealName() {
    realNameIsVisible = !realNameIsVisible;
    state = const AsyncValue.data(null);
  }

  void togglePronoun() {
    pronounIsVisible = !pronounIsVisible;
    state = const AsyncValue.data(null);
  }

  bool formValidator() {
    final stepperController = ref.read(stepperControllerProvider.notifier);
    if (artistNameController.text.isNotEmpty &&
        formKey.currentState != null &&
        (realNameIsVisible ? realNameController.text.isNotEmpty : true) &&
        (pronounIsVisible ? pronounController.text.isNotEmpty : true)) {
      stepperController.updateStepValidation(
          0, formKey.currentState!.validate());
      return formKey.currentState!.validate();
    }
    return false;
  }
}
