import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/amount_text.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../data/mock_dashboard_data.dart';

class SpendingOverviewCard extends StatelessWidget {
  const SpendingOverviewCard({super.key, required this.spendingCategories});

  final List<SpendingCategoryData> spendingCategories;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      variant: AppCardVariant.muted,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Spending overview',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'A soft pulse on where this month is flowing.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.xl),
          ...spendingCategories.map(_SpendingCategoryRow.new),
        ],
      ),
    );
  }
}

class _SpendingCategoryRow extends StatelessWidget {
  const _SpendingCategoryRow(this.data);

  final SpendingCategoryData data;

  @override
  Widget build(BuildContext context) {
    final progressColor = data.progress > 0.8
        ? AppColors.warning
        : AppColors.primary;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xl),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(data.icon, color: AppColors.primary),
              ),
              const SizedBox(width: AppSpacing.lg),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data.category,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      '${(data.progress * 100).round()}% of your calm zone used',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
              AmountText(
                amount: data.spent,
                variant: AmountTextVariant.compact,
                color: AppColors.onSurface,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: data.progress,
              minHeight: 10,
              backgroundColor: AppColors.surfaceContainerHighest,
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Limit', style: Theme.of(context).textTheme.labelMedium),
              Text(
                formatCurrency(data.limit),
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
