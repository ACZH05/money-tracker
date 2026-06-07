import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../models/transaction.dart';
import '../../../../shared/widgets/amount_text.dart';
import '../../../../shared/widgets/app_card.dart';

class RecentTransactionList extends StatelessWidget {
  const RecentTransactionList({super.key, required this.transactions});

  final List<TransactionRecord> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions
          .map(
            (TransactionRecord transaction) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: AppCard(
                padding: const EdgeInsets.all(AppSpacing.lg),
                variant: AppCardVariant.elevated,
                child: _TransactionTile(transaction: transaction),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  const _TransactionTile({required this.transaction});

  final TransactionRecord transaction;

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.type == TransactionType.income;
    final amountColor = isIncome ? AppColors.primary : AppColors.expense;

    return Row(
      children: <Widget>[
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: isIncome
                ? AppColors.tertiaryContainer
                : AppColors.secondaryContainer,
            shape: BoxShape.circle,
          ),
          child: Icon(
            _iconForTransaction(transaction),
            color: isIncome ? AppColors.primary : AppColors.onSurfaceVariant,
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
                _formatDate(transaction.date),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        AmountText(
          amount: isIncome ? transaction.amount : -transaction.amount,
          variant: AmountTextVariant.compact,
          includeSign: true,
          color: amountColor,
        ),
      ],
    );
  }
}

IconData _iconForTransaction(TransactionRecord transaction) {
  if (transaction.type == TransactionType.income) {
    return Icons.account_balance_wallet_rounded;
  }

  final category = transaction.category.toLowerCase();

  if (category.contains('grocer')) {
    return Icons.shopping_bag_rounded;
  }
  if (category.contains('entertain')) {
    return Icons.movie_rounded;
  }
  if (category.contains('study') || category.contains('work')) {
    return Icons.laptop_mac_rounded;
  }

  return Icons.payments_rounded;
}

String _formatDate(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final compare = DateTime(date.year, date.month, date.day);
  final difference = today.difference(compare).inDays;

  if (difference == 0) {
    return 'Today';
  }
  if (difference == 1) {
    return 'Yesterday';
  }

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

  return '${months[date.month - 1]} ${date.day}, ${date.year}';
}
