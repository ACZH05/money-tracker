import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../data/mock_dashboard_data.dart';
import '../widgets/balance_hero_card.dart';
import '../widgets/monthly_summary_card.dart';
import '../widgets/quick_action_card.dart';
import '../widgets/recent_transaction_list.dart';
import '../widgets/spending_overview_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
    required this.onAddTransactionTap,
    required this.onBudgetTap,
  });

  final VoidCallback onAddTransactionTap;
  final VoidCallback onBudgetTap;

  @override
  Widget build(BuildContext context) {
    final data = dashboardData;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.xl,
          AppSpacing.xxl,
          AppSpacing.xl,
          120,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _DashboardHeader(data: data),
            const SizedBox(height: AppSpacing.xl),
            BalanceHeroCard(
              totalBalance: data.totalBalance,
              trendLabel: data.balanceTrendLabel,
            ),
            const SizedBox(height: AppSpacing.xl),
            MonthlySummaryCard(
              income: data.monthlyIncome,
              expenses: data.monthlyExpenses,
              savings: data.monthlySavings,
            ),
            const SizedBox(height: AppSpacing.xl),
            SpendingOverviewCard(spendingCategories: data.spendingCategories),
            const SizedBox(height: AppSpacing.xxl),
            SectionHeader(
              title: 'Recent transactions',
              subtitle: 'A calm snapshot of your latest money moves.',
              actionLabel: 'See all',
              onActionTap: onAddTransactionTap,
            ),
            const SizedBox(height: AppSpacing.lg),
            RecentTransactionList(transactions: data.recentTransactions),
            const SizedBox(height: AppSpacing.xl),
            const SectionHeader(
              title: 'Quick actions',
              subtitle: 'Keep the next step within easy reach.',
            ),
            const SizedBox(height: AppSpacing.lg),
            QuickActionCard(
              onAddTransaction: onAddTransactionTap,
              onOpenBudget: onBudgetTap,
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader({required this.data});

  final DashboardData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hello, ${data.userName}',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                '${data.monthLabel} - Your money is looking steady today.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(20),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.withOpacity(AppColors.tertiary, 0.07),
                blurRadius: 18,
                offset: const Offset(0, 10),
                spreadRadius: -8,
              ),
            ],
          ),
          child: const Icon(
            Icons.person_outline_rounded,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
