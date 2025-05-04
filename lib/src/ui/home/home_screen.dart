import 'package:flutter/material.dart';

import '../core/countdown/countdown.dart';
import '../widgets/custom_elevated_button.dart';

final class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final class _HomeScreenState extends State<HomeScreen> {
  late final CountdownController countdownController;
  ValueNotifier<bool> enableResendSMS = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    countdownController = CountdownController(
      duration: const Duration(seconds: 10),
      onEnd: () {
        enableResendSMS.value = true;
      },
    );
  }

  void _onResendSMSPressed() {
    enableResendSMS.value = false;
    countdownController.restart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SizedBox.expand(
        child: Column(
          spacing: 10,
          children: <Widget>[
            CountdownWidget(
              controller: countdownController,
              textStyle: TextStyle(fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: <Widget>[
                ValueListenableBuilder(
                  valueListenable: enableResendSMS,
                  builder: (_, value, _) {
                    return CustomElevatedButton(
                      text: 'Resend SMS',
                      onPressed: value ? _onResendSMSPressed : null,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
