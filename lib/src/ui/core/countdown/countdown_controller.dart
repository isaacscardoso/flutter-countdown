import 'dart:async';
import 'package:flutter/widgets.dart';

final class CountdownController extends ValueNotifier<Duration> {
  final Duration _duration;
  final VoidCallback? _onEnd;
  DateTime? _endTime;
  Timer? _timer;

  CountdownController({required Duration duration, VoidCallback? onEnd})
    : _duration = duration,
      _onEnd = onEnd,
      super(duration);

  void _computeEndTime() {
    _endTime = DateTime.now().add(_duration);
  }

  void _updateValue() {
    final now = DateTime.now();
    final remaining = _endTime!.difference(now);
    final secs = remaining.inSeconds;

    if (secs <= 0) {
      value = Duration.zero;
      _timer?.cancel();
      _onEnd?.call();
      return;
    }

    value = Duration(seconds: secs);
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateValue();
    });
  }

  void start() {
    _timer?.cancel();
    _computeEndTime();
    _updateValue();
    _startTimer();
  }

  void restart() => start();

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
