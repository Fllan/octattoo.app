import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/workplace_types.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/src/authentication/data/firebase_auth_repository.dart';
import 'package:octattoo_app/src/onboarding/data/algolia_workplaces_repository.dart';
import 'package:octattoo_app/src/onboarding/data/firebase_workplaces_repository.dart';
import 'package:octattoo_app/src/onboarding/domain/workplace.dart';
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
  final TextEditingController postalCodeController = TextEditingController();
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
        countryController.text.isNotEmpty &&
        postalCodeController.text.isNotEmpty;
    bool isValid = isFormValid && isWorkplaceNameFilled & isAddressFilled;
    logger.d(
        'isFormValid: $isFormValid - isWorkplaceNameFilled: $isWorkplaceNameFilled - isAddressFilled: $isAddressFilled');
    logger.d('isValid: $isValid');
    state = state.setFormValidation(isValid);
  }

  void saveNewWorkplaceForm() async {
    logger.e('saveNewWorkplaceForm');
    final workplacesRepository = ref.watch(workplacesRepositoryProvider);
    final currentAppUserId = ref.watch(authRepositoryProvider).currentUser!.uid;
    final managerUid = state.isManager ? currentAppUserId : '';
    final Workplace workplace = Workplace(
        creatorUid: currentAppUserId,
        managerUid: managerUid,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        name: workplaceNameController.value.text,
        street: streetController.value.text,
        city: cityController.value.text,
        province: provinceController.value.text,
        country: countryController.value.text,
        postalCode: postalCodeController.value.text,
        id: '');
    final workplaceDocRef = await workplacesRepository.add(workplace);
    setWorkplace(workplace.copyWith(id: workplaceDocRef));
  }

  void setWorkplace(Workplace? workplace) {
    state = state.setWorkplace(workplace);
  }
}
