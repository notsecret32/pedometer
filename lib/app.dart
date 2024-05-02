import 'package:flutter/material.dart';
import 'package:pedometer_app/core/routes/router.dart';
import 'package:pedometer_app/core/theme/theme.dart';

class PedometerApp extends StatelessWidget {
  const PedometerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Pedometer',
      theme: pedometerThemeData,
      routerConfig: router,
    );
  }
}
