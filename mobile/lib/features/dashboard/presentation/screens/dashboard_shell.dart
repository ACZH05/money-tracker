import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/glass_bottom_nav.dart';
import 'dashboard_screen.dart';

class DashboardShell extends StatefulWidget {
  const DashboardShell({super.key});

  @override
  State<DashboardShell> createState() => _DashboardShellState();
}

class _DashboardShellState extends State<DashboardShell> {
  static const int _homeIndex = 0;
  static const int _budgetIndex = 3;
  static const int _addTransactionIndex = 2;

  int _currentIndex = _homeIndex;

  late final List<Widget> _pages = <Widget>[
    DashboardScreen(
      onAddTransactionTap: () => _selectIndex(_addTransactionIndex),
      onBudgetTap: () => _selectIndex(_budgetIndex),
    ),
    const _PlaceholderScreen(
      title: 'Transactions',
      message: 'Your full history will live here soon.',
      icon: Icons.receipt_long_rounded,
    ),
    const _PlaceholderScreen(
      title: 'Add Transaction',
      message: 'A focused entry flow is queued up next.',
      icon: Icons.add_circle_outline_rounded,
    ),
    const _PlaceholderScreen(
      title: 'Budget',
      message: 'Supportive monthly limits will appear here.',
      icon: Icons.pie_chart_outline_rounded,
    ),
    const _PlaceholderScreen(
      title: 'Profile',
      message: 'Settings and personal details can land here later.',
      icon: Icons.person_outline_rounded,
    ),
  ];

  static const List<GlassBottomNavDestination> _destinations =
      <GlassBottomNavDestination>[
        GlassBottomNavDestination(
          icon: Icons.home_outlined,
          selectedIcon: Icons.home_rounded,
          label: 'Home',
        ),
        GlassBottomNavDestination(
          icon: Icons.receipt_long_outlined,
          selectedIcon: Icons.receipt_long_rounded,
          label: 'Transactions',
        ),
        GlassBottomNavDestination(
          icon: Icons.add_rounded,
          label: 'Add Transaction',
          emphasized: true,
        ),
        GlassBottomNavDestination(
          icon: Icons.pie_chart_outline_rounded,
          selectedIcon: Icons.pie_chart_rounded,
          label: 'Budget',
        ),
        GlassBottomNavDestination(
          icon: Icons.person_outline_rounded,
          selectedIcon: Icons.person_rounded,
          label: 'Profile',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          0,
          AppSpacing.lg,
          AppSpacing.lg,
        ),
        child: GlassBottomNav(
          currentIndex: _currentIndex,
          onDestinationSelected: _selectIndex,
          destinations: _destinations,
        ),
      ),
    );
  }

  void _selectIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen({
    required this.title,
    required this.message,
    required this.icon,
  });

  final String title;
  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Center(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.xxl),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Icon(icon, size: 36, color: AppColors.primary),
                ),
                const SizedBox(height: AppSpacing.xl),
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
