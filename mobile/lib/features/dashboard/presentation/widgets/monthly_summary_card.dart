import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/amount_text.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/pulse_chip.dart';

class MonthlySummaryCard extends StatelessWidget {
  const MonthlySummaryCard({
    super.key,
    required this.income,
    required this.expenses,
    required this.savings,
  });

  final double income;
  final double expenses;
  final double savings;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      variant: AppCardVariant.elevated,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final itemWidth = constraints.maxWidth >= 420
              ? (constraints.maxWidth - (AppSpacing.lg * 2)) / 3
              : constraints.maxWidth >= 280
              ? (constraints.maxWidth - AppSpacing.lg) / 2
              : constraints.maxWidth;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Monthly Summary',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSpacing.xl),
              Wrap(
                spacing: AppSpacing.lg,
                runSpacing: AppSpacing.lg,
                children: <Widget>[
                  _SummaryItem(
                    width: itemWidth,
                    label: 'Income',
                    amount: income,
                    chipLabel: 'Income',
                    chipType: PulseChipType.income,
                    amountColor: AppColors.income,
                  ),
                  _SummaryItem(
                    width: itemWidth,
                    label: 'Expenses',
                    amount: expenses,
                    chipLabel: 'Expense',
                    chipType: PulseChipType.expense,
                    amountColor: AppColors.expense,
                  ),
                  _SummaryItem(
                    width: itemWidth,
                    label: 'Saved',
                    amount: savings,
                    chipLabel: 'Savings',
                    chipType: PulseChipType.neutral,
                    amountColor: AppColors.primary,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem({
    required this.width,
    required this.label,
    required this.amount,
    required this.chipLabel,
    required this.chipType,
    required this.amountColor,
  });

  final double width;
  final String label;
  final double amount;
  final String chipLabel;
  final PulseChipType chipType;
  final Color amountColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label, style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: AppSpacing.sm),
          AmountText(amount: amount, color: amountColor),
          const SizedBox(height: AppSpacing.md),
          PulseChip(label: chipLabel, type: chipType),
        ],
      ),
    );
  }
}
