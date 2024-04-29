import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pedometer/features/pedometer/providers/pedometer_provider.dart';

class PedometerScreen extends ConsumerWidget {
  const PedometerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int steps = ref.watch(stepCountProvider);

    return Scaffold(
      body: Center(
        child: Text('Pedometer: $steps'),
      ),
    );
  }
}
