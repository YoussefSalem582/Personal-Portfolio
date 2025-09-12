import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_portfolio/main.dart';
import 'package:personal_portfolio/src/features/home/presentation/pages/home_page.dart';

void main() {
  group('Personal Portfolio App Tests', () {
    testWidgets('App should build without errors', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        const ProviderScope(
          child: PersonalPortfolioApp(),
        ),
      );

      // Verify that the app builds successfully
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('Home page should display hero section',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: HomePage(),
          ),
        ),
      );

      // Wait for all animations and builds to complete
      await tester.pumpAndSettle();

      // Verify that key elements are present
      expect(find.text('Youssef Salem Hassan'), findsOneWidget);
      expect(find.text('Flutter Developer & Mobile App Specialist'),
          findsOneWidget);
    });

    testWidgets('Theme toggle should work', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: PersonalPortfolioApp(),
        ),
      );

      // Wait for the app to load
      await tester.pumpAndSettle();

      // Find and tap the theme toggle button
      final themeToggle = find.byIcon(Icons.dark_mode);
      if (themeToggle.evaluate().isNotEmpty) {
        await tester.tap(themeToggle);
        await tester.pumpAndSettle();

        // Verify the icon changed
        expect(find.byIcon(Icons.light_mode), findsOneWidget);
      }
    });
  });

  group('Navigation Tests', () {
    testWidgets('Bottom navigation should work on mobile',
        (WidgetTester tester) async {
      // Set mobile screen size
      tester.binding.window.physicalSizeTestValue = const Size(400, 800);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(
        const ProviderScope(
          child: PersonalPortfolioApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Check if bottom navigation bar exists
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      // Find navigation items
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
      expect(find.text('Projects'), findsOneWidget);
    });
  });

  group('Responsive Layout Tests', () {
    testWidgets('Should show mobile layout on small screens',
        (WidgetTester tester) async {
      // Set mobile screen size
      tester.binding.window.physicalSizeTestValue = const Size(400, 800);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(
        const ProviderScope(
          child: PersonalPortfolioApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Verify mobile-specific elements
      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });

    testWidgets('Should show desktop layout on large screens',
        (WidgetTester tester) async {
      // Set desktop screen size
      tester.binding.window.physicalSizeTestValue = const Size(1200, 800);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(
        const ProviderScope(
          child: PersonalPortfolioApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Verify desktop-specific elements
      expect(find.byType(NavigationRail), findsOneWidget);
    });
  });
}
