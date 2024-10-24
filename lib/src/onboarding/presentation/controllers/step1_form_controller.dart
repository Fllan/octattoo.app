import 'package:flutter/material.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/step1_switch_controllers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'step1_form_controller.g.dart';

@riverpod
class Step1FormController extends _$Step1FormController {
  @override
  FutureOr<void> build() {}

  bool formValidator({
    required String artistName,
    required String? firstname,
    required String? lastname,
    required String? pronoun,
    required GlobalKey<FormState> formKey,
  }) {
    final showNames = ref.watch(showNamesProvider);
    final showPronoun = ref.watch(showPronounProvider);
    final namesUsed = showNames &&
        firstname != null &&
        lastname != null &&
        firstname.isNotEmpty &&
        lastname.isNotEmpty;
    final pronounUsed = showPronoun && pronoun != null && pronoun.isNotEmpty;
    if (artistName.isNotEmpty &&
        (namesUsed || !showNames) &&
        (pronounUsed || !showPronoun) &&
        formKey.currentState != null) {
      return formKey.currentState!.validate();
    }
    return false;
  }
}
