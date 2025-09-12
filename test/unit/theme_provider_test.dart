import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/shared/providers/theme_provider.dart';

void main() {
  group('ThemeModeNotifier Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('should initialize with system theme mode', () {
      final themeMode = container.read(themeModeProvider);
      expect(themeMode, ThemeMode.system);
    });

    test('should toggle between light and dark themes', () async {
      final notifier = container.read(themeModeProvider.notifier);

      // Set to light mode first
      await notifier.setThemeMode(ThemeMode.light);
      expect(container.read(themeModeProvider), ThemeMode.light);

      // Toggle should switch to dark
      await notifier.toggleTheme();
      expect(container.read(themeModeProvider), ThemeMode.dark);

      // Toggle again should switch to light
      await notifier.toggleTheme();
      expect(container.read(themeModeProvider), ThemeMode.light);
    });

    test('should set specific theme mode', () async {
      final notifier = container.read(themeModeProvider.notifier);

      await notifier.setThemeMode(ThemeMode.dark);
      expect(container.read(themeModeProvider), ThemeMode.dark);

      await notifier.setThemeMode(ThemeMode.system);
      expect(container.read(themeModeProvider), ThemeMode.system);
    });
  });

  group('Theme Helper Methods Tests', () {
    testWidgets('should correctly identify dark mode',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: ThemeMode.dark,
            home: Builder(
              builder: (context) {
                final container = ProviderScope.containerOf(context);
                final notifier = container.read(themeModeProvider.notifier);
                final isDark = notifier.isDarkMode(context);

                return Scaffold(
                  body: Text(isDark ? 'Dark' : 'Light'),
                );
              },
            ),
          ),
        ),
      );

      expect(find.text('Dark'), findsOneWidget);
    });
  });
}
