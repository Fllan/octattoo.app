import 'package:flutter_riverpod/flutter_riverpod.dart';

class PronounSwitchNotifier extends StateNotifier<bool> {
  PronounSwitchNotifier() : super(false);

  void toggleSwitch(bool value) {
    state = value;
  }
}

final pronounSwitchProvider = StateNotifierProvider<PronounSwitchNotifier, bool>((ref) {
  return PronounSwitchNotifier();
});
