import 'package:flutter/material.dart';
import 'package:pedometer_app/core/theme/text_theme.dart';
import 'package:pedometer_app/features/pedometer/widgets/pedometer.dart';
import 'package:pedometer_app/features/pedometer/widgets/statistics_bar.dart';
import 'package:pedometer_app/features/pedometer/widgets/statistics_item.dart';

class PedometerScreen extends StatelessWidget {
  const PedometerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Pedometer',
                style: AppTextTheme.title,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16,
              ),
              Pedometer(),
              SizedBox(
                height: 24,
              ),
              StatisticsBar(
                children: [
                  StatisticsItem(
                    'assets/svg/location_pin.svg',
                    name: 'Км',
                    value: '6.22',
                  ),
                  StatisticsItem(
                    'assets/svg/time.svg',
                    name: 'Время',
                    value: '1ч 22м',
                  ),
                  StatisticsItem(
                    'assets/svg/fire.svg',
                    name: 'Калорий',
                    value: '352',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
