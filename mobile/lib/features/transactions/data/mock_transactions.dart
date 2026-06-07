import 'package:flutter/material.dart';

import '../../../models/transaction.dart';

class MockTransactionCategory {
  const MockTransactionCategory({
    required this.id,
    required this.label,
    required this.icon,
  });

  final String id;
  final String label;
  final IconData icon;
}

const List<MockTransactionCategory> addTransactionCategories =
    <MockTransactionCategory>[
      MockTransactionCategory(
        id: 'food',
        label: 'Food',
        icon: Icons.restaurant_rounded,
      ),
      MockTransactionCategory(
        id: 'transport',
        label: 'Transport',
        icon: Icons.directions_car_rounded,
      ),
      MockTransactionCategory(
        id: 'rent',
        label: 'Rent',
        icon: Icons.home_rounded,
      ),
      MockTransactionCategory(
        id: 'shopping',
        label: 'Shopping',
        icon: Icons.shopping_bag_rounded,
      ),
      MockTransactionCategory(
        id: 'beauty',
        label: 'Beauty',
        icon: Icons.spa_rounded,
      ),
      MockTransactionCategory(
        id: 'health',
        label: 'Health',
        icon: Icons.favorite_rounded,
      ),
      MockTransactionCategory(
        id: 'bills',
        label: 'Bills',
        icon: Icons.receipt_long_rounded,
      ),
      MockTransactionCategory(
        id: 'more',
        label: 'More',
        icon: Icons.more_horiz_rounded,
      ),
    ];

final DateTime transactionsHistoryAnchorDate = DateTime(2026, 5, 24, 12);

final List<TransactionRecord> transactionsHistoryRecords = <TransactionRecord>[
  TransactionRecord(
    id: 'history_1',
    title: 'Artisan Espresso',
    amount: 6.50,
    type: TransactionType.expense,
    category: 'Food & Drink',
    date: DateTime(2026, 5, 24, 9, 15),
    paymentMethod: 'Debit Card',
    note: 'Morning coffee run',
  ),
  TransactionRecord(
    id: 'history_2',
    title: 'Freelance Project',
    amount: 1200.00,
    type: TransactionType.income,
    category: 'Income',
    date: DateTime(2026, 5, 24, 11, 45),
    paymentMethod: 'Bank Transfer',
    note: 'Website refresh milestone',
  ),
  TransactionRecord(
    id: 'history_3',
    title: 'Premium Apparel',
    amount: 84.20,
    type: TransactionType.expense,
    category: 'Shopping',
    date: DateTime(2026, 5, 23, 16, 30),
    paymentMethod: 'Credit Card',
    note: 'Capsule wardrobe pickup',
  ),
  TransactionRecord(
    id: 'history_4',
    title: 'Cloud Storage',
    amount: 9.99,
    type: TransactionType.expense,
    category: 'Tech',
    date: DateTime(2026, 5, 23, 8, 0),
    paymentMethod: 'E-Wallet',
    note: 'Monthly backup plan',
  ),
  TransactionRecord(
    id: 'history_5',
    title: 'Monthly Rent',
    amount: 1850.00,
    type: TransactionType.expense,
    category: 'Housing',
    date: DateTime(2026, 5, 15, 10, 0),
    paymentMethod: 'Bank Transfer',
    note: 'Apartment rent payment',
  ),
];
