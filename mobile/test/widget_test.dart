import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/main.dart';

void main() {
  testWidgets('dashboard shell renders the home overview', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Hello, Alfred'), findsOneWidget);
    expect(find.text('Total balance'), findsOneWidget);
    expect(find.text('Recent transactions'), findsOneWidget);
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.byIcon(Icons.home_rounded), findsWidgets);
  });

  testWidgets('bottom navigation opens placeholder destinations', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.receipt_long_outlined));
    await tester.pumpAndSettle();

    expect(find.text('Your full history will live here soon.'), findsOneWidget);
    expect(find.text('Hello, Alfred'), findsNothing);
  });
}
