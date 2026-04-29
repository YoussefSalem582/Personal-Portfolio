import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../locale/app_locale_binding.dart';

/// App Fonts - Centralized typography definitions
/// Used throughout the app for consistent text styling
class AppFonts {
  // Prevent instantiation
  AppFonts._();

  // ==================== Font Families ====================

  /// Primary font family — Tajawal for Arabic, Poppins for Latin UI
  static String get primaryFont => _isArabic ? 'Tajawal' : 'Poppins';

  /// Secondary font family — Tajawal for Arabic, Inter for Latin UI
  static String get secondaryFont => _isArabic ? 'Tajawal' : 'Inter';

  static bool get _isArabic => AppLocaleBinding.isArabic;

  // ==================== Font Weights ====================

  /// Thin - 100
  static const FontWeight thin = FontWeight.w100;

  /// Extra Light - 200
  static const FontWeight extraLight = FontWeight.w200;

  /// Light - 300
  static const FontWeight light = FontWeight.w300;

  /// Regular - 400
  static const FontWeight regular = FontWeight.w400;

  /// Medium - 500
  static const FontWeight medium = FontWeight.w500;

  /// Semi Bold - 600
  static const FontWeight semiBold = FontWeight.w600;

  /// Bold - 700
  static const FontWeight bold = FontWeight.w700;

  /// Extra Bold - 800
  static const FontWeight extraBold = FontWeight.w800;

  /// Black - 900
  static const FontWeight black = FontWeight.w900;

  // ==================== Font Sizes ====================

  /// Extra small - 10px
  static const double sizeXS = 10.0;

  /// Small - 12px
  static const double sizeS = 12.0;

  /// Medium - 14px
  static const double sizeM = 14.0;

  /// Large - 16px
  static const double sizeL = 16.0;

  /// Extra Large - 18px
  static const double sizeXL = 18.0;

  /// Heading 6 - 20px
  static const double sizeH6 = 20.0;

  /// Heading 5 - 24px
  static const double sizeH5 = 24.0;

  /// Heading 4 - 28px
  static const double sizeH4 = 28.0;

  /// Heading 3 - 32px
  static const double sizeH3 = 32.0;

  /// Heading 2 - 40px
  static const double sizeH2 = 40.0;

  /// Heading 1 - 48px
  static const double sizeH1 = 48.0;

  /// Display - 56px
  static const double sizeDisplay = 56.0;

  // ==================== Line Heights ====================

  /// Tight line height - 1.2
  static const double lineHeightTight = 1.2;

  /// Normal line height - 1.4
  static const double lineHeightNormal = 1.4;

  /// Relaxed line height - 1.5
  static const double lineHeightRelaxed = 1.5;

  /// Loose line height - 1.6
  static const double lineHeightLoose = 1.6;

  static const String _tajawalFamily = 'Tajawal';

  static FontWeight _tajawalWeight(FontWeight w) {
    final v = w.value;
    if (v <= 450) return FontWeight.w400;
    if (v <= 550) return FontWeight.w500;
    return FontWeight.w700;
  }

  static TextStyle _tajawalText({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
    double? height,
    double? letterSpacing,
    TextBaseline? textBaseline,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      fontFamily: _tajawalFamily,
      fontSize: fontSize,
      fontWeight: _tajawalWeight(fontWeight),
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      textBaseline: textBaseline,
      fontStyle: fontStyle,
    );
  }

  // ==================== Heading Styles ====================

  /// Display Large - 56px, Bold
  static TextStyle displayLarge({Color? color}) {
    if (_isArabic) {
      return _tajawalText(
        fontSize: sizeDisplay,
        fontWeight: bold,
        color: color,
        height: lineHeightTight,
      );
    }
    return GoogleFonts.poppins(
      fontSize: sizeDisplay,
      fontWeight: bold,
      color: color,
      height: lineHeightTight,
    );
  }

