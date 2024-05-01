import 'package:pedometer/core/constants/constants.dart';
import 'package:pedometer/injection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'daily_step_goal_repository.g.dart';

@riverpod
class DailyStepGoalRepository extends _$DailyStepGoalRepository {
  @override
  int build() => 0;

  Future<void> setDailyGoal(int goal) async {
    state = goal;
    await sl<SharedPreferences>().setInt(dailyStepGoalKey, goal);
  }
}
