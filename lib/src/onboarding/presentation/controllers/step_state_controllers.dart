import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'step_state_controllers.g.dart';

@riverpod
class Step1StateController extends _$Step1StateController {
  @override
  StepState build() {
    //TODO: add logic to adapt the state of the Step 1
    return StepState.indexed;
  }
}

@riverpod
class Step2StateController extends _$Step2StateController {
  @override
  StepState build() {
    //TODO: add logic to adapt the state of the Step 2
    return StepState.indexed;
  }
}
