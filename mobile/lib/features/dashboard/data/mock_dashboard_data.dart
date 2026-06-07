import 'package:flutter/material.dart';

import '../../../models/transaction.dart';

class DashboardData {
  const DashboardData({
    required this.userName,
    required this.monthLabel,
    required this.totalBalance,
    required this.balanceTrendValue,
    required this.balanceTrendContext,
    required this.monthlyIncome,
    required this.monthlyExpenses,
    required this.monthlySavings,
    required this.monthlyOverviewBars,
    required this.monthlyBudgetSpent,
    required this.monthlyBudgetLimit,
    required this.spendingCategories,
    required this.recentTransactions,
  });

  final String userName;
  final String monthLabel;
  final double totalBalance;
  final String balanceTrendValue;
  final String balanceTrendContext;
  final double monthlyIncome;
  final double monthlyExpenses;
  final double monthlySavings;
  final List<double> monthlyOverviewBars;
  final double monthlyBudgetSpent;
  final double monthlyBudgetLimit;
  final List<SpendingCategoryData> spendingCategories;
  final List<TransactionRecord> recentTransactions;
}

class SpendingCategoryData {
  const SpendingCategoryData({
    required this.category,
    required this.spent,
    required this.limit,
    required this.icon,
  });

  final String category;
  final double spent;
  final double limit;
  final IconData icon;

  double get progress => limit == 0 ? 0 : (spent / limit).clamp(0.0, 1.0);
}

final dashboardData = DashboardData(
  userName: 'Alfred',
  monthLabel: 'June 2026',
  totalBalance: 5280.45,
  balanceTrendValue: '+8.6%',
  balanceTrendContext: 'vs last month',
  monthlyIncome: 3200.00,
  monthlyExpenses: 1840.55,
  monthlySavings: 1359.45,
  monthlyOverviewBars: <double>[0.30, 0.46, 0.62, 0.80, 0.54, 1.0, 0.72],
  monthlyBudgetSpent: 3000.00,
  monthlyBudgetLimit: 4000.00,
  spendingCategories: <SpendingCategoryData>[
    SpendingCategoryData(
      category: 'Essentials',
      spent: 820,
      limit: 1100,
      icon: Icons.home_rounded,
    ),
    SpendingCategoryData(
      category: 'Food & Coffee',
      spent: 360,
      limit: 500,
      icon: Icons.local_cafe_rounded,
    ),
    SpendingCategoryData(
      category: 'Study & Work',
      spent: 210,
      limit: 320,
      icon: Icons.laptop_mac_rounded,
    ),
  ],
  recentTransactions: <TransactionRecord>[
    TransactionRecord(
      id: 'txn_1',
      title: 'Salary Deposit',
      amount: 4200.00,
      type: TransactionType.income,
      category: 'Income',
      date: DateTime(2026, 6, 6),
      paymentMethod: 'Bank Transfer',
      note: 'Monthly salary transfer',
    ),
    TransactionRecord(
      id: 'txn_2',
      title: 'Grocery Store',
      amount: 124.50,
      type: TransactionType.expense,
      category: 'Groceries',
      date: DateTime(2026, 6, 7),
      paymentMethod: 'Debit Card',
      note: 'Fresh produce and pantry restock',
    ),
    TransactionRecord(
      id: 'txn_3',
      title: 'Streaming Service',
      amount: 15.99,
      type: TransactionType.expense,
      category: 'Entertainment',
      date: DateTime(2026, 6, 2),
      paymentMethod: 'E-Wallet',
      note: 'Monthly streaming subscription',
    ),
    TransactionRecord(
      id: 'txn_4',
      title: 'Freelance Design',
      amount: 480.00,
      type: TransactionType.income,
      category: 'Side Hustle',
      date: DateTime(2026, 6, 2),
      paymentMethod: 'Bank Transfer',
      note: 'Landing page polish',
    ),
  ],
);