  /// Heading 1 - 48px, Bold
  static TextStyle h1({Color? color}) {
    if (_isArabic) {
      return _tajawalText(
        fontSize: sizeH1,
        fontWeight: bold,
        color: color,
        height: lineHeightTight,
      );
    }
    return GoogleFonts.poppins(
      fontSize: sizeH1,
      fontWeight: bold,
      color: color,
      height: lineHeightTight,
    );
  }

  /// Heading 2 - 40px, Bold
  static TextStyle h2({Color? color}) {
    if (_isArabic) {
      return _tajawalText(
        fontSize: sizeH2,
        fontWeight: bold,
        color: color,
        height: lineHeightTight,
      );
    }
    return GoogleFonts.poppins(
      fontSize: sizeH2,
      fontWeight: bold,
      color: color,
      height: lineHeightTight,
    );
  }

  /// Heading 3 - 32px, Bold
  static TextStyle h3({Color? color}) {
    if (_isArabic) {
      return _tajawalText(
        fontSize: sizeH3,
        fontWeight: bold,
        color: color,
        height: lineHeightNormal,
      );
    }
    return GoogleFonts.poppins(
      fontSize: sizeH3,
      fontWeight: bold,
      color: color,
      height: lineHeightNormal,
    );
  }

  /// Heading 4 - 28px, Semi Bold
  static TextStyle h4({Color? color}) {
    if (_isArabic) {
      return _tajawalText(
        fontSize: sizeH4,
        fontWeight: semiBold,
        color: color,
        height: lineHeightNormal,
      );
    }
    return GoogleFonts.poppins(
      fontSize: sizeH4,
      fontWeight: semiBold,
      color: color,
      height: lineHeightNormal,
    );
  }

  /// Heading 5 - 24px, Semi Bold
  static TextStyle h5({Color? color}) {
    if (_isArabic) {
      return _tajawalText(
        fontSize: sizeH5,
        fontWeight: semiBold,
        color: color,
        height: lineHeightNormal,
      );
    }
    return GoogleFonts.poppins(
      fontSize: sizeH5,
      fontWeight: semiBold,
      color: color,
      height: lineHeightNormal,
    );
  }

  /// Heading 6 - 20px, Semi Bold
  static TextStyle h6({Color? color}) {
    if (_isArabic) {
      return _tajawalText(
        fontSize: sizeH6,
        fontWeight: semiBold,
        color: color,
        height: lineHeightRelaxed,
      );
    }
    return GoogleFonts.poppins(
      fontSize: sizeH6,
      fontWeight: semiBold,
      color: color,
      height: lineHeightRelaxed,
    );
  }

  // ==================== Body Styles ====================

  /// Body Large - 18px, Regular
  static TextStyle bodyLarge({Color? color}) {
    if (_isArabic) {
      return _tajawalText(
        fontSize: sizeXL,
        fontWeight: regular,
        color: color,
        height: lineHeightLoose,
      );
    }
    return GoogleFonts.inter(
      fontSize: sizeXL,
      fontWeight: regular,
      color: color,
      height: lineHeightLoose,
    );
  }

  /// Body Medium - 16px, Regular
  static TextStyle bodyMedium({Color? color}) {
    if (_isArabic) {
      return _tajawalText(
        fontSize: sizeL,
        fontWeight: regular,
        color: color,
        height: lineHeightLoose,
      );
    }
    return GoogleFonts.inter(
      fontSize: sizeL,
      fontWeight: regular,
      color: color,
      height: lineHeightLoose,
    );
  }

  /// Body Small - 14px, Regular
  static TextStyle bodySmall({Color? color}) {
    if (_isArabic) {
      return _tajawalText(
        fontSize: sizeM,
        fontWeight: regular,
        color: color,
        height: lineHeightLoose,
      );
    }
    return GoogleFonts.inter(
      fontSize: sizeM,
      fontWeight: regular,
      color: color,
      height: lineHeightLoose,
    );
  }

