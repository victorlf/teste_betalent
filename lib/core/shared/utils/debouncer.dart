import 'dart:async';
import 'dart:ui';

class Debouncer {
  final int milliseconds;

  Debouncer(this.milliseconds);

  Timer? _timer;

  run(VoidCallback action) {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
