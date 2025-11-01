import 'package:flutter/material.dart';

class ResponsiveHelper {
  // Breakpoints
  static const double mobileBreakpoint = 768;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;

  // Device type checks
  static bool isMobile(double width) => width < mobileBreakpoint;
  static bool isTablet(double width) =>
      width >= mobileBreakpoint && width < tabletBreakpoint;
  static bool isDesktop(double width) => width >= tabletBreakpoint;
  static bool isMobileOrTablet(double width) => width < tabletBreakpoint;

  // Enhanced size checks for more granular control
  static bool isSmallMobile(double width) => width < 375;
  static bool isLargeMobile(double width) =>
      width >= 375 && width < mobileBreakpoint;
  static bool isLargeDesktop(double width) => width >= desktopBreakpoint;

  // Grid columns for different layouts
  static int getGridColumns(double width) {
    if (isSmallMobile(width)) return 1;
    if (isMobile(width)) return 1;
    if (isTablet(width)) return 2;
    if (isLargeDesktop(width)) return 4;
    return 3;
  }

  // Project card columns (more specific)
  static int getProjectGridColumns(double width) {
    if (isMobile(width)) return 2;
    if (isTablet(width)) return 2;
    return 3;
  }

  // Certificate card columns
  static int getCertificateGridColumns(double width) {
    if (isSmallMobile(width)) return 1;
    if (isMobile(width)) return 2;
    if (isTablet(width)) return 3;
    return 4;
  }

  // Skill card columns
  static int getSkillGridColumns(double width) {
    if (isSmallMobile(width)) return 2;
    if (isMobile(width)) return 2;
    if (isTablet(width)) return 4;
    return 5;
  }

  // Max width constraints
  static double getMaxWidth(double screenWidth) {
    if (screenWidth > 1400) return 1400;
    if (screenWidth > 1200) return 1200;
    return screenWidth * 0.92;
  }

  // Responsive horizontal padding
  static double getHorizontalPadding(double width) {
    if (isSmallMobile(width)) return 12.0;
    if (isMobile(width)) return 16.0;
    if (isTablet(width)) return 32.0;
    if (isLargeDesktop(width)) return 80.0;
    return 64.0;
  }

  // Responsive vertical padding
  static double getVerticalPadding(double width) {
    if (isSmallMobile(width)) return 40.0;
    if (isMobile(width)) return 60.0;
    if (isTablet(width)) return 80.0;
    return 100.0;
  }

  // Responsive spacing
  static double getSpacing(double width) {
    if (isMobile(width)) return 12.0;
    if (isTablet(width)) return 16.0;
    return 24.0;
  }

  // Font size scaling
  static double getFontSize(double width, double baseSize) {
    if (isSmallMobile(width)) return baseSize * 0.85;
    if (isMobile(width)) return baseSize * 0.9;
    if (isLargeDesktop(width)) return baseSize * 1.1;
    return baseSize;
  }

  // Heading font sizes
  static double getHeadingSize(double width, {bool isLarge = false}) {
    final double baseSize = isLarge ? 48 : 36;
    if (isSmallMobile(width)) return baseSize * 0.65;
    if (isMobile(width)) return baseSize * 0.75;
    if (isTablet(width)) return baseSize * 0.85;
    if (isLargeDesktop(width)) return baseSize * 1.15;
    return baseSize;
  }

  // Body text sizes
  static double getBodySize(double width, {bool isLarge = false}) {
    final double baseSize = isLarge ? 18 : 16;
    if (isSmallMobile(width)) return baseSize * 0.875;
    if (isMobile(width)) return baseSize * 0.9375;
    return baseSize;
  }

  // Section spacing
  static double getSectionSpacing(double width) {
    if (isSmallMobile(width)) return 60.0;
    if (isMobile(width)) return 80.0;
    if (isTablet(width)) return 100.0;
    return 120.0;
  }

  // Card dimensions
  static double getCardHeight(double width, {bool isCompact = false}) {
    if (isCompact) {
      if (isMobile(width)) return 180.0;
      return 190.0;
    }
    if (isMobile(width)) return 200.0;
    return 220.0;
  }

  // Image dimensions
  static double getImageHeight(double width, {bool isCompact = false}) {
    if (isCompact) {
      if (isMobile(width)) return 135.0;
      return 145.0;
    }
    if (isMobile(width)) return 150.0;
    return 165.0;
  }

  // Button sizes
  static EdgeInsets getButtonPadding(double width) {
    if (isMobile(width)) {
      return const EdgeInsets.symmetric(horizontal: 20, vertical: 12);
    }
    return const EdgeInsets.symmetric(horizontal: 28, vertical: 14);
  }

  // Icon sizes
  static double getIconSize(double width) {
    if (isMobile(width)) return 20.0;
    if (isTablet(width)) return 22.0;
    return 24.0;
  }
}
