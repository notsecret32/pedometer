import 'package:pedometer_app/features/pedometer/repositories/steps_count_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'steps_count_provider.g.dart';

@riverpod
int getStepsCount(GetStepsCountRef ref) {
  final steps = ref.read(stepsCountRepositoryProvider);
  return steps;
}

@riverpod
Future<void> setStepsCount(SetStepsCountRef ref, int stepsCount) async {
  await ref
      .read(stepsCountRepositoryProvider.notifier)
      .setStepsCount(stepsCount);
}
