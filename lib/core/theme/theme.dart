import 'package:flutter/material.dart';
import 'package:pedometer_app/core/theme/colors.dart';
import 'package:pedometer_app/core/theme/text_theme.dart';

final pedometerThemeData = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: raisinBlack1,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      textStyle: const MaterialStatePropertyAll<TextStyle>(AppTextTheme.text),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) =>
            states.contains(MaterialState.disabled) ? seaGreen : pearlAqua,
      ),
      foregroundColor: const MaterialStatePropertyAll<Color>(richBlack),
      shape: const MaterialStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
      padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(
          vertical: 16,
        ),
      ),
    ),
  ),
);
