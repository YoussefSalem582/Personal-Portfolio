import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Light theme colors
  static const Color primaryColor = Color(0xFF2C3E50);
  static const Color accentColor = Color(0xFF3498DB);
  static const Color backgroundColor = Color(0xFFF8F9FA);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF2C3E50);
  static const Color textSecondary = Color(0xFF7F8C8D);
  static const Color errorColor = Color(0xFFE74C3C);
  static const Color successColor = Color(0xFF27AE60);

  // Dark theme colors
  static const Color darkPrimaryColor = Color(0xFF3498DB);
  static const Color darkAccentColor = Color(0xFF5DADE2);
  static const Color darkBackgroundColor = Color(0xFF0D1117);
  static const Color darkSurfaceColor = Color(0xFF161B22);
  static const Color darkTextPrimary = Color(0xFFF0F6FC);
  static const Color darkTextSecondary = Color(0xFF8B949E);
  static const Color darkCardColor = Color(0xFF21262D);

  // Light theme gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, accentColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFF8F9FA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Dark theme gradients
  static const LinearGradient darkPrimaryGradient = LinearGradient(
    colors: [darkPrimaryColor, darkAccentColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkCardGradient = LinearGradient(
    colors: [darkCardColor, darkSurfaceColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Text styles
  static TextStyle get headingLarge => GoogleFonts.poppins(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        height: 1.2,
      );

  static TextStyle get headingMedium => GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        height: 1.3,
      );

  static TextStyle get headingSmall => GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        height: 1.4,
      );

  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: textSecondary,
        height: 1.6,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: textSecondary,
        height: 1.5,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: textSecondary,
        height: 1.4,
      );

  static TextStyle get button => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: surfaceColor,
      );

  // Context-aware text styles
  static TextStyle headingLargeForTheme(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GoogleFonts.poppins(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: isDark ? darkTextPrimary : textPrimary,
      height: 1.2,
    );
  }

  static TextStyle headingMediumForTheme(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: isDark ? darkTextPrimary : textPrimary,
      height: 1.3,
    );
  }

  static TextStyle headingSmallForTheme(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: isDark ? darkTextPrimary : textPrimary,
      height: 1.4,
    );
  }

  static TextStyle bodyLargeForTheme(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: isDark ? darkTextSecondary : textSecondary,
      height: 1.6,
    );
  }

  static TextStyle bodyMediumForTheme(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: isDark ? darkTextSecondary : textSecondary,
      height: 1.5,
    );
  }

  static TextStyle bodySmallForTheme(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: isDark ? darkTextSecondary : textSecondary,
      height: 1.4,
    );
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
        background: backgroundColor,
        error: errorColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
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
        background: darkBackgroundColor,
        error: errorColor,
      ),
      scaffoldBackgroundColor: darkBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: darkTextPrimary),
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: darkTextPrimary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkPrimaryColor,
          foregroundColor: darkTextPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: darkPrimaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: const BorderSide(color: darkPrimaryColor, width: 2),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: darkPrimaryColor,
          ),
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
        labelStyle: GoogleFonts.inter(color: darkTextSecondary),
        hintStyle: GoogleFonts.inter(color: darkTextSecondary),
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
