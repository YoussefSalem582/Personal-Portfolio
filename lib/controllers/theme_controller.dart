import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

class ThemeController extends GetxController {
  // Observable theme mode
  final Rx<ThemeMode> _themeMode = ThemeMode.system.obs;

  ThemeMode get themeMode => _themeMode.value;
  bool get isDarkMode {
    if (_themeMode.value == ThemeMode.system) {
      // Check system brightness
      return Get.isDarkMode;
    }
    return _themeMode.value == ThemeMode.dark;
  }

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromStorage();
  }

  void _loadThemeFromStorage() {
    if (kIsWeb) {
      try {
        // Default to system theme preference
        _themeMode.value = ThemeMode.system;
      } catch (e) {
        // Fallback to system theme if localStorage is not available
        _themeMode.value = ThemeMode.system;
      }
    } else {
      // Default to system theme on non-web platforms
      _themeMode.value = ThemeMode.system;
    }
  }

  void _saveThemeToStorage() {
    if (kIsWeb) {
      try {
        // For now, we'll skip localStorage to avoid dart:html issues
        // This can be implemented later with proper conditional imports
      } catch (e) {
        // Handle localStorage not available
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
