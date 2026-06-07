import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../models/transaction.dart';
import '../../../../shared/widgets/authenticated_top_bar.dart';
import '../../data/mock_transactions.dart';
import '../widgets/transactions_history/transactions_history_body.dart';
import '../widgets/transactions_history/transactions_history_filter_sheet.dart';

enum _TransactionHistoryFilter { all, income, expense }

class TransactionsHistoryScreen extends StatefulWidget {
  const TransactionsHistoryScreen({
    super.key,
    required this.onAddTransactionTap,
  });

  final VoidCallback onAddTransactionTap;

  @override
  State<TransactionsHistoryScreen> createState() =>
      _TransactionsHistoryScreenState();
}

class _TransactionsHistoryScreenState extends State<TransactionsHistoryScreen> {
  static const double _maxContentWidth = 480;

  late final TextEditingController _searchController;
  _TransactionHistoryFilter _selectedFilter = _TransactionHistoryFilter.all;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController()..addListener(_handleSearch);
  }

  @override
  void dispose() {
    _searchController
      ..removeListener(_handleSearch)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredTransactions = _filteredTransactions();
    final groupedTransactions = _groupTransactions(filteredTransactions);

    return SafeArea(
      bottom: false,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: _maxContentWidth),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.xl,
                    92,
                    AppSpacing.xl,
                    132,
                  ),
                  child: TransactionsHistoryBody(
                    searchController: _searchController,
                    filterLabel: _filterLabel(_selectedFilter),
                    onFilterTap: _showFilterSheet,
                    isEmpty: groupedTransactions.isEmpty,
                    onAddTransactionTap: widget.onAddTransactionTap,
                    groupSections: <Widget>[
                      for (
                        var index = 0;
                        index < groupedTransactions.length;
                        index++
                      ) ...<Widget>[
                        TransactionsHistorySection(
                          label: groupedTransactions[index].label,
                          transactions: groupedTransactions[index].transactions,
                        ),
                        if (index != groupedTransactions.length - 1)
                          const SizedBox(height: AppSpacing.xxl),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AuthenticatedTopBar(),
          ),
        ],
      ),
    );
  }

  List<TransactionRecord> _filteredTransactions() {
    final query = _searchController.text.trim().toLowerCase();
    final results = transactionsHistoryRecords.where((
      TransactionRecord record,
    ) {
      final matchesQuery =
          query.isEmpty || record.title.toLowerCase().contains(query);
      final matchesFilter = switch (_selectedFilter) {
        _TransactionHistoryFilter.all => true,
        _TransactionHistoryFilter.income =>
          record.type == TransactionType.income,
        _TransactionHistoryFilter.expense =>
          record.type == TransactionType.expense,
      };

      return matchesQuery && matchesFilter;
    }).toList();

    results.sort(
      (TransactionRecord a, TransactionRecord b) => b.date.compareTo(a.date),
    );
    return results;
  }

  List<_TransactionHistoryGroupData> _groupTransactions(
    List<TransactionRecord> transactions,
  ) {
    final grouped = <DateTime, List<TransactionRecord>>{};

    for (final transaction in transactions) {
      final dayKey = DateTime(
        transaction.date.year,
        transaction.date.month,
        transaction.date.day,
      );
      grouped.putIfAbsent(dayKey, () => <TransactionRecord>[]).add(transaction);
    }

    return grouped.entries.map((
      MapEntry<DateTime, List<TransactionRecord>> entry,
    ) {
      final sortedTransactions = List<TransactionRecord>.from(entry.value)
        ..sort(
          (TransactionRecord a, TransactionRecord b) =>
              a.date.compareTo(b.date),
        );

      return _TransactionHistoryGroupData(
        label: _groupLabel(entry.key),
        transactions: sortedTransactions,
      );
    }).toList();
  }

  String _groupLabel(DateTime date) {
    final anchorDay = DateTime(
      transactionsHistoryAnchorDate.year,
      transactionsHistoryAnchorDate.month,
      transactionsHistoryAnchorDate.day,
    );
    final yesterday = anchorDay.subtract(const Duration(days: 1));

    if (_isSameDay(date, anchorDay)) {
      return 'Today';
    }
    if (_isSameDay(date, yesterday)) {
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

    return '${months[date.month - 1]} ${date.day}';
  }

  bool _isSameDay(DateTime left, DateTime right) {
    return left.year == right.year &&
        left.month == right.month &&
        left.day == right.day;
  }

  String _filterLabel(_TransactionHistoryFilter filter) {
    return switch (filter) {
      _TransactionHistoryFilter.all => 'All',
      _TransactionHistoryFilter.income => 'Income',
      _TransactionHistoryFilter.expense => 'Expense',
    };
  }

  Future<void> _showFilterSheet() async {
    FocusScope.of(context).unfocus();

    final selection = await showModalBottomSheet<_TransactionHistoryFilter>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return TransactionsHistoryFilterSheet(
          selectedLabel: _filterLabel(_selectedFilter),
          onAllTap: () {
            Navigator.of(context).pop(_TransactionHistoryFilter.all);
          },
          onIncomeTap: () {
            Navigator.of(context).pop(_TransactionHistoryFilter.income);
          },
          onExpenseTap: () {
            Navigator.of(context).pop(_TransactionHistoryFilter.expense);
          },
        );
      },
    );

    if (selection == null || selection == _selectedFilter) {
      return;
    }

    setState(() {
      _selectedFilter = selection;
    });
  }

  void _handleSearch() {
    setState(() {});
  }
}

class _TransactionHistoryGroupData {
  const _TransactionHistoryGroupData({
    required this.label,
    required this.transactions,
  });

  final String label;
  final List<TransactionRecord> transactions;
}
