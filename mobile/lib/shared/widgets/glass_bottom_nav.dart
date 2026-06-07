import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';

class GlassBottomNavDestination {
  const GlassBottomNavDestination({
    required this.icon,
    required this.label,
    this.selectedIcon,
    this.emphasized = false,
  });

  final IconData icon;
  final IconData? selectedIcon;
  final String label;
  final bool emphasized;
}

class GlassBottomNav extends StatelessWidget {
  const GlassBottomNav({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
    required this.destinations,
  });

  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<GlassBottomNavDestination> destinations;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.withOpacity(
              AppColors.surfaceContainerLowest,
              0.74,
            ),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.withOpacity(AppColors.tertiary, 0.10),
                blurRadius: 28,
                offset: const Offset(0, 12),
                spreadRadius: -10,
              ),
            ],
          ),
          child: NavigationBar(
            selectedIndex: currentIndex,
            onDestinationSelected: onDestinationSelected,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: destinations
                .map(
                  (GlassBottomNavDestination destination) =>
                      NavigationDestination(
                        icon: _NavIcon(
                          icon: destination.icon,
                          emphasized: destination.emphasized,
                          selected: false,
                        ),
                        selectedIcon: _NavIcon(
                          icon: destination.selectedIcon ?? destination.icon,
                          emphasized: destination.emphasized,
                          selected: true,
                        ),
                        label: destination.label,
                        tooltip: destination.label,
                      ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({
    required this.icon,
    required this.emphasized,
    required this.selected,
  });

  final IconData icon;
  final bool emphasized;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    if (selected) {
      return Container(
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.onPrimary),
      );
    }

    return Icon(
      icon,
      color: emphasized ? AppColors.primary : AppColors.onSurfaceVariant,
    );
  }
}
