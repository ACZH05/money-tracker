import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/app_gradient_button.dart';

class QuickActionCard extends StatelessWidget {
  const QuickActionCard({super.key, required this.onAddTransaction});

  final VoidCallback onAddTransaction;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final compact = constraints.maxWidth < 360;

          return compact
              ? _CompactQuickAction(onAddTransaction: onAddTransaction)
              : _WideQuickAction(onAddTransaction: onAddTransaction);
        },
      ),
    );
  }
}

class _WideQuickAction extends StatelessWidget {
  const _WideQuickAction({required this.onAddTransaction});

  final VoidCallback onAddTransaction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const _QuickActionIcon(),
        const SizedBox(width: AppSpacing.lg),
        Expanded(child: _QuickActionText()),
        const SizedBox(width: AppSpacing.md),
        AppGradientButton(
          label: 'Add',
          icon: Icons.add_rounded,
          onPressed: onAddTransaction,
          expanded: false,
        ),
      ],
    );
  }
}

class _CompactQuickAction extends StatelessWidget {
  const _CompactQuickAction({required this.onAddTransaction});

  final VoidCallback onAddTransaction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Row(
          children: <Widget>[
            _QuickActionIcon(),
            SizedBox(width: AppSpacing.lg),
            Expanded(child: _QuickActionText()),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        AppGradientButton(
          label: 'Add Transaction',
          icon: Icons.add_rounded,
          onPressed: onAddTransaction,
        ),
      ],
    );
  }
}

class _QuickActionIcon extends StatelessWidget {
  const _QuickActionIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Icon(
        Icons.add_circle_outline_rounded,
        color: AppColors.primary,
      ),
    );
  }
}

class _QuickActionText extends StatelessWidget {
  const _QuickActionText();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Add Transaction', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Capture a new money moment before it slips away.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
