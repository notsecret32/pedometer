import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pedometer/core/theme/colors.dart';
import 'package:pedometer/core/theme/text_theme.dart';
import 'package:pedometer/features/pedometer/providers/daily_goal_provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PedometerScreen extends ConsumerWidget {
  const PedometerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int goal = ref.watch(dailyGoalProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Title
              const Text(
                'Pedometer',
                style: AppTextTheme.title,
                textAlign: TextAlign.center,
              ),

              /// Spacer
              const SizedBox(
                height: 16,
              ),

              /// Pedometer
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: raisinBlack2,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 16,
                    ),
                    child: SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                          maximum: goal.toDouble(),
                          showLabels: false,
                          showTicks: false,
                          axisLineStyle: const AxisLineStyle(
                            thickness: 0.3,
                            cornerStyle: CornerStyle.bothCurve,
                            color: raisinBlack1,
                            thicknessUnit: GaugeSizeUnit.factor,
                          ),
                          pointers: const <GaugePointer>[
                            RangePointer(
                              color: pearlAqua,
                              value: 250,
                              cornerStyle: CornerStyle.bothCurve,
                              width: 0.3,
                              sizeUnit: GaugeSizeUnit.factor,
                            )
                          ],
                          annotations: [
                            GaugeAnnotation(
                              positionFactor: 0.15,
                              widget: Container(
                                width: 190,
                                height: 300,
                                padding: const EdgeInsets.all(0),
                                decoration: const BoxDecoration(
                                  color: darkCharcoal,
                                  shape: BoxShape.circle,
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '500',
                                          style: AppTextTheme.title.copyWith(
                                            fontSize: 40,
                                          ),
                                        ),
                                        Text(
                                          'Шагов',
                                          style: AppTextTheme.text.copyWith(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      child: GestureDetector(
                                        onTap: () => log('hello'),
                                        child: Container(
                                          width: 80,
                                          height: 80,
                                          decoration: const BoxDecoration(
                                            color: harvestGold,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.play_arrow_rounded,
                                            size: 64,
                                            color: white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

              /// Spacer
              const SizedBox(
                height: 24,
              ),

              /// Stats
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: raisinBlack2,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /// Distance
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/location_pin.svg',
                          width: 40,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '6.22',
                              style: AppTextTheme.title.copyWith(fontSize: 18),
                            ),
                            Text(
                              'Км',
                              style: AppTextTheme.text.copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),

                    /// Time
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/time.svg',
                          width: 40,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1ч 22м',
                              style: AppTextTheme.title.copyWith(fontSize: 18),
                            ),
                            Text(
                              'Время',
                              style: AppTextTheme.text.copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),

                    /// Calories
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/fire.svg',
                          width: 40,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '352',
                              style: AppTextTheme.title.copyWith(fontSize: 18),
                            ),
                            Text(
                              'Калорий',
                              style: AppTextTheme.text.copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
