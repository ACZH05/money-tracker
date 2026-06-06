import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../models/transaction.dart';
import '../../../../shared/widgets/amount_text.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/pulse_chip.dart';

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
    final amountColor = isIncome ? AppColors.income : AppColors.onSurface;

    return Row(
      children: <Widget>[
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: isIncome
                ? AppColors.incomeSoft
                : AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(
            isIncome ? Icons.south_west_rounded : Icons.north_east_rounded,
            color: isIncome ? AppColors.income : AppColors.expense,
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
                '${transaction.category} • ${_formatDate(transaction.date)}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.md),
              PulseChip(
                label: isIncome ? 'Income' : 'Expense',
                type: isIncome ? PulseChipType.income : PulseChipType.expense,
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

String _formatDate(DateTime date) {
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

  return '${months[date.month - 1]} ${date.day}';
}
