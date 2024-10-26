import 'package:freezed_annotation/freezed_annotation.dart';

part 'step_1_state.freezed.dart';

@freezed
class Step1State with _$Step1State {
  const Step1State._();
  factory Step1State({
    @Default(false) bool realNameIsVisible,
    @Default(false) bool pronounIsVisible,
  }) = _Step1State;

  Step1State toggleRealName() =>
      copyWith(realNameIsVisible: !realNameIsVisible);

  Step1State togglePronoun() => copyWith(pronounIsVisible: !pronounIsVisible);
}
