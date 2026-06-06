import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/amount_text.dart';

class BalanceHeroCard extends StatelessWidget {
  const BalanceHeroCard({
    super.key,
    required this.totalBalance,
    required this.trendLabel,
  });

  final double totalBalance;
  final String trendLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.xxl),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            AppColors.surfaceContainerLowest,
            AppColors.surfaceContainerHigh,
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.withOpacity(AppColors.tertiary, 0.08),
            blurRadius: 32,
            offset: const Offset(0, 14),
            spreadRadius: -10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Total balance', style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: AppSpacing.lg),
          AmountText(amount: totalBalance, variant: AmountTextVariant.hero),
          const SizedBox(height: AppSpacing.lg),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            decoration: BoxDecoration(
              color: AppColors.withOpacity(AppColors.incomeSoft, 0.95),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              trendLabel,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(color: AppColors.income),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'A clean view of what is ready for the rest of your month.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
