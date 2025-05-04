import 'dart:async';

import 'package:flutter/material.dart';

final class CountdownWidget extends StatefulWidget {
  final Duration duration;
  final TextStyle textStyle;

  const CountdownWidget({
    super.key,
    required this.duration,
    required this.textStyle,
  });

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

final class _CountdownWidgetState extends State<CountdownWidget> {
  final counterVN = ValueNotifier<Duration>(Duration.zero);
  late DateTime endTime;
  late Timer timer;

  @override
  void initState() {
    endTime = DateTime.now().add(widget.duration);
    counterVN.value = endTime.difference(DateTime.now());
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      counterVN.value = endTime.difference(DateTime.now());
      if (counterVN.value.inSeconds == 0) timer.cancel();
    });
    super.initState();
  }

  String _getRemainingTime(Duration value) {
    final minutes = value.inMinutes.toString().padLeft(2, '0');
    final seconds = value.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: counterVN,
      builder: (_, value, _) {
        final timeRemaining = _getRemainingTime(value);
        return Text(timeRemaining, style: widget.textStyle);
      },
    );
  }
}
