import 'package:flutter/material.dart';
import 'package:pedometer/core/theme/text_theme.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Добро пожаловать в Pedometer!',
          style: AppTextTheme.title,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Ваш новый спутник в борьбе за здоровый образ жизни.',
          style: AppTextTheme.text,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
