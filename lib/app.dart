import 'package:flutter/material.dart';
import 'package:pedometer/src/features/pedometer/screens/pedometer_screen.dart';

class PedometerApp extends StatelessWidget {
  const PedometerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedometer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PedometerScreen(),
    );
  }
}
