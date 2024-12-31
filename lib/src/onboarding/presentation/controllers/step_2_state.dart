import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:octattoo_app/core/constants/workplace_types.dart';
import 'package:octattoo_app/src/onboarding/domain/workplace.dart';

part 'step_2_state.freezed.dart';

@freezed
class Step2State with _$Step2State {
  const Step2State._();
  factory Step2State({
    @Default(null) WorkplaceTypes? workplaceType,
    @Default('') String searchTerm,
    @Default(false) bool isManager,
    @Default(false) bool isValidForm,
    @Default(null) Workplace? workplace,
    @Default(false) bool hasNoEndDate,
  }) = _Step2State;

  Step2State setWorkplaceType(WorkplaceTypes? type) =>
      copyWith(workplaceType: type);

  Step2State updateSearchTerm(String searchTerm) =>
      copyWith(searchTerm: searchTerm);

  Step2State toggleManager() => copyWith(isManager: !isManager);

  Step2State setNewWorkplaceFormValidation(bool isValid) =>
      copyWith(isValidForm: isValid);

  Step2State setWorkplace(Workplace? workplace) =>
      copyWith(workplace: workplace);

  Step2State toggleNoEndDate() => copyWith(hasNoEndDate: !hasNoEndDate);
}
