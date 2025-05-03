import 'package:flutter/material.dart';

import '../widgets/custom_elevated_button.dart';

final class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SizedBox.expand(
        child: Column(
          spacing: 10,
          children: <Widget>[
            Text('00:30', style: TextStyle(fontSize: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: <Widget>[
                CustomElevatedButton(text: 'Reset', onPressed: () {}),
                CustomElevatedButton(text: 'Resend SMS', onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
