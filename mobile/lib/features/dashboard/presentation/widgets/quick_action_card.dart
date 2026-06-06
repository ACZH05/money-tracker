import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/app_gradient_button.dart';

class QuickActionCard extends StatelessWidget {
  const QuickActionCard({
    super.key,
    required this.onAddTransaction,
    required this.onOpenBudget,
  });

  final VoidCallback onAddTransaction;
  final VoidCallback onOpenBudget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final cardWidth = constraints.maxWidth >= 460
            ? (constraints.maxWidth - AppSpacing.lg) / 2
            : constraints.maxWidth;

        return Wrap(
          spacing: AppSpacing.lg,
          runSpacing: AppSpacing.lg,
          children: <Widget>[
            SizedBox(
              width: cardWidth,
              child: AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Quick capture',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Add a new money moment before it slips away.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    AppGradientButton(
                      label: 'Add transaction',
                      icon: Icons.add_rounded,
                      onPressed: onAddTransaction,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: AppCard(
                variant: AppCardVariant.subtle,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.savings_rounded, color: AppColors.primary),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      'Budget glance',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Check your monthly limits and keep things feeling light.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    TextButton(
                      onPressed: onOpenBudget,
                      child: const Text('Open budget'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
