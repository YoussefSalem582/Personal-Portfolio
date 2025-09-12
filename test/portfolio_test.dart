import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_portfolio/main.dart';
import 'package:personal_portfolio/theme/app_theme.dart';
import 'package:personal_portfolio/utils/portfolio_data.dart';

void main() {
  group('Portfolio App Tests', () {
    testWidgets('App should build without errors', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const PortfolioApp());

      // Wait for animations to complete
      await tester.pumpAndSettle();

      // Verify that the app loads successfully
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('Hero section should display name and title', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const PortfolioApp());
      await tester.pumpAndSettle();

      // Look for the developer's name
      expect(find.text(PortfolioData.fullName), findsWidgets);
      expect(find.text(PortfolioData.title), findsWidgets);
    });

    testWidgets('Navigation should be present', (WidgetTester tester) async {
      await tester.pumpWidget(const PortfolioApp());
      await tester.pumpAndSettle();

      // Check for navigation items
      expect(find.text('About'), findsWidgets);
      expect(find.text('Projects'), findsWidgets);
      expect(find.text('Skills'), findsWidgets);
      expect(find.text('Contact'), findsWidgets);
    });

    testWidgets('Theme should be applied correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const PortfolioApp());

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.theme, equals(AppTheme.lightTheme));
    });
  });

  group('Portfolio Data Tests', () {
    test('Portfolio data should be populated', () {
      expect(PortfolioData.fullName, isNotEmpty);
      expect(PortfolioData.title, isNotEmpty);
      expect(PortfolioData.bio, isNotEmpty);
      expect(PortfolioData.projects, isNotEmpty);
      expect(PortfolioData.skills, isNotEmpty);
      expect(PortfolioData.socialLinks, isNotEmpty);
      expect(PortfolioData.contactInfo.email, isNotEmpty);
    });

    test('Featured projects should be correctly identified', () {
      final featuredProjects = PortfolioData.featuredProjects;
      expect(featuredProjects, isNotEmpty);
      expect(featuredProjects.length, lessThanOrEqualTo(3));

      for (final project in featuredProjects) {
        expect(project.isFeatured, true);
      }
    });

    test('Skills should be categorized', () {
      expect(PortfolioData.skills, hasLength(greaterThan(0)));

      for (final category in PortfolioData.skills) {
        expect(category.name, isNotEmpty);
        expect(category.skills, isNotEmpty);

        for (final skill in category.skills) {
          expect(skill.name, isNotEmpty);
          expect(skill.proficiency, inInclusiveRange(1, 5));
        }
      }
    });
  });

  group('Theme Tests', () {
    test('Color palette should be defined', () {
      expect(AppTheme.primaryColor, isNotNull);
      expect(AppTheme.accentColor, isNotNull);
      expect(AppTheme.surfaceColor, isNotNull);
      expect(AppTheme.textPrimary, isNotNull);
      expect(AppTheme.textSecondary, isNotNull);
    });

    test('Text styles should be defined', () {
      expect(AppTheme.headingLarge, isNotNull);
      expect(AppTheme.headingMedium, isNotNull);
      expect(AppTheme.headingSmall, isNotNull);
      expect(AppTheme.bodyLarge, isNotNull);
      expect(AppTheme.bodyMedium, isNotNull);
      expect(AppTheme.bodySmall, isNotNull);
    });

    test('Spacing constants should be defined', () {
      expect(AppTheme.spacingXS, greaterThan(0));
      expect(AppTheme.spacingS, greaterThan(AppTheme.spacingXS));
      expect(AppTheme.spacingM, greaterThan(AppTheme.spacingS));
      expect(AppTheme.spacingL, greaterThan(AppTheme.spacingM));
      expect(AppTheme.spacingXL, greaterThan(AppTheme.spacingL));
      expect(AppTheme.spacingXXL, greaterThan(AppTheme.spacingXL));
    });
  });
}
