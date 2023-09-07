import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ui_rendering_engine/main.dart';
// import 'package:ui_rendering_engine/screens/screens.dart';

void main() {
  testWidgets('Ensure the app does not have any text field', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(TextField), findsNothing);
  });

  testWidgets('Ensure the app does not use alarm icon', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byIcon(Icons.alarm), findsNothing);
  });
}
