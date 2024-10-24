import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'step1_switch_controllers.g.dart';

@riverpod
class ShowNames extends _$ShowNames {
  @override
  bool build() => true;

  void toggle() {
    state = !state;
  }
}

@riverpod
class ShowPronoun extends _$ShowPronoun {
  @override
  bool build() => true;

  void toggle() {
    state = !state;
  }
}
