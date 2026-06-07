import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/amount_text.dart';

class MonthlyBudgetCard extends StatelessWidget {
  const MonthlyBudgetCard({
    super.key,
    required this.spent,
    required this.limit,
  });

  final double spent;
  final double limit;

  @override
  Widget build(BuildContext context) {
    final progress = limit == 0 ? 0.0 : (spent / limit).clamp(0.0, 1.0);
    final percent = (progress * 100).round();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.inverseSurface,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Monthly Budget',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.inverseOnSurface,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      '$percent% of your limit used',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: AppColors.withOpacity(
                          AppColors.inverseOnSurface,
                          0.72,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 52,
                height: 52,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 4,
                      backgroundColor: AppColors.withOpacity(
                        AppColors.inverseOnSurface,
                        0.14,
                      ),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.primaryContainer,
                      ),
                    ),
                    Text(
                      '$percent%',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: AppColors.inverseOnSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: AppColors.withOpacity(
                AppColors.inverseOnSurface,
                0.10,
              ),
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primaryContainer,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  '${formatCurrency(spent)} spent',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors.withOpacity(
                      AppColors.inverseOnSurface,
                      0.72,
                    ),
                  ),
                ),
              ),
              Text(
                '${formatCurrency(limit)} limit',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: AppColors.withOpacity(
                    AppColors.inverseOnSurface,
                    0.72,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
