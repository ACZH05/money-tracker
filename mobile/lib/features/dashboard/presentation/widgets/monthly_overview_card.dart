import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/app_card.dart';

class MonthlyOverviewCard extends StatelessWidget {
  const MonthlyOverviewCard({
    super.key,
    required this.monthLabel,
    required this.barHeights,
  });

  final String monthLabel;
  final List<double> barHeights;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Text(
                  'Monthly Overview',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Text(
                monthLabel,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          SizedBox(
            height: 176,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: _buildBars(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBars() {
    return List<Widget>.generate(barHeights.length, (int index) {
      final heightFactor = barHeights[index].clamp(0.0, 1.0);
      final isPeak = index == barHeights.length - 2;
      final color = isPeak
          ? AppColors.primary
          : AppColors.withOpacity(
              AppColors.primaryContainer,
              0.45 + (0.08 * index),
            );

      return Expanded(
        child: Padding(
          padding: EdgeInsets.only(
            right: index == barHeights.length - 1 ? 0 : 8,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 176 * heightFactor,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(999),
                ),
                boxShadow: isPeak
                    ? <BoxShadow>[
                        BoxShadow(
                          color: AppColors.withOpacity(AppColors.primary, 0.20),
                          blurRadius: 12,
                          offset: const Offset(0, -2),
                        ),
                      ]
                    : const <BoxShadow>[],
              ),
            ),
          ),
        ),
      );
    });
  }
}
