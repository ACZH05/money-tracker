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
}
