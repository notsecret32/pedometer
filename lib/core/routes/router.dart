import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:pedometer/core/routes/redirects/goal_must_be_selected_redirect.dart';
import 'package:pedometer/features/onboarding/screens/onboarding_screen.dart';
import 'package:pedometer/features/pedometer/screens/pedometer_screen.dart';

final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      redirect: goalMustBeSelectedRedirect,
      builder: (_, __) => const PedometerScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (_, __) => const OnboardingScreen(),
    ),
  ],
);