  /// Body Extra Small - 12px, Regular
  static TextStyle bodyXS({Color? color}) {
    if (_isArabic) {
      return _tajawalText(
        fontSize: sizeS,
        fontWeight: regular,
        color: color,
        height: lineHeightNormal,
      );
    }
    return GoogleFonts.inter(
      fontSize: sizeS,
      fontWeight: regular,
      color: color,
      height: lineHeightNormal,
    );
  }

  // ==================== Special Styles ====================

  /// Button text - 16px, Semi Bold
  static TextStyle button({Color? color}) {
    if (_isArabic) {
      return _tajawalText(
        fontSize: sizeL,
        fontWeight: semiBold,
        color: color,
        letterSpacing: 0.5,
      );
    }
    return GoogleFonts.poppins(
      fontSize: sizeL,
      fontWeight: semiBold,
      color: color,
      letterSpacing: 0.5,
    );
  }

  /// Caption - 12px, Regular
  static TextStyle caption({Color? color}) {
    if (_isArabic) {
      return _tajawalText(
        fontSize: sizeS,
        fontWeight: regular,
        color: color,
        height: lineHeightNormal,
      );
    }
    return GoogleFonts.inter(
      fontSize: sizeS,
      fontWeight: regular,
      color: color,
      height: lineHeightNormal,
    );
  }

  /// Overline - 10px, Medium, Uppercase
  static TextStyle overline({Color? color}) {
    if (_isArabic) {
      return _tajawalText(
        fontSize: sizeXS,
        fontWeight: medium,
        color: color,
        letterSpacing: 1.5,
        height: lineHeightNormal,
        textBaseline: TextBaseline.alphabetic,
      );
    }
    return GoogleFonts.inter(
      fontSize: sizeXS,
      fontWeight: medium,
      color: color,
      letterSpacing: 1.5,
      height: lineHeightNormal,
    ).copyWith(
      textBaseline: TextBaseline.alphabetic,
    );
  }

  /// Label Large - 14px, Medium
  static TextStyle labelLarge({Color? color}) {
    if (_isArabic) {
      return _tajawalText(
        fontSize: sizeM,
        fontWeight: medium,
        color: color,
        letterSpacing: 0.1,
      );
    }
    return GoogleFonts.inter(
      fontSize: sizeM,
      fontWeight: medium,
      color: color,
      letterSpacing: 0.1,
    );
  }

  /// Label Medium - 12px, Medium
  static TextStyle labelMedium({Color? color}) {
    if (_isArabic) {
      return _tajawalText(
        fontSize: sizeS,
        fontWeight: medium,
        color: color,
        letterSpacing: 0.5,
      );
    }
    return GoogleFonts.inter(
      fontSize: sizeS,
      fontWeight: medium,
      color: color,
      letterSpacing: 0.5,
    );
  }

  /// Label Small - 10px, Medium
  static TextStyle labelSmall({Color? color}) {
    if (_isArabic) {
      return _tajawalText(
        fontSize: sizeXS,
        fontWeight: medium,
        color: color,
        letterSpacing: 0.5,
      );
    }
    return GoogleFonts.inter(
      fontSize: sizeXS,
      fontWeight: medium,
      color: color,
      letterSpacing: 0.5,
    );
  }

  // ==================== Code Styles ====================

  /// Code text - Monospace
  static TextStyle code({Color? color, double? fontSize}) =>
      GoogleFonts.firaCode(
        fontSize: fontSize ?? sizeM,
        fontWeight: regular,
        color: color,
        height: lineHeightRelaxed,
      );

  // ==================== Responsive Styles ====================

