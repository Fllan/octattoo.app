import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/workplace_types.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/src/onboarding/data/algolia_workplaces_repository.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/step_2_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'step_2_controller.g.dart';

@riverpod
class Step2Controller extends _$Step2Controller {
  final TextEditingController searchFieldController =
      TextEditingController(text: '');
  final TextEditingController workplaceNameController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Step2State build() {
    return Step2State();
  }

  void setWorkplaceType(WorkplaceTypes? selectedType) {
    state = state.setWorkplaceType(selectedType);
  }

  void updateSearchTerm() {
    final searchTerm = searchFieldController.text;
    ref.read(algoliaWorkplacesRepositoryProvider).search(searchTerm);
    state = state.updateSearchTerm(searchTerm);
  }

  void toggleManager() {
    state = state.toggleManager();
    Future.delayed(const Duration(milliseconds: 50), validateForm);
  }

  void validateForm() {
    bool isFormValid = formKey.currentState?.validate() ?? false;
    bool isWorkplaceNameFilled = workplaceNameController.text.isNotEmpty;
    bool isAddressFilled = streetController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        provinceController.text.isNotEmpty &&
        countryController.text.isNotEmpty;
    bool isValid = isFormValid && isWorkplaceNameFilled & isAddressFilled;
    logger.d(
        'isFormValid: $isFormValid - isWorkplaceNameFilled: $isWorkplaceNameFilled - isAddressFilled: $isAddressFilled');
    logger.d('isValid: $isValid');
    state = state.setFormValidation(isValid);
  }

  void createNewWorkplace() {
    logger.e('createNewWorkplace');
  }
}
