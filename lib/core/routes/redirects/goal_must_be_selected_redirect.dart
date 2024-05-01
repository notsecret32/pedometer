import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pedometer_app/core/constants/constants.dart';
import 'package:pedometer_app/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

FutureOr<String?> goalMustBeSelectedRedirect(
  BuildContext context,
  GoRouterState state,
) async {
  final goal = sl<SharedPreferences>().getInt(dailyStepGoalKey);
  log('Redirect: goal = $goal');
  return goal == null ? '/onboarding' : null;
}
