import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pedometer/core/theme/text_theme.dart';
import 'package:pedometer/features/pedometer/providers/daily_goal_provider.dart';

class PedometerScreen extends ConsumerWidget {
  const PedometerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int goal = ref.watch(dailyGoalProvider);

    return Scaffold(
      body: Center(
        child: Text(
          'User Daily Goal: $goal',
          style: AppTextTheme.text,
        ),
      ),
    );
  }
}
