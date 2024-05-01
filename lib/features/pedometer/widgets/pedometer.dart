import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pedometer/core/theme/colors.dart';
import 'package:pedometer/features/pedometer/providers/daily_goal_provider.dart';
import 'package:pedometer/features/pedometer/widgets/pedometer_gauge.dart';

class Pedometer extends StatelessWidget {
  const Pedometer({
    super.key,
  });

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
          child: Consumer(
            builder: (context, ref, child) {
              final goal = ref.read(dailyGoalProvider);
              return PedometerGauge(
                maximum: goal,
                value: 250,
              );
            },
          ),
        ),
      ),
    );
  }
}
