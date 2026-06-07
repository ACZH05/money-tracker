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

  testWidgets('view all opens the transactions placeholder', (
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

    expect(find.text('Your full history will live here soon.'), findsOneWidget);
    expect(find.text('The Fluid Ledger'), findsNothing);
  });

  testWidgets('bottom navigation opens placeholder destinations', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.receipt_long_outlined));
    await tester.pumpAndSettle();

    expect(find.text('Your full history will live here soon.'), findsOneWidget);
    expect(find.text('The Fluid Ledger'), findsNothing);
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
}
