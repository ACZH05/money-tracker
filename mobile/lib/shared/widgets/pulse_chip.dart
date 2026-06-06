import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';

enum PulseChipType { income, expense, neutral }

class PulseChip extends StatelessWidget {
  const PulseChip({
    super.key,
    required this.label,
    this.type = PulseChipType.neutral,
  });

  final String label;
  final PulseChipType type;

  @override
  Widget build(BuildContext context) {
    final colors = _chipPalette();

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: AppSpacing.sm,
            height: AppSpacing.sm,
            decoration: BoxDecoration(
              color: colors.dot,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.copyWith(color: colors.text),
          ),
        ],
      ),
    );
  }

  _ChipPalette _chipPalette() {
    switch (type) {
      case PulseChipType.income:
        return const _ChipPalette(
          background: AppColors.incomeSoft,
          dot: AppColors.income,
          text: AppColors.income,
        );
      case PulseChipType.expense:
        return const _ChipPalette(
          background: AppColors.expenseSoft,
          dot: AppColors.expense,
          text: AppColors.expense,
        );
      case PulseChipType.neutral:
        return const _ChipPalette(
          background: AppColors.surfaceContainer,
          dot: AppColors.primary,
          text: AppColors.tertiary,
        );
    }
  }
}

class _ChipPalette {
  const _ChipPalette({
    required this.background,
    required this.dot,
    required this.text,
  });

  final Color background;
  final Color dot;
  final Color text;
}
