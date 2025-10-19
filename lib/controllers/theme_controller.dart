import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

class ThemeController extends GetxController {
  // Observable theme mode
  final Rx<ThemeMode> _themeMode = ThemeMode.dark.obs;

  ThemeMode get themeMode => _themeMode.value;
  bool get isDarkMode => _themeMode.value == ThemeMode.dark;

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromStorage();
  }

  void _loadThemeFromStorage() {
    if (kIsWeb) {
      try {
        // Default to dark mode since localStorage is complex
        _themeMode.value = ThemeMode.dark;
      } catch (e) {
        // Fallback to dark mode if localStorage is not available
        _themeMode.value = ThemeMode.dark;
      }
    } else {
      // Default to dark mode on non-web platforms
      _themeMode.value = ThemeMode.dark;
    }
  }

  void _saveThemeToStorage() {
    if (kIsWeb) {
      try {
        // For now, we'll skip localStorage to avoid dart:html issues
        // This can be implemented later with proper conditional imports
        debugPrint(
            'Theme saved: ${_themeMode.value == ThemeMode.dark ? 'dark' : 'light'}');
      } catch (e) {
        // Handle localStorage not available
        debugPrint('Could not save theme preference: $e');
      }
    }
  }

  void toggleTheme() {
    _themeMode.value =
        _themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _saveThemeToStorage();

    // Update GetX theme
    Get.changeThemeMode(_themeMode.value);
  }

  void setTheme(ThemeMode mode) {
    if (_themeMode.value != mode) {
      _themeMode.value = mode;
      _saveThemeToStorage();

      // Update GetX theme
      Get.changeThemeMode(mode);
    }
  }

  void setLightTheme() => setTheme(ThemeMode.light);
  void setDarkTheme() => setTheme(ThemeMode.dark);
  void setSystemTheme() => setTheme(ThemeMode.system);
}
