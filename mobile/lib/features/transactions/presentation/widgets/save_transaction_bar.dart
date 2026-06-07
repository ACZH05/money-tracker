import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/app_gradient_button.dart';

class SaveTransactionBar extends StatelessWidget {
  const SaveTransactionBar({super.key, required this.onSave});

  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.withOpacity(
              AppColors.surfaceContainerLowest,
              0.78,
            ),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.withOpacity(AppColors.tertiary, 0.08),
                blurRadius: 28,
                offset: const Offset(0, 12),
                spreadRadius: -10,
              ),
            ],
          ),
          child: AppGradientButton(
            label: 'Save Transaction',
            onPressed: onSave,
          ),
        ),
      ),
    );
  }
}
