import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';

class AddTransactionTopBar extends StatelessWidget {
  const AddTransactionTopBar({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          color: AppColors.withOpacity(AppColors.surface, 0.74),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.lg,
          ),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: onBack,
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.withOpacity(
                    AppColors.surfaceContainerLowest,
                    0.72,
                  ),
                  foregroundColor: AppColors.primary,
                ),
                icon: const Icon(Icons.arrow_back_rounded),
                tooltip: 'Back to home',
              ),
              Expanded(
                child: Text(
                  'Add Transaction',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),
        ),
      ),
    );
  }
}
