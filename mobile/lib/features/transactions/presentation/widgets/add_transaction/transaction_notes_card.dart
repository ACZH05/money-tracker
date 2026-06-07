import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../shared/widgets/app_card.dart';

class TransactionNotesCard extends StatelessWidget {
  const TransactionNotesCard({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      variant: AppCardVariant.strong,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Notes', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.md),
          TextField(
            key: const Key('add_transaction_notes_input'),
            controller: controller,
            focusNode: focusNode,
            minLines: 4,
            maxLines: 5,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(color: AppColors.onSurface),
            decoration: InputDecoration.collapsed(
              hintText: 'Add a note...',
              hintStyle: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
