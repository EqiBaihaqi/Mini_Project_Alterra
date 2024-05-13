import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:your_comfort_food/page/onboarding_page/widgets/screen_1.dart';

void main() {
  testWidgets('Harus ada Text \'Includge in Culinary Delights!\'',
      (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: Screen1(),
      ),
    );
    final text = find.text('Includge in Culinary Delights!');
    expect(text, findsOneWidget);
  });
}
