import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/main.dart';

void main() {
  testWidgets('dashboard shell renders the home overview', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('The Fluid Ledger'), findsOneWidget);
    expect(find.text('Total Balance'), findsOneWidget);
    expect(find.text('Monthly Overview'), findsOneWidget);
    expect(find.text('Recent Transactions'), findsOneWidget);
    expect(find.text('Monthly Budget'), findsOneWidget);
    expect(find.byType(NavigationBar), findsOneWidget);
  });

  testWidgets('view all opens the transactions history screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final viewAllButton = find.ancestor(
      of: find.text('View All'),
      matching: find.byType(TextButton),
    );
    final button = tester.widget<TextButton>(viewAllButton);
    button.onPressed!.call();
    await tester.pumpAndSettle();

    expect(find.text('Search transactions...'), findsOneWidget);
    expect(find.text('TODAY'), findsOneWidget);
    expect(find.text('YESTERDAY'), findsOneWidget);
    expect(find.text('MAY 15'), findsOneWidget);
  });

  testWidgets('bottom navigation opens transactions history', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.receipt_long_outlined));
    await tester.pumpAndSettle();

    expect(find.text('Artisan Espresso'), findsOneWidget);
    expect(find.text('May 24, 09:15 AM'), findsOneWidget);
    expect(find.text('-RM 6.50'), findsOneWidget);
    expect(find.text('Food & Drink'), findsOneWidget);
    expect(find.text('+RM 1,200.00'), findsOneWidget);
    expect(find.text('Income'), findsOneWidget);
  });

  testWidgets('add transaction tab renders the real entry screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Add Transaction'));
    await tester.pumpAndSettle();

    expect(find.byTooltip('Back to home'), findsOneWidget);
    expect(find.text('Transaction Amount'), findsOneWidget);
    expect(find.text('Select Category'), findsOneWidget);
    expect(find.text('Date'), findsOneWidget);
    expect(find.text('Notes'), findsOneWidget);
    expect(find.text('Save Transaction'), findsOneWidget);
  });

  testWidgets('dashboard quick action opens add transaction screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(find.text('Add'), 300);
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();

    expect(find.text('Save Transaction'), findsOneWidget);
    expect(
      find.byKey(const Key('add_transaction_amount_input')),
      findsOneWidget,
    );
  });

  testWidgets('back arrow returns from add transaction to home', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Add Transaction'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Back to home'));
    await tester.pumpAndSettle();

    expect(find.text('Total Balance'), findsOneWidget);
    expect(find.byTooltip('Back to home'), findsNothing);
  });

  testWidgets('save transaction shows feedback and returns home', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Add Transaction'));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byKey(const Key('add_transaction_amount_input')),
      '82.40',
    );
    final foodCategoryTile = find.ancestor(
      of: find.text('Food').first,
      matching: find.byType(InkWell),
    );
    await tester.scrollUntilVisible(
      foodCategoryTile.first,
      120,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.drag(find.byType(Scrollable).first, const Offset(0, 120));
    await tester.pumpAndSettle();
    await tester.tap(foodCategoryTile.first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save Transaction'));
    await tester.pump();

    expect(find.text('Saved expense of RM 82.40 for Food.'), findsOneWidget);
    expect(find.text('Total Balance'), findsOneWidget);
  });

  testWidgets('search narrows visible transaction history', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.receipt_long_outlined));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byKey(const Key('transactions_search_input')),
      'Rent',
    );
    await tester.pumpAndSettle();

    expect(find.text('Monthly Rent'), findsOneWidget);
    expect(find.text('Artisan Espresso'), findsNothing);
    expect(find.text('Freelance Project'), findsNothing);
  });

  testWidgets('filter sheet can show income-only transactions', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.receipt_long_outlined));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('transactions_filter_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('transaction_filter_income')));
    await tester.pumpAndSettle();

    expect(find.text('Freelance Project'), findsOneWidget);
    expect(find.text('+RM 1,200.00'), findsOneWidget);
    expect(find.text('Artisan Espresso'), findsNothing);
    expect(find.text('Monthly Rent'), findsNothing);
  });

  testWidgets('no-match search shows empty state and opens add transaction', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.receipt_long_outlined));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byKey(const Key('transactions_search_input')),
      'Nope',
    );
    await tester.pumpAndSettle();

    expect(find.text('No matching transactions yet'), findsOneWidget);

    await tester.tap(
      find.byKey(const Key('transactions_empty_state_add_button')),
    );
    await tester.pumpAndSettle();

    expect(find.text('Save Transaction'), findsOneWidget);
    expect(find.byTooltip('Back to home'), findsOneWidget);
  });
}
