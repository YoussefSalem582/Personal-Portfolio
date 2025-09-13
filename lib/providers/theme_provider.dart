import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// Web-only import for localStorage
import 'dart:html' as html show window;

class ThemeProvider extends ChangeNotifier {
  static const String _themeKey = 'theme_mode';

  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  ThemeProvider() {
    _loadThemeFromStorage();
  }

  void _loadThemeFromStorage() {
    if (kIsWeb) {
      try {
        final savedTheme = html.window.localStorage[_themeKey];
        if (savedTheme != null) {
          _themeMode = savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
        } else {
          // Default to dark mode if no preference is saved
          _themeMode = ThemeMode.dark;
        }
        notifyListeners();
      } catch (e) {
        // Fallback to dark mode if localStorage is not available
        _themeMode = ThemeMode.dark;
      }
    }
  }

  void _saveThemeToStorage() {
    if (kIsWeb) {
      try {
        html.window.localStorage[_themeKey] =
            _themeMode == ThemeMode.dark ? 'dark' : 'light';
      } catch (e) {
        // Handle localStorage not available
        debugPrint('Could not save theme preference: $e');
      }
    }
  }

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _saveThemeToStorage();
    notifyListeners();
  }

  void setTheme(ThemeMode mode) {
    if (_themeMode != mode) {
      _themeMode = mode;
      _saveThemeToStorage();
      notifyListeners();
    }
  }
}
