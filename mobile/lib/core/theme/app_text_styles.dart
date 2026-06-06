import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextTheme textTheme() {
    const base = TextStyle(color: AppColors.onSurface, height: 1.2);

    return TextTheme(
      displayLarge: base.copyWith(
        fontSize: 42,
        fontWeight: FontWeight.w800,
        letterSpacing: -1.4,
      ),
      displayMedium: base.copyWith(
        fontSize: 34,
        fontWeight: FontWeight.w800,
        letterSpacing: -1.0,
      ),
      headlineSmall: base.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.tertiary,
        letterSpacing: -0.4,
      ),
      titleLarge: base.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
      titleMedium: base.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
      bodyLarge: base.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurface,
      ),
      bodyMedium: base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurfaceVariant,
      ),
      labelLarge: base.copyWith(fontSize: 13, fontWeight: FontWeight.w700),
      labelMedium: base.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurfaceVariant,
        letterSpacing: 0.2,
      ),
      labelSmall: base.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurfaceVariant,
        letterSpacing: 0.2,
      ),
    );
  }
}
