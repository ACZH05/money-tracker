import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radius.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../models/transaction.dart';

class TransactionTypeSelector extends StatelessWidget {
  const TransactionTypeSelector({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  final TransactionType selectedType;
  final ValueChanged<TransactionType> onTypeChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: _SelectorItem(
              label: 'Expense',
              selected: selectedType == TransactionType.expense,
              type: TransactionType.expense,
              onTap: onTypeChanged,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: _SelectorItem(
              label: 'Income',
              selected: selectedType == TransactionType.income,
              type: TransactionType.income,
              onTap: onTypeChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectorItem extends StatelessWidget {
  const _SelectorItem({
    required this.label,
    required this.selected,
    required this.type,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final TransactionType type;
  final ValueChanged<TransactionType> onTap;

  @override
  Widget build(BuildContext context) {
    final Color accent = type == TransactionType.income
        ? AppColors.income
        : AppColors.expense;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      decoration: BoxDecoration(
        color: selected ? AppColors.surfaceContainerLowest : Colors.transparent,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        boxShadow: selected
            ? <BoxShadow>[
                BoxShadow(
                  color: AppColors.withOpacity(AppColors.tertiary, 0.06),
                  blurRadius: 24,
                  offset: const Offset(0, 10),
                  spreadRadius: -12,
                ),
              ]
            : const <BoxShadow>[],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => onTap(type),
          borderRadius: BorderRadius.circular(AppRadius.pill),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: AppSpacing.sm,
                  height: AppSpacing.sm,
                  decoration: BoxDecoration(
                    color: accent,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: selected ? AppColors.onSurface : AppColors.tertiary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
