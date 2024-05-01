import 'package:pedometer_app/core/constants/constants.dart';
import 'package:pedometer_app/injection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'daily_goal_provider.g.dart';

@riverpod
int dailyGoal(DailyGoalRef ref) {
  return sl<SharedPreferences>().getInt(dailyStepGoalKey) ?? 0;
}
