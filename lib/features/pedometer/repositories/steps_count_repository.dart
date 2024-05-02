import 'package:pedometer_app/core/constants/constants.dart';
import 'package:pedometer_app/injection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'steps_count_repository.g.dart';

@riverpod
class StepsCountRepository extends _$StepsCountRepository {
  @override
  int build() => 0;

  Future<void> setStepsCount(int stepsCount) async {
    state = stepsCount;
    await sl<SharedPreferences>().setInt(currentStepsKey, stepsCount);
  }
}
