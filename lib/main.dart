import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pedometer_app/app.dart';
import 'package:pedometer_app/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await loadInjection();

  runApp(
    const ProviderScope(
      child: PedometerApp(),
    ),
  );
}
