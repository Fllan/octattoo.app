import 'dart:async';

import 'package:flutter/foundation.dart';

class StreamListenable<T> extends ChangeNotifier {
  late final StreamSubscription<T> _subscription;

  StreamListenable(Stream<T> stream) {
    _subscription = stream.listen((_) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
