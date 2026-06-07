import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/amount_text.dart';
import '../../../../shared/widgets/app_card.dart';

class MonthlySummaryCard extends StatelessWidget {
  const MonthlySummaryCard({
    super.key,
    required this.income,
    required this.expenses,
  });

  final double income;
  final double expenses;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final itemWidth = constraints.maxWidth >= 420
            ? (constraints.maxWidth - AppSpacing.lg) / 2
            : constraints.maxWidth;

        return Wrap(
          spacing: AppSpacing.lg,
          runSpacing: AppSpacing.lg,
          children: <Widget>[
            _SummaryItem(
              width: itemWidth,
              label: 'Income',
              amount: income,
              description: 'Received this month',
              dotColor: AppColors.income,
            ),
            _SummaryItem(
              width: itemWidth,
              label: 'Expense',
              amount: expenses,
              description: 'Spent this month',
              dotColor: AppColors.expense,
            ),
          ],
        );
      },
    );
  }
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem({
    required this.width,
    required this.label,
    required this.amount,
    required this.description,
    required this.dotColor,
  });

  final double width;
  final String label;
  final double amount;
  final String description;
  final Color dotColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: AppCard(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: dotColor,
                    shape: BoxShape.circle,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: AppColors.withOpacity(dotColor, 0.35),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors.tertiary,
                    letterSpacing: 1.1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            AmountText(amount: amount),
            const SizedBox(height: AppSpacing.xs),
            Text(description, style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
      ),
    );
  }
}
