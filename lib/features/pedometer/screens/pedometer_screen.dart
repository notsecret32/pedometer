import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pedometer/pedometer.dart';
import 'package:pedometer_app/core/enums/walking_status.dart';
import 'package:pedometer_app/core/theme/text_theme.dart';
import 'package:pedometer_app/features/pedometer/providers/daily_goal_provider.dart';
import 'package:pedometer_app/features/pedometer/repositories/walking_status_repository.dart';
import 'package:pedometer_app/features/pedometer/widgets/pedometer_widget.dart';
import 'package:pedometer_app/features/pedometer/widgets/statistics_bar.dart';
import 'package:pedometer_app/features/pedometer/widgets/statistics_item.dart';
import 'package:permission_handler/permission_handler.dart';

class PedometerScreen extends ConsumerStatefulWidget {
  const PedometerScreen({super.key});

  @override
  ConsumerState<PedometerScreen> createState() => _PedometerScreenState();
}

class _PedometerScreenState extends ConsumerState<PedometerScreen> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;

  String _status = '?';

  int _steps = 0;
  int _timerTick = 0;

  bool _isTimerRunning = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isTimerRunning) {
        setState(() {
          _timerTick += 1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final walkingStatus = ref.watch(walkingStatusRepositoryProvider);

    onWalkingStatusChanged(walkingStatus);

    if (_status == 'Step Count not available') {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: Text(
              _status,
              style: AppTextTheme.title,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Pedometer',
                style: AppTextTheme.title,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final goal = ref.read(dailyGoalProvider);
                  return PedometerWidget(
                    goal: goal,
                    steps: _steps,
                  );
                },
              ),
              const SizedBox(
                height: 24,
              ),
              StatisticsBar(
                children: [
                  StatisticsItem(
                    'assets/svg/location_pin.svg',
                    name: 'Км',
                    value: (_steps * 0.6 / 1000).toStringAsFixed(1),
                  ),
                  StatisticsItem(
                    'assets/svg/time.svg',
                    name: 'Время',
                    value: toStringDate(_timerTick),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initPlatformState() async {
    if (await Permission.activityRecognition.request().isGranted) {
      _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
      _pedestrianStatusStream
          .listen(onPedestrianStatusChanged)
          .onError(onPedestrianStatusError);

      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream.listen(onStepCount).onError(onStepCountError);
    } else {
      setState(() {
        _status = 'There is no permission to receive data';
      });
    }

    if (!mounted) return;
  }

  void onStepCount(StepCount event) {
    log(event.toString());
    if (_isTimerRunning) {
      setState(() {
        _steps = event.steps;
        _timerTick += 1;
      });
    }
  }

  void onStepCountError(error) {
    log('onStepCountError: $error');
    setState(() {
      _status = 'Step Count not available';
    });
    log(_status);
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    log(event.toString());
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    log('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    log(_status);
  }

  void onWalkingStatusChanged(WalkingStatus status) {
    if (status == WalkingStatus.pause) {
      _isTimerRunning = false;
    } else if (status == WalkingStatus.resume) {
      _isTimerRunning = true;
    }
  }

  String toStringDate(int? tick) {
    if (tick == null) {
      return '00:00:00';
    }

    int hours = tick ~/ 3600;
    int minutes = (tick % 3600) ~/ 60;
    int seconds = tick % 60;

    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}
