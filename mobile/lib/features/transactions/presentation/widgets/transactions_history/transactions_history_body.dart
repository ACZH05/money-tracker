import 'package:flutter/material.dart';

import '../../../../../core/theme/app_spacing.dart';
import 'transaction_empty_state.dart';
import 'transaction_filter_bar.dart';
import 'transaction_history_group.dart';

class TransactionsHistoryBody extends StatelessWidget {
  const TransactionsHistoryBody({
    super.key,
    required this.searchController,
    required this.filterLabel,
    required this.onFilterTap,
    required this.isEmpty,
    required this.onAddTransactionTap,
    required this.groupSections,
  });

  final TextEditingController searchController;
  final String filterLabel;
  final VoidCallback onFilterTap;
  final bool isEmpty;
  final VoidCallback onAddTransactionTap;
  final List<Widget> groupSections;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TransactionFilterBar(
          searchController: searchController,
          filterLabel: filterLabel,
          onFilterTap: onFilterTap,
        ),
        const SizedBox(height: AppSpacing.xxl),
        if (isEmpty)
          TransactionEmptyState(onAddTransactionTap: onAddTransactionTap)
        else
          ...groupSections,
      ],
    );
  }
}

typedef TransactionsHistorySection = TransactionHistoryGroup;
