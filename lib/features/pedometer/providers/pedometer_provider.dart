import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pedometer_provider.g.dart';

@riverpod
int stepCount(StepCountRef ref) {
  return 5000;
}
