import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_portfolio/src/shared/widgets/responsive_layout.dart';

void main() {
  group('ResponsiveLayout Widget Tests', () {
    testWidgets('should show mobile layout on small screens',
        (WidgetTester tester) async {
      // Set mobile screen size
      tester.binding.window.physicalSizeTestValue = const Size(400, 800);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ResponsiveLayout(
              mobile: const Text('Mobile'),
              tablet: const Text('Tablet'),
              desktop: const Text('Desktop'),
            ),
          ),
        ),
      );

      expect(find.text('Mobile'), findsOneWidget);
      expect(find.text('Tablet'), findsNothing);
      expect(find.text('Desktop'), findsNothing);
    });

    testWidgets('should show tablet layout on medium screens',
        (WidgetTester tester) async {
      // Set tablet screen size
      tester.binding.window.physicalSizeTestValue = const Size(800, 600);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ResponsiveLayout(
              mobile: const Text('Mobile'),
              tablet: const Text('Tablet'),
              desktop: const Text('Desktop'),
            ),
          ),
        ),
      );

      expect(find.text('Mobile'), findsNothing);
      expect(find.text('Tablet'), findsOneWidget);
      expect(find.text('Desktop'), findsNothing);
    });

    testWidgets('should show desktop layout on large screens',
        (WidgetTester tester) async {
      // Set desktop screen size
      tester.binding.window.physicalSizeTestValue = const Size(1200, 800);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ResponsiveLayout(
              mobile: const Text('Mobile'),
              tablet: const Text('Tablet'),
              desktop: const Text('Desktop'),
            ),
          ),
        ),
      );

      expect(find.text('Mobile'), findsNothing);
      expect(find.text('Tablet'), findsNothing);
      expect(find.text('Desktop'), findsOneWidget);
    });

    testWidgets('should fallback to mobile when tablet not provided',
        (WidgetTester tester) async {
      // Set tablet screen size
      tester.binding.window.physicalSizeTestValue = const Size(800, 600);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ResponsiveLayout(
              mobile: const Text('Mobile'),
              // No tablet provided
              desktop: const Text('Desktop'),
            ),
          ),
        ),
      );

      expect(find.text('Mobile'), findsOneWidget);
      expect(find.text('Desktop'), findsNothing);
    });
  });

  group('ResponsiveLayout Helper Methods', () {
    testWidgets('should correctly identify mobile screens',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(400, 800);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              final isMobile = ResponsiveLayout.isMobile(context);
              final isTablet = ResponsiveLayout.isTablet(context);
              final isDesktop = ResponsiveLayout.isDesktop(context);

              return Scaffold(
                body: Column(
                  children: [
                    Text('Mobile: $isMobile'),
                    Text('Tablet: $isTablet'),
                    Text('Desktop: $isDesktop'),
                  ],
                ),
              );
            },
          ),
        ),
      );

      expect(find.text('Mobile: true'), findsOneWidget);
      expect(find.text('Tablet: false'), findsOneWidget);
      expect(find.text('Desktop: false'), findsOneWidget);
    });

    testWidgets('should correctly identify tablet screens',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(800, 600);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              final isMobile = ResponsiveLayout.isMobile(context);
              final isTablet = ResponsiveLayout.isTablet(context);
              final isDesktop = ResponsiveLayout.isDesktop(context);

              return Scaffold(
                body: Column(
                  children: [
                    Text('Mobile: $isMobile'),
                    Text('Tablet: $isTablet'),
                    Text('Desktop: $isDesktop'),
                  ],
                ),
              );
            },
          ),
        ),
      );

      expect(find.text('Mobile: false'), findsOneWidget);
      expect(find.text('Tablet: true'), findsOneWidget);
      expect(find.text('Desktop: false'), findsOneWidget);
    });

    testWidgets('should correctly identify desktop screens',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1200, 800);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              final isMobile = ResponsiveLayout.isMobile(context);
              final isTablet = ResponsiveLayout.isTablet(context);
              final isDesktop = ResponsiveLayout.isDesktop(context);

              return Scaffold(
                body: Column(
                  children: [
                    Text('Mobile: $isMobile'),
                    Text('Tablet: $isTablet'),
                    Text('Desktop: $isDesktop'),
                  ],
                ),
              );
            },
          ),
        ),
      );

      expect(find.text('Mobile: false'), findsOneWidget);
      expect(find.text('Tablet: false'), findsOneWidget);
      expect(find.text('Desktop: true'), findsOneWidget);
    });
  });
}
