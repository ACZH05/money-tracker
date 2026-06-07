import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radius.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../models/transaction.dart';
import '../../../../../shared/widgets/amount_text.dart';
import '../../../../../shared/widgets/app_card.dart';

class TransactionHistoryCard extends StatelessWidget {
  const TransactionHistoryCard({super.key, required this.transaction});

  final TransactionRecord transaction;

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.type == TransactionType.income;

    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: _iconBackgroundColor(transaction),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _iconForTransaction(transaction),
              color: _iconColor(transaction),
              size: 24,
            ),
          ),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  transaction.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  _formatTimestamp(transaction.date),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: AmountText(
                    amount: isIncome ? transaction.amount : -transaction.amount,
                    variant: AmountTextVariant.compact,
                    includeSign: true,
                    color: isIncome ? AppColors.primary : AppColors.expense,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: isIncome
                        ? AppColors.incomeSoft
                        : AppColors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: AppSpacing.sm,
                        height: AppSpacing.sm,
                        decoration: BoxDecoration(
                          color: isIncome
                              ? AppColors.income
                              : AppColors.expense,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Flexible(
                        child: Text(
                          transaction.category,
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(
                                color: isIncome
                                    ? AppColors.income
                                    : AppColors.onSurfaceVariant,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

IconData _iconForTransaction(TransactionRecord transaction) {
  final category = transaction.category.toLowerCase();

  if (transaction.type == TransactionType.income || category == 'income') {
    return Icons.account_balance_wallet_rounded;
  }
  if (category.contains('food')) {
    return Icons.local_cafe_rounded;
  }
  if (category.contains('shop')) {
    return Icons.shopping_bag_rounded;
  }
  if (category.contains('tech')) {
    return Icons.cloud_outlined;
  }
  if (category.contains('housing')) {
    return Icons.home_rounded;
  }

  return Icons.payments_rounded;
}

Color _iconBackgroundColor(TransactionRecord transaction) {
  final category = transaction.category.toLowerCase();

  if (transaction.type == TransactionType.income || category == 'income') {
    return AppColors.tertiaryContainer;
  }
  if (category.contains('food')) {
    return AppColors.surfaceContainer;
  }
  if (category.contains('shop')) {
    return AppColors.expenseSoft;
  }

  return AppColors.secondaryContainer;
}

Color _iconColor(TransactionRecord transaction) {
  final category = transaction.category.toLowerCase();

  if (transaction.type == TransactionType.income || category == 'income') {
    return AppColors.primary;
  }
  if (category.contains('food')) {
    return AppColors.onSurfaceVariant;
  }
  if (category.contains('shop')) {
    return AppColors.expense;
  }

  return AppColors.onSurfaceVariant;
}

String formatTransactionTimestamp(DateTime date) {
  const months = <String>[
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  final period = date.hour >= 12 ? 'PM' : 'AM';
  final hour = (date.hour % 12 == 0 ? 12 : date.hour % 12).toString().padLeft(
    2,
    '0',
  );
  final minute = date.minute.toString().padLeft(2, '0');

  return '${months[date.month - 1]} ${date.day}, $hour:$minute $period';
}

String _formatTimestamp(DateTime date) {
  return formatTransactionTimestamp(date);
}
