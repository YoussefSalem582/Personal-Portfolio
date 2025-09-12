import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provider for managing theme mode
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(),
);

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.system) {
    _loadThemeMode();
  }

  static const String _themeModeKey = 'theme_mode';

  /// Load theme mode from shared preferences
  Future<void> _loadThemeMode() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeModeString = prefs.getString(_themeModeKey);

      if (themeModeString != null) {
        switch (themeModeString) {
          case 'light':
            state = ThemeMode.light;
            break;
          case 'dark':
            state = ThemeMode.dark;
            break;
          case 'system':
          default:
            state = ThemeMode.system;
            break;
        }
      }
    } catch (e) {
      // If there's an error loading preferences, keep default system theme
      state = ThemeMode.system;
    }
  }

  /// Toggle between light and dark themes
  Future<void> toggleTheme() async {
    final newThemeMode =
        state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    await setThemeMode(newThemeMode);
  }

  /// Set specific theme mode
  Future<void> setThemeMode(ThemeMode themeMode) async {
    state = themeMode;

    try {
      final prefs = await SharedPreferences.getInstance();
      String themeModeString;

      switch (themeMode) {
        case ThemeMode.light:
          themeModeString = 'light';
          break;
        case ThemeMode.dark:
          themeModeString = 'dark';
          break;
        case ThemeMode.system:
          themeModeString = 'system';
          break;
      }

      await prefs.setString(_themeModeKey, themeModeString);
    } catch (e) {
      // Handle error saving preferences
      debugPrint('Error saving theme mode: $e');
    }
  }

  /// Get current theme brightness considering system theme
  Brightness getCurrentBrightness(BuildContext context) {
    switch (state) {
      case ThemeMode.light:
        return Brightness.light;
      case ThemeMode.dark:
        return Brightness.dark;
      case ThemeMode.system:
        return MediaQuery.of(context).platformBrightness;
    }
  }

  /// Check if current theme is dark
  bool isDarkMode(BuildContext context) {
    return getCurrentBrightness(context) == Brightness.dark;
  }
}
