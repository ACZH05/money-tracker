import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';

enum AppCardVariant { elevated, subtle, muted, strong }

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.xl),
    this.margin,
    this.variant = AppCardVariant.elevated,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final AppCardVariant variant;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: _boxShadow,
      ),
      child: Padding(padding: padding, child: child),
    );
  }

  Color get _backgroundColor {
    switch (variant) {
      case AppCardVariant.elevated:
        return AppColors.surfaceContainerLowest;
      case AppCardVariant.subtle:
        return AppColors.surfaceContainerLow;
      case AppCardVariant.muted:
        return AppColors.surfaceContainer;
      case AppCardVariant.strong:
        return AppColors.surfaceContainerHigh;
    }
  }

  List<BoxShadow> get _boxShadow {
    if (variant != AppCardVariant.elevated) {
      return const <BoxShadow>[];
    }

    return <BoxShadow>[
      BoxShadow(
        color: AppColors.withOpacity(AppColors.tertiary, 0.06),
        blurRadius: 28,
        offset: const Offset(0, 10),
        spreadRadius: -10,
      ),
    ];
  }
}
