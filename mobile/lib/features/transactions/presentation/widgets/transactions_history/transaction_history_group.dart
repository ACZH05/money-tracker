import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../models/transaction.dart';
import 'transaction_history_card.dart';

class TransactionHistoryGroup extends StatelessWidget {
  const TransactionHistoryGroup({
    super.key,
    required this.label,
    required this.transactions,
  });

  final String label;
  final List<TransactionRecord> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: AppColors.tertiary,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        for (var index = 0; index < transactions.length; index++) ...<Widget>[
          TransactionHistoryCard(transaction: transactions[index]),
          if (index != transactions.length - 1)
            const SizedBox(height: AppSpacing.md),
        ],
      ],
    );
  }
}
