import 'package:flutter/material.dart';
import 'package:pedometer_app/core/theme/colors.dart';
import 'package:pedometer_app/features/pedometer/widgets/pedometer_gauge.dart';

class PedometerWidget extends StatelessWidget {
  const PedometerWidget({
    super.key,
    required this.goal,
    required this.steps,
  });

  final int goal;
  final int steps;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: raisinBlack2,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
          ),
          child: PedometerGauge(
            maximum: goal,
            value: steps,
          ),
        ),
      ),
    );
  }
}
