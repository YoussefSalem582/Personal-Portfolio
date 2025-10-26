import 'package:flutter/material.dart';

/// App Colors - Centralized color definitions
/// Used throughout the app for consistent theming
class AppColors {
  // Prevent instantiation
  AppColors._();

  // ==================== Light Theme Colors ====================

  /// Primary color - Dark blue
  static const Color primaryLight = Color(0xFF2C3E50);

  /// Accent color - Bright blue
  static const Color accentLight = Color(0xFF3498DB);

  /// Background color - Very light gray
  static const Color backgroundLight = Color(0xFFF8F9FA);

  /// Surface color - White
  static const Color surfaceLight = Color(0xFFFFFFFF);

  /// Text primary - Dark
  static const Color textPrimaryLight = Color(0xFF2C3E50);

  /// Text secondary - Gray
  static const Color textSecondaryLight = Color(0xFF7F8C8D);

  /// Error color
  static const Color errorLight = Color(0xFFE74C3C);

  /// Success color
  static const Color successLight = Color(0xFF27AE60);

  /// Warning color
  static const Color warningLight = Color(0xFFF39C12);

  /// Info color
  static const Color infoLight = Color(0xFF3498DB);

  // ==================== Dark Theme Colors ====================

  /// Primary color - Bright blue
  static const Color primaryDark = Color(0xFF3498DB);

  /// Accent color - Light blue
  static const Color accentDark = Color(0xFF5DADE2);

  /// Background color - Very dark
  static const Color backgroundDark = Color(0xFF0D1117);

  /// Surface color - Dark gray
  static const Color surfaceDark = Color(0xFF161B22);

  /// Card color - Slightly lighter dark
  static const Color cardDark = Color(0xFF21262D);

  /// Text primary - Light
  static const Color textPrimaryDark = Color(0xFFF0F6FC);

  /// Text secondary - Muted gray
  static const Color textSecondaryDark = Color(0xFF8B949E);

  /// Error color (same for dark)
  static const Color errorDark = Color(0xFFE74C3C);

  /// Success color (same for dark)
  static const Color successDark = Color(0xFF27AE60);

  /// Warning color (same for dark)
  static const Color warningDark = Color(0xFFF39C12);

  /// Info color (same for dark)
  static const Color infoDark = Color(0xFF5DADE2);

  // ==================== Gradients ====================

