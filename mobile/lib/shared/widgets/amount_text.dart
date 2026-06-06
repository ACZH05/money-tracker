import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

enum AmountTextVariant { hero, section, compact }

class AmountText extends StatelessWidget {
  const AmountText({
    super.key,
    required this.amount,
    this.variant = AmountTextVariant.section,
    this.includeSign = false,
    this.color,
  });

  final double amount;
  final AmountTextVariant variant;
  final bool includeSign;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      formatCurrency(amount, includeSign: includeSign),
      style: _textStyle(
        textTheme,
      ).copyWith(color: color ?? AppColors.onSurface),
    );
  }

  TextStyle _textStyle(TextTheme textTheme) {
    switch (variant) {
      case AmountTextVariant.hero:
        return textTheme.displayLarge!;
      case AmountTextVariant.section:
        return textTheme.titleLarge!.copyWith(
          fontSize: 22,
          letterSpacing: -0.3,
        );
      case AmountTextVariant.compact:
        return textTheme.titleMedium!;
    }
  }
}

String formatCurrency(double amount, {bool includeSign = false}) {
  final absoluteAmount = amount.abs();
  final fixed = absoluteAmount.toStringAsFixed(2);
  final parts = fixed.split('.');
  final digits = parts.first;
  final decimalPart = parts.last;
  final formattedDigits = _addThousandsSeparator(digits);
  final sign = includeSign
      ? amount > 0
            ? '+'
            : amount < 0
            ? '-'
            : ''
      : amount < 0
      ? '-'
      : '';

  return '${sign}RM $formattedDigits.$decimalPart';
}

String _addThousandsSeparator(String digits) {
  final buffer = StringBuffer();

  for (var index = 0; index < digits.length; index++) {
    final reverseIndex = digits.length - index;
    buffer.write(digits[index]);

    if (reverseIndex > 1 && reverseIndex % 3 == 1) {
      buffer.write(',');
    }
  }

  return buffer.toString();
}
