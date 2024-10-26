import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:octattoo_app/core/constants/workplace_types.dart';

part 'step_2_state.freezed.dart';

@freezed
class Step2State with _$Step2State {
  const Step2State._();
  factory Step2State({
    @Default(null) WorkplaceTypes? workplaceType,
  }) = _Step2State;

  Step2State setWorkplaceType(WorkplaceTypes? type) =>
      copyWith(workplaceType: type);
}
