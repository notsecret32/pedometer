import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pedometer_app/core/theme/text_theme.dart';

class StatisticsItem extends StatelessWidget {
  const StatisticsItem(
    this.assetName, {
    super.key,
    required this.name,
    required this.value,
  });

  final String assetName;
  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          assetName,
          width: 40,
        ),
        const SizedBox(
          width: 6,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: AppTextTheme.title.copyWith(fontSize: 18),
            ),
            Text(
              name,
              style: AppTextTheme.text.copyWith(fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }
}
