import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pedometer_app/core/theme/colors.dart';
import 'package:pedometer_app/core/theme/text_theme.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PedometerGauge extends StatelessWidget {
  const PedometerGauge({
    super.key,
    required this.maximum,
    required this.value,
  });

  final int maximum;
  final int value;

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          maximum: maximum.toDouble(),
          showLabels: false,
          showTicks: false,
          axisLineStyle: _axisLineStyle,
          pointers: <GaugePointer>[
            _pointer,
          ],
          annotations: [
            GaugeAnnotation(
              positionFactor: 0.15,
              widget: _statistics,
            ),
          ],
        )
      ],
    );
  }

  GaugePointer get _pointer => const RangePointer(
        color: pearlAqua,
        value: 250,
        cornerStyle: CornerStyle.bothCurve,
        width: 0.3,
        sizeUnit: GaugeSizeUnit.factor,
      );

  AxisLineStyle get _axisLineStyle => const AxisLineStyle(
        thickness: 0.3,
        cornerStyle: CornerStyle.bothCurve,
        color: raisinBlack1,
        thicknessUnit: GaugeSizeUnit.factor,
      );

  Widget get _statistics => SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: FractionallySizedBox(
          alignment: Alignment.topCenter,
          widthFactor: 0.6,
          child: Container(
            padding: const EdgeInsets.all(0),
            decoration: const BoxDecoration(
              color: darkCharcoal,
              shape: BoxShape.circle,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                _stepsInfo,
                Positioned(
                  bottom: 10,
                  child: _button,
                ),
              ],
            ),
          ),
        ),
      );

  Widget get _stepsInfo => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value.toString(),
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
      );

  Widget get _button => GestureDetector(
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
      );
}
