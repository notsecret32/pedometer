import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pedometer/core/theme/colors.dart';
import 'package:pedometer/core/theme/text_theme.dart';
import 'package:pedometer/core/widgets/number_form_field.dart';
import 'package:pedometer/features/onboarding/repositories/daily_step_goal_repository.dart';

class OnboardingGoalSelection extends ConsumerStatefulWidget {
  const OnboardingGoalSelection({super.key});

  @override
  ConsumerState<OnboardingGoalSelection> createState() =>
      _OnboardingGoalSelectionState();
}

class _OnboardingGoalSelectionState
    extends ConsumerState<OnboardingGoalSelection> {
  final _key = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Необходимо указать сколько шагов в день вы хотите ходить:',
            style: AppTextTheme.text,
          ),
          const SizedBox(
            height: 8,
          ),
          NumberFormField(
            controller: _controller,
            validator: (String? value) => _validateTextFormField(value),
            onChanged: (String value) => setState(() {
              _controller.text = value;
            }),
          ),
          const SizedBox(
            height: 32,
          ),
          OutlinedButton(
            onPressed: _key.currentState?.validate() ?? false
                ? () async => await _onPressed()
                : null,
            child: Text(
              'Начать тренировку',
              style: AppTextTheme.text.copyWith(color: richBlack),
            ),
          ),
        ],
      ),
    );
  }

  String? _validateTextFormField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите необходимое кол-во шагов';
    }

    return null;
  }

  Future<void> _onPressed() async {
    await ref
        .read(dailyStepGoalRepositoryProvider.notifier)
        .setDailyGoal(int.parse(_controller.text));

    if (mounted) {
      context.goNamed('home');
    }
  }
}
