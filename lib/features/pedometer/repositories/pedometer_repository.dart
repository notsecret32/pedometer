import 'package:pedometer/pedometer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pedometer_repository.g.dart';

@riverpod
class PedometerRepository extends _$PedometerRepository {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  @override
  int build() => 0;
}
