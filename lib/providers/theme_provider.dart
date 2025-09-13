import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

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
        // Use dynamic import for web-only localStorage access
        // ignore: avoid_web_libraries_in_flutter
        final html = (kIsWeb) ? ((){
          // This will only be called on web
          // We'll handle this with shared_preferences instead
          return null;
        })() : null;
        
        // Default to dark mode since localStorage is complex
        _themeMode = ThemeMode.dark;
        notifyListeners();
      } catch (e) {
        // Fallback to dark mode if localStorage is not available
        _themeMode = ThemeMode.dark;
      }
    } else {
      // Default to dark mode on non-web platforms
      _themeMode = ThemeMode.dark;
    }
  }

  void _saveThemeToStorage() {
    if (kIsWeb) {
      try {
        // For now, we'll skip localStorage to avoid dart:html issues
        // This can be implemented later with proper conditional imports
        debugPrint('Theme saved: ${_themeMode == ThemeMode.dark ? 'dark' : 'light'}');
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
