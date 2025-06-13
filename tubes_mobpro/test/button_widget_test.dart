import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';

void main() {
  // Mock callback for testing button presses
  late VoidCallback mockCallback;

  setUp(() {
    mockCallback = () {};
  });

  group('ButtonWidget', () {
    testWidgets('ButtonWidget.primary renders correctly',
        (WidgetTester tester) async {
      // Build primary button
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ButtonWidget.primary(
            label: 'Primary Button',
            press: mockCallback,
          ),
        ),
      ));

      // Verify button exists
      expect(find.text('Primary Button'), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);

      // Verify button properties
      final TextButton button = tester.widget(find.byType(TextButton));
      expect(button.onPressed, equals(mockCallback));

      // Get the style and safely check the background color
      final ButtonStyle style = button.style!;
      final backgroundColor =
          style.backgroundColor as MaterialStateProperty<Color?>;

      // Get the color for the default state
      final Color? actualColor = backgroundColor.resolve({});
      expect(actualColor, equals(AppColors.B400));

      // Verify text style
      final Text textWidget = tester.widget(find.text('Primary Button'));
      expect(textWidget.style!.color, equals(AppColors.N0));
    });

    testWidgets('ButtonWidget.secondary renders correctly',
        (WidgetTester tester) async {
      // Build secondary button
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ButtonWidget.secondary(
            label: 'Secondary Button',
            press: mockCallback,
          ),
        ),
      ));

      // Verify button exists
      expect(find.text('Secondary Button'), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);

      // Verify button properties
      final TextButton button = tester.widget(find.byType(TextButton));
      expect(button.onPressed, equals(mockCallback));

      // Get the style and safely check the background color
      final ButtonStyle style = button.style!;
      final backgroundColor =
          style.backgroundColor as MaterialStateProperty<Color?>;

      // Get the color for the default state
      final Color? actualColor = backgroundColor.resolve({});
      expect(actualColor, equals(AppColors.N700));

      // Verify text style
      final Text textWidget = tester.widget(find.text('Secondary Button'));
      expect(textWidget.style!.color, equals(AppColors.N0));
    });

    testWidgets('ButtonWidget.primary can be tapped',
        (WidgetTester tester) async {
      bool buttonPressed = false;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ButtonWidget.primary(
            label: 'Tap Me',
            press: () {
              buttonPressed = true;
            },
          ),
        ),
      ));

      // Tap the button
      await tester.tap(find.byType(TextButton));
      await tester.pump();

      // Verify callback was executed
      expect(buttonPressed, isTrue);
    });
  });

  group('ButtonOutlineWidget', () {
    testWidgets('ButtonOutlineWidget renders correctly without icon',
        (WidgetTester tester) async {
      // Build outline button without icon
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ButtonOutlineWidget(
            label: 'Outline Button',
            press: mockCallback,
          ),
        ),
      ));

      // Verify button exists
      expect(find.text('Outline Button'), findsOneWidget);
      expect(find.byType(OutlinedButton), findsOneWidget);

      // Verify there's no icon
      expect(find.byType(Gap), findsNothing);

      // Verify button properties
      final OutlinedButton button = tester.widget(find.byType(OutlinedButton));
      expect(button.onPressed, equals(mockCallback));

      // Verify text style
      final Text textWidget = tester.widget(find.text('Outline Button'));
      expect(textWidget.style!.fontSize, equals(16));
      expect(textWidget.style!.fontWeight, equals(FontWeight.w500));
      expect(textWidget.style!.color, equals(Colors.black));
    });

    testWidgets('ButtonOutlineWidget renders correctly with icon',
        (WidgetTester tester) async {
      // Create a test icon
      const testIcon = Icon(Icons.add);

      // Build outline button with icon
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ButtonOutlineWidget(
            label: 'Outline Button With Icon',
            press: mockCallback,
            icon: testIcon,
          ),
        ),
      ));

      // Verify button exists
      expect(find.text('Outline Button With Icon'), findsOneWidget);
      expect(find.byType(OutlinedButton), findsOneWidget);

      // Verify icon is present
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byType(Gap), findsOneWidget);

      // Verify layout
      final Row buttonRow = tester.widget(find.byType(Row).first);
      expect(buttonRow.mainAxisAlignment, equals(MainAxisAlignment.center));
    });

    testWidgets('ButtonOutlineWidget can be tapped',
        (WidgetTester tester) async {
      bool buttonPressed = false;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ButtonOutlineWidget(
            label: 'Tap Me',
            press: () {
              buttonPressed = true;
            },
          ),
        ),
      ));

      // Tap the button
      await tester.tap(find.byType(OutlinedButton));
      await tester.pump();

      // Verify callback was executed
      expect(buttonPressed, isTrue);
    });
  });
}