  /// Primary gradient - Light theme
  static const LinearGradient primaryGradientLight = LinearGradient(
    colors: [primaryLight, accentLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Card gradient - Light theme
  static const LinearGradient cardGradientLight = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFF8F9FA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Primary gradient - Dark theme
  static const LinearGradient primaryGradientDark = LinearGradient(
    colors: [primaryDark, accentDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Card gradient - Dark theme
  static const LinearGradient cardGradientDark = LinearGradient(
    colors: [cardDark, surfaceDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Accent gradient - Light theme
  static const LinearGradient accentGradientLight = LinearGradient(
    colors: [accentLight, Color(0xFF2980B9)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Accent gradient - Dark theme
  static const LinearGradient accentGradientDark = LinearGradient(
    colors: [accentDark, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Success gradient
  static const LinearGradient successGradient = LinearGradient(
    colors: [Color(0xFF27AE60), Color(0xFF2ECC71)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Error gradient
  static const LinearGradient errorGradient = LinearGradient(
    colors: [Color(0xFFE74C3C), Color(0xFFC0392B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Warning gradient
  static const LinearGradient warningGradient = LinearGradient(
    colors: [Color(0xFFF39C12), Color(0xFFE67E22)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Gold gradient (for featured badges)
  static const LinearGradient goldGradient = LinearGradient(
    colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ==================== Skill Colors ====================

  /// Dart color
  static const Color dartColor = Color(0xFF0175C2);

  /// Python color
  static const Color pythonColor = Color(0xFF3776AB);

  /// Java color
  static const Color javaColor = Color(0xFFE76F00);

  /// C++ color
  static const Color cppColor = Color(0xFF00599C);

  /// JavaScript color
  static const Color javascriptColor = Color(0xFFF7DF1E);

  /// SQL color
  static const Color sqlColor = Color(0xFF4479A1);

  /// Flutter color
  static const Color flutterColor = Color(0xFF02569B);

  /// Firebase color
  static const Color firebaseColor = Color(0xFFFFCA28);

  /// Supabase color
  static const Color supabaseColor = Color(0xFF3ECF8E);

  /// GitHub color
  static const Color githubColor = Color(0xFF222222);

  /// Figma color
  static const Color figmaColor = Color(0xFFF24E1E);

  /// REST API color
  static const Color restApiColor = Color(0xFFFF6C37);

  // ==================== Utility Colors ====================

  /// Transparent
  static const Color transparent = Colors.transparent;

  /// Black
  static const Color black = Colors.black;

  /// White
  static const Color white = Colors.white;

  /// Gray scale
  static const Color gray50 = Color(0xFFFAFAFA);
  static const Color gray100 = Color(0xFFF5F5F5);
  static const Color gray200 = Color(0xFFEEEEEE);
  static const Color gray300 = Color(0xFFE0E0E0);
  static const Color gray400 = Color(0xFFBDBDBD);
  static const Color gray500 = Color(0xFF9E9E9E);
  static const Color gray600 = Color(0xFF757575);
  static const Color gray700 = Color(0xFF616161);
  static const Color gray800 = Color(0xFF424242);
  static const Color gray900 = Color(0xFF212121);

  // ==================== Helper Methods ====================

  /// Get primary color based on theme brightness
  static Color getPrimary(bool isDark) => isDark ? primaryDark : primaryLight;

  /// Get accent color based on theme brightness
  static Color getAccent(bool isDark) => isDark ? accentDark : accentLight;

  /// Get background color based on theme brightness
  static Color getBackground(bool isDark) =>
      isDark ? backgroundDark : backgroundLight;

  /// Get surface color based on theme brightness
  static Color getSurface(bool isDark) => isDark ? surfaceDark : surfaceLight;

  /// Get text primary color based on theme brightness
  static Color getTextPrimary(bool isDark) =>
      isDark ? textPrimaryDark : textPrimaryLight;

  /// Get text secondary color based on theme brightness
  static Color getTextSecondary(bool isDark) =>
      isDark ? textSecondaryDark : textSecondaryLight;

  /// Get primary gradient based on theme brightness
  static LinearGradient getPrimaryGradient(bool isDark) =>
      isDark ? primaryGradientDark : primaryGradientLight;

  /// Get card gradient based on theme brightness
  static LinearGradient getCardGradient(bool isDark) =>
      isDark ? cardGradientDark : cardGradientLight;

  /// Get accent gradient based on theme brightness
  static LinearGradient getAccentGradient(bool isDark) =>
      isDark ? accentGradientDark : accentGradientLight;

  /// Get color with opacity
  static Color withOpacity(Color color, double opacity) =>
      color.withOpacity(opacity);

  /// Get skill color by skill ID
  static Color getSkillColor(String skillId) {
    switch (skillId.toLowerCase()) {
      case 'dart':
        return dartColor;
      case 'python':
        return pythonColor;
      case 'java':
        return javaColor;
      case 'cpp':
      case 'c++':
        return cppColor;
      case 'javascript':
      case 'js':
        return javascriptColor;
      case 'sql':
        return sqlColor;
      case 'flutter':
        return flutterColor;
      case 'firebase':
        return firebaseColor;
      case 'supabase':
        return supabaseColor;
      case 'github':
        return githubColor;
      case 'figma':
        return figmaColor;
      case 'rest-api':
      case 'api':
        return restApiColor;
      default:
        return accentLight;
    }
  }
}