  /// Get responsive heading 1 based on screen width
  static TextStyle responsiveH1(double screenWidth, {Color? color}) {
    final fontSize = screenWidth < 600
        ? 32.0
        : screenWidth < 900
            ? 40.0
            : sizeH1;
    if (_isArabic) {
      return _tajawalText(
        fontSize: fontSize,
        fontWeight: bold,
        color: color,
        height: lineHeightTight,
      );
    }
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: bold,
      color: color,
      height: lineHeightTight,
    );
  }

  /// Get responsive heading 2 based on screen width
  static TextStyle responsiveH2(double screenWidth, {Color? color}) {
    final fontSize = screenWidth < 600
        ? 28.0
        : screenWidth < 900
            ? 32.0
            : sizeH2;
    if (_isArabic) {
      return _tajawalText(
        fontSize: fontSize,
        fontWeight: bold,
        color: color,
        height: lineHeightTight,
      );
    }
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: bold,
      color: color,
      height: lineHeightTight,
    );
  }

  /// Get responsive heading 3 based on screen width
  static TextStyle responsiveH3(double screenWidth, {Color? color}) {
    final fontSize = screenWidth < 600
        ? 24.0
        : screenWidth < 900
            ? 28.0
            : sizeH3;
    if (_isArabic) {
      return _tajawalText(
        fontSize: fontSize,
        fontWeight: bold,
        color: color,
        height: lineHeightNormal,
      );
    }
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: bold,
      color: color,
      height: lineHeightNormal,
    );
  }

  /// Get responsive body text based on screen width
  static TextStyle responsiveBody(double screenWidth, {Color? color}) {
    final fontSize = screenWidth < 600
        ? sizeM
        : screenWidth < 900
            ? sizeL
            : sizeXL;
    if (_isArabic) {
      return _tajawalText(
        fontSize: fontSize,
        fontWeight: regular,
        color: color,
        height: lineHeightLoose,
      );
    }
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: regular,
      color: color,
      height: lineHeightLoose,
    );
  }

  // ==================== Theme-Aware Styles ====================

  /// Get heading 1 with theme-aware color
  static TextStyle h1ForTheme(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark ? const Color(0xFFF0F6FC) : const Color(0xFF2C3E50);
    return h1(color: color);
  }

  /// Get heading 2 with theme-aware color
  static TextStyle h2ForTheme(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark ? const Color(0xFFF0F6FC) : const Color(0xFF2C3E50);
    return h2(color: color);
  }

  /// Get heading 3 with theme-aware color
  static TextStyle h3ForTheme(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark ? const Color(0xFFF0F6FC) : const Color(0xFF2C3E50);
    return h3(color: color);
  }

  /// Get heading 4 with theme-aware color
  static TextStyle h4ForTheme(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark ? const Color(0xFFF0F6FC) : const Color(0xFF2C3E50);
    return h4(color: color);
  }

  /// Get heading 5 with theme-aware color
  static TextStyle h5ForTheme(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark ? const Color(0xFFF0F6FC) : const Color(0xFF2C3E50);
    return h5(color: color);
  }

  /// Get body text with theme-aware color
  static TextStyle bodyForTheme(BuildContext context,
      {bool isLarge = false, bool isSecondary = false}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isSecondary
        ? (isDark ? const Color(0xFF8B949E) : const Color(0xFF7F8C8D))
        : (isDark ? const Color(0xFFC9D1D9) : const Color(0xFF57606A));
    return isLarge ? bodyLarge(color: color) : bodyMedium(color: color);
  }

  /// Get small body text with theme-aware color
  static TextStyle bodySmallForTheme(BuildContext context,
      {bool isSecondary = false}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isSecondary
        ? (isDark ? const Color(0xFF8B949E) : const Color(0xFF7F8C8D))
        : (isDark ? const Color(0xFFC9D1D9) : const Color(0xFF57606A));
    return bodySmall(color: color);
  }

  // ==================== Utility Methods ====================

  /// Copy style with modifications
  static TextStyle copyWith(
    TextStyle style, {
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return style.copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  /// Apply gradient to text style (returns ShaderMask widget wrapper)
  static ShaderMask applyGradient({
    required Widget child,
    required Gradient gradient,
  }) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(bounds),
      child: child,
    );
  }
}
