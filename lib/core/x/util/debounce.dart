import 'dart:async';
import 'dart:ui';

class Debounce {
  final int delayMillis;
  Timer? _timer;

  Debounce({required this.delayMillis});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: delayMillis), action);
  }

}
