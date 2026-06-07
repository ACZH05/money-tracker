import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../models/transaction.dart';
import '../../data/mock_transactions.dart';
import '../widgets/add_transaction_top_bar.dart';
import '../widgets/amount_entry_section.dart';
import '../widgets/category_selector_grid.dart';
import '../widgets/save_transaction_bar.dart';
import '../widgets/transaction_date_row.dart';
import '../widgets/transaction_notes_card.dart';
import '../widgets/transaction_type_selector.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({
    super.key,
    required this.onBackHome,
    required this.onSaveComplete,
  });

  final VoidCallback onBackHome;
  final VoidCallback onSaveComplete;

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  static const double _maxContentWidth = 460;
  static final DateTime _initialDate = DateTime(2023, 10, 24);

  late final TextEditingController _amountController;
  late final TextEditingController _notesController;
  late final FocusNode _amountFocusNode;
  late final FocusNode _notesFocusNode;

  TransactionType _selectedType = TransactionType.expense;
  String? _selectedCategoryId;
  DateTime _selectedDate = _initialDate;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(text: '0.00');
    _notesController = TextEditingController();
    _amountFocusNode = FocusNode();
    _notesFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _notesController.dispose();
    _amountFocusNode.dispose();
    _notesFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: _maxContentWidth),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.xl,
                    94,
                    AppSpacing.xl,
                    176,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TransactionTypeSelector(
                        selectedType: _selectedType,
                        onTypeChanged: (TransactionType type) {
                          setState(() {
                            _selectedType = type;
                          });
                        },
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      AmountEntrySection(
                        controller: _amountController,
                        focusNode: _amountFocusNode,
                      ),
                      const SizedBox(height: AppSpacing.xxl),
                      Text(
                        'Select Category',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      CategorySelectorGrid(
                        categories: addTransactionCategories,
                        selectedCategoryId: _selectedCategoryId,
                        onCategorySelected: (MockTransactionCategory category) {
                          FocusScope.of(context).unfocus();
                          setState(() {
                            _selectedCategoryId = category.id;
                          });
                        },
                      ),
                      const SizedBox(height: AppSpacing.xxl),
                      TransactionDateRow(
                        selectedDate: _selectedDate,
                        onTap: _pickDate,
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      TransactionNotesCard(
                        controller: _notesController,
                        focusNode: _notesFocusNode,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AddTransactionTopBar(
              onBack: () {
                FocusScope.of(context).unfocus();
                widget.onBackHome();
              },
            ),
          ),
          Positioned(
            left: AppSpacing.xl,
            right: AppSpacing.xl,
            bottom: AppSpacing.lg,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: _maxContentWidth),
                child: SaveTransactionBar(onSave: _saveTransaction),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickDate() async {
    FocusScope.of(context).unfocus();

    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked == null) {
      return;
    }

    setState(() {
      _selectedDate = picked;
    });
  }

  void _saveTransaction() {
    FocusScope.of(context).unfocus();

    final amount = double.tryParse(_amountController.text);
    if (amount == null || amount <= 0) {
      _showMessage('Enter an amount greater than zero.');
      return;
    }

    final category = addTransactionCategories.where(
      (MockTransactionCategory item) => item.id == _selectedCategoryId,
    );

    if (category.isEmpty) {
      _showMessage('Choose a category before saving.');
      return;
    }

    final categoryLabel = category.first.label;
    final typeLabel = _selectedType == TransactionType.income
        ? 'income'
        : 'expense';

    _showMessage(
      'Saved $typeLabel of RM ${amount.toStringAsFixed(2)} for $categoryLabel.',
    );
    widget.onSaveComplete();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppColors.inverseSurface,
        ),
      );
  }
}
