import 'package:flutter/material.dart';
import '../utils/assets/app_constants.dart';

class AppTheme {
  // Re-export colors from AppColors for backward compatibility
  static const Color primaryColor = AppColors.primaryLight;
  static const Color accentColor = AppColors.accentLight;
  static const Color backgroundColor = AppColors.backgroundLight;
  static const Color surfaceColor = AppColors.surfaceLight;
  static const Color textPrimary = AppColors.textPrimaryLight;
  static const Color textSecondary = AppColors.textSecondaryLight;
  static const Color errorColor = AppColors.errorLight;
  static const Color successColor = AppColors.successLight;

  // Dark theme colors
  static const Color darkPrimaryColor = AppColors.primaryDark;
  static const Color darkAccentColor = AppColors.accentDark;
  static const Color darkBackgroundColor = AppColors.backgroundDark;
  static const Color darkSurfaceColor = AppColors.surfaceDark;
  static const Color darkTextPrimary = AppColors.textPrimaryDark;
  static const Color darkTextSecondary = AppColors.textSecondaryDark;
  static const Color darkCardColor = AppColors.cardDark;

  // Re-export gradients from AppColors
  static const LinearGradient primaryGradient = AppColors.primaryGradientLight;
  static const LinearGradient cardGradient = AppColors.cardGradientLight;
  static const LinearGradient darkPrimaryGradient =
      AppColors.primaryGradientDark;
  static const LinearGradient darkCardGradient = AppColors.cardGradientDark;

  // Re-export text styles from AppFonts for backward compatibility
  static TextStyle get headingLarge => AppFonts.h1(color: textPrimary);
  static TextStyle get headingMedium => AppFonts.h3(color: textPrimary);
  static TextStyle get headingSmall => AppFonts.h5(color: textPrimary);
  static TextStyle get bodyLarge => AppFonts.bodyLarge(color: textSecondary);
  static TextStyle get bodyMedium => AppFonts.bodyMedium(color: textSecondary);
  static TextStyle get bodySmall => AppFonts.bodySmall(color: textSecondary);
  static TextStyle get button => AppFonts.button(color: surfaceColor);

  // Context-aware text styles using AppFonts
  static TextStyle headingLargeForTheme(BuildContext context) {
    return AppFonts.h1ForTheme(context);
  }

  static TextStyle headingMediumForTheme(BuildContext context) {
    return AppFonts.h3ForTheme(context);
  }

  static TextStyle headingSmallForTheme(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AppFonts.h5(color: isDark ? darkTextPrimary : textPrimary);
  }

  static TextStyle bodyLargeForTheme(BuildContext context) {
    return AppFonts.bodyForTheme(context, isLarge: true);
  }

  static TextStyle bodyMediumForTheme(BuildContext context) {
    return AppFonts.bodyForTheme(context);
  }

  static TextStyle bodySmallForTheme(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AppFonts.bodySmall(
        color: isDark ? darkTextSecondary : textSecondary);
  }

  // Theme data
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        primary: primaryColor,
        secondary: accentColor,
        surface: surfaceColor,
        error: errorColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: textPrimary),
        titleTextStyle: headingSmall,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: surfaceColor,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: button,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: const BorderSide(color: primaryColor, width: 2),
          textStyle: button.copyWith(color: primaryColor),
        ),
      ),
      cardTheme: const CardThemeData(
        elevation: 4,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        color: surfaceColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: textSecondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: accentColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: errorColor),
        ),
        fillColor: surfaceColor,
        filled: true,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: darkPrimaryColor,
        brightness: Brightness.dark,
        primary: darkPrimaryColor,
        secondary: darkAccentColor,
        surface: darkSurfaceColor,
        error: errorColor,
      ),
      scaffoldBackgroundColor: darkBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: darkTextPrimary),
        titleTextStyle: AppFonts.h5(color: darkTextPrimary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkPrimaryColor,
          foregroundColor: darkTextPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: AppFonts.button(),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: darkPrimaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: const BorderSide(color: darkPrimaryColor, width: 2),
          textStyle: AppFonts.button(color: darkPrimaryColor),
        ),
      ),
      cardTheme: const CardThemeData(
        elevation: 4,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        color: darkCardColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: darkTextSecondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: darkAccentColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: errorColor),
        ),
        fillColor: darkSurfaceColor,
        filled: true,
        labelStyle: AppFonts.bodyMedium(color: darkTextSecondary),
        hintStyle: AppFonts.bodyMedium(color: darkTextSecondary),
      ),
    );
  }

  // Responsive breakpoints
  static const double mobileBreakpoint = 768;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1200;

  // Spacing
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;

  // Border radius
  static const double radiusS = 4.0;
  static const double radiusM = 8.0;
  static const double radiusL = 12.0;
  static const double radiusXL = 16.0;
}
