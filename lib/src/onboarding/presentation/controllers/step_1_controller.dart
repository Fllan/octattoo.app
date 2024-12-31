import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/workplace_types.dart';
import 'package:octattoo_app/src/onboarding/domain/workplace.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/step_1_state.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/step_2_controller.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/stepper_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'step_1_controller.g.dart';

@riverpod
class Step1Controller extends _$Step1Controller {
  final TextEditingController artistNameController = TextEditingController();
  final TextEditingController realNameController = TextEditingController();
  final TextEditingController pronounController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Step1State build() {
    return Step1State();
  }

  void toggleRealName() {
    state = state.toggleRealName();
    Future.delayed(const Duration(milliseconds: 50), validateForm);
  }

  void togglePronoun() {
    state = state.togglePronoun();
    Future.delayed(const Duration(milliseconds: 50), validateForm);
  }

  void validateForm() {
    final stepperController = ref.read(stepperControllerProvider.notifier);
    bool isFormValid = formKey.currentState?.validate() ?? false;
    bool isRealNameFilled =
        state.realNameIsVisible ? realNameController.text.isNotEmpty : true;
    bool isPronounFilled =
        state.pronounIsVisible ? pronounController.text.isNotEmpty : true;
    bool isValid = isFormValid && isRealNameFilled && isPronounFilled;

    //TODO - remove - for dev purpose
    ref
        .read(step2ControllerProvider.notifier)
        .setWorkplaceType(WorkplaceTypes.permanent);
    ref.read(step2ControllerProvider.notifier).setWorkplace(
          Workplace(
            id: 'id',
            creatorUid: 'creatorUid',
            managerUid: 'managerUid',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            name: 'name',
            street: 'street',
            city: 'city',
            province: 'province',
            country: 'country',
            postalCode: 'postalCode',
          ),
        );
    //! - remove - for dev purpose
    stepperController.updateStepValidation(0, isValid);
  }
}
