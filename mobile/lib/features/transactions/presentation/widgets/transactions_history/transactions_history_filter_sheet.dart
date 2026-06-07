import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radius.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../shared/widgets/app_card.dart';

class TransactionsHistoryFilterSheet extends StatelessWidget {
  const TransactionsHistoryFilterSheet({
    super.key,
    required this.selectedLabel,
    required this.onAllTap,
    required this.onIncomeTap,
    required this.onExpenseTap,
  });

  final String selectedLabel;
  final VoidCallback onAllTap;
  final VoidCallback onIncomeTap;
  final VoidCallback onExpenseTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.xl,
          AppSpacing.lg,
          AppSpacing.xl,
          AppSpacing.xl,
        ),
        child: AppCard(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Filter transactions',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Choose which entries you want to keep in view.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.xl),
              _TransactionsHistoryFilterOption(
                key: const Key('transaction_filter_all'),
                label: 'All',
                selected: selectedLabel == 'All',
                onTap: onAllTap,
              ),
              const SizedBox(height: AppSpacing.md),
              _TransactionsHistoryFilterOption(
                key: const Key('transaction_filter_income'),
                label: 'Income',
                selected: selectedLabel == 'Income',
                onTap: onIncomeTap,
              ),
              const SizedBox(height: AppSpacing.md),
              _TransactionsHistoryFilterOption(
                key: const Key('transaction_filter_expense'),
                label: 'Expense',
                selected: selectedLabel == 'Expense',
                onTap: onExpenseTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TransactionsHistoryFilterOption extends StatelessWidget {
  const _TransactionsHistoryFilterOption({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.lg,
          ),
          decoration: BoxDecoration(
            color: selected
                ? AppColors.surfaceContainerLow
                : AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                selected ? Icons.check_circle_rounded : Icons.circle_outlined,
                color: selected
                    ? AppColors.primary
                    : AppColors.onSurfaceVariant,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
