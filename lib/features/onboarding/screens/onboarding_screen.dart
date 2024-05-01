import 'package:flutter/material.dart';
import 'package:pedometer/features/onboarding/widgets/onboarding_goal_selection.dart';
import 'package:pedometer/features/onboarding/widgets/onboarding_header.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: OnboardingHeader(),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: OnboardingGoalSelection(),
            ),
          ],
        ),
      ),
    );
  }
}
