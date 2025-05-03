import 'package:flutter/material.dart';

import 'ui/home/home_screen.dart';

final class CountdownApp extends StatelessWidget {
  const CountdownApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countdown App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
