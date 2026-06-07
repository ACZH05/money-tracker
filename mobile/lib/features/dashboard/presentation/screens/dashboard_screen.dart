import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/authenticated_top_bar.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../data/mock_dashboard_data.dart';
import '../widgets/balance_hero_card.dart';
import '../widgets/monthly_budget_card.dart';
import '../widgets/monthly_overview_card.dart';
import '../widgets/monthly_summary_card.dart';
import '../widgets/quick_action_card.dart';
import '../widgets/recent_transaction_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
    required this.onAddTransactionTap,
    required this.onBudgetTap,
    required this.onViewAllTransactionsTap,
  });

  final VoidCallback onAddTransactionTap;
  final VoidCallback onBudgetTap;
  final VoidCallback onViewAllTransactionsTap;

  @override
  Widget build(BuildContext context) {
    final data = dashboardData;

    return SafeArea(
      bottom: false,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.xl,
                    92,
                    AppSpacing.xl,
                    132,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BalanceHeroCard(
                        totalBalance: data.totalBalance,
                        trendValue: data.balanceTrendValue,
                        trendContext: data.balanceTrendContext,
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      MonthlySummaryCard(
                        income: data.monthlyIncome,
                        expenses: data.monthlyExpenses,
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      MonthlyOverviewCard(
                        monthLabel: data.monthLabel,
                        barHeights: data.monthlyOverviewBars,
                      ),
                      const SizedBox(height: AppSpacing.xxl),
                      SectionHeader(
                        title: 'Recent Transactions',
                        actionLabel: 'View All',
                        onActionTap: onViewAllTransactionsTap,
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      RecentTransactionList(
                        transactions: data.recentTransactions.take(3).toList(),
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      GestureDetector(
                        onTap: onBudgetTap,
                        child: MonthlyBudgetCard(
                          spent: data.monthlyBudgetSpent,
                          limit: data.monthlyBudgetLimit,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      QuickActionCard(onAddTransaction: onAddTransactionTap),
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
}
