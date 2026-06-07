import 'package:flutter/material.dart';

class AppColors {
  static const Color surface = Color(0xFFF3FBFD);
  static const Color surfaceContainer = Color(0xFFE7EFF1);
  static const Color surfaceContainerLow = Color(0xFFEDF5F7);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerHigh = Color(0xFFE1EAEC);
  static const Color surfaceContainerHighest = Color(0xFFDCE4E6);

  static const Color primary = Color(0xFF006878);
  static const Color primaryContainer = Color(0xFF90DDF0);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color tertiary = Color(0xFF41636D);
  static const Color onSurface = Color(0xFF151D1F);
  static const Color onSurfaceVariant = Color(0xFF3F484B);
  static const Color outlineVariant = Color(0xFFBEC8CB);
  static const Color inverseSurface = Color(0xFF2A3233);
  static const Color inverseOnSurface = Color(0xFFEAF2F4);
  static const Color secondaryContainer = Color(0xFFAEE9F8);
  static const Color tertiaryContainer = Color(0xFFB3D7E2);

  static const Color income = Color(0xFF1E8E79);
  static const Color incomeSoft = Color(0xFFD9F3EE);
  static const Color expense = Color(0xFFB45B74);
  static const Color expenseSoft = Color(0xFFF8E0E7);
  static const Color warningSoft = Color(0xFFF6E9C9);
  static const Color warning = Color(0xFF8E6B13);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[primary, primaryContainer],
  );

  static Color withOpacity(Color color, double opacity) {
    return color.withValues(alpha: opacity);
  }
}
