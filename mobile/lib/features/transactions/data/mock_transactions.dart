import 'package:flutter/material.dart';

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
