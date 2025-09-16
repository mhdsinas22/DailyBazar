import 'package:bording_week1/views/otherscreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("HomeScreen UI test", (WidgetTester tester) async {
    // 1. Pump the HomeScreen widget
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    // 2. Check AppBar title text
    final addressFinder = find.text("ABCD, New Delhi");
    expect(addressFinder, findsOneWidget);

    // 3. Check search hint text
    expect(find.text("Search for products/stores"), findsOneWidget);

    // 4. Check "What would you like to do today?" text
    expect(find.text("What would you like to do today?"), findsOneWidget);

    // 5. Check "Trending" section present
    expect(find.text("Trending"), findsOneWidget);

    // 6. Check "Nearby stores" section present
    expect(find.text("Nearby stores"), findsOneWidget);

    // 7. Check Notification button exists
    expect(find.byIcon(Icons.notifications_outlined), findsOneWidget);
  });
}
