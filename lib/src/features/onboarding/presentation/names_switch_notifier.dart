import 'package:flutter_riverpod/flutter_riverpod.dart';

class NamesSwitchNotifier extends StateNotifier<bool> {
  NamesSwitchNotifier() : super(false);

  void toggleSwitch(bool value) {
    state = value;
  }
}

final namesSwitchProvider = StateNotifierProvider<NamesSwitchNotifier, bool>((ref) {
  return NamesSwitchNotifier();
});
