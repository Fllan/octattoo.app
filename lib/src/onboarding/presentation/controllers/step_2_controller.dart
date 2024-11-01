import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/workplace_types.dart';
import 'package:octattoo_app/src/onboarding/data/algolia_workplaces_repository.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/step_2_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'step_2_controller.g.dart';

@riverpod
class Step2Controller extends _$Step2Controller {
  final TextEditingController searchFieldController =
      TextEditingController(text: '');

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
}
