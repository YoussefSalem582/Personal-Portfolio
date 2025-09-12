class ResponsiveHelper {
  static bool isMobile(double width) => width < 768;
  static bool isTablet(double width) => width >= 768 && width < 1024;
  static bool isDesktop(double width) => width >= 1024;

  static bool isMobileOrTablet(double width) => width < 1024;

  static int getGridColumns(double width) {
    if (isMobile(width)) return 1;
    if (isTablet(width)) return 2;
    return 3;
  }

  static double getMaxWidth(double screenWidth) {
    if (screenWidth > 1200) return 1200;
    return screenWidth * 0.9;
  }

  static double getHorizontalPadding(double width) {
    if (isMobile(width)) return 16.0;
    if (isTablet(width)) return 32.0;
    return 64.0;
  }
}
