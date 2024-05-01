import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedometer_app/core/theme/colors.dart';
import 'package:pedometer_app/core/theme/text_theme.dart';

class NumberFormField extends StatelessWidget {
  const NumberFormField({
    super.key,
    this.controller,
    this.onChanged,
    this.validator,
  });

  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.deny(RegExp(r'^0')),
        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
      ],
      style: AppTextTheme.text.copyWith(color: white),
      decoration: InputDecoration(
        focusedBorder: border,
        border: border,
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }

  InputBorder get border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: pearlAqua,
        ),
      );
}
