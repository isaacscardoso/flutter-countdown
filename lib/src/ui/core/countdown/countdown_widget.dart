import 'package:flutter/material.dart';
import 'countdown_controller.dart';

final class CountdownWidget extends StatefulWidget {
  final CountdownController controller;
  final TextStyle textStyle;

  const CountdownWidget({
    super.key,
    required this.controller,
    required this.textStyle,
  });

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

final class _CountdownWidgetState extends State<CountdownWidget> {
  @override
  void initState() {
    super.initState();
    widget.controller.start();
  }

  String _getRemainingTime(Duration value) {
    final minutes = value.inMinutes.toString().padLeft(2, '0');
    final seconds = value.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controller,
      builder: (_, value, _) {
        final timeRemaining = _getRemainingTime(value);
        return Text(timeRemaining, style: widget.textStyle);
      },
    );
  }
}
