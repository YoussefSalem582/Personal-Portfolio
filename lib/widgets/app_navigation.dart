import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';
import 'navigation/desktop_app_bar.dart';
import 'navigation/mobile_app_bar.dart';
import 'navigation/mobile_drawer.dart';

/// Main navigation widget that handles both desktop and mobile layouts
class AppNavigation extends StatelessWidget {
  final Function(int) onItemSelected;
  final int currentIndex;

  const AppNavigation({
    super.key,
    required this.onItemSelected,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (ResponsiveHelper.isMobile(screenWidth)) {
      return MobileAppBar(
        onItemSelected: onItemSelected,
      );
    } else {
      return DesktopAppBar(
        onItemSelected: onItemSelected,
        currentIndex: currentIndex,
      );
    }
  }

  /// Factory method to build the drawer for mobile
  static Widget buildDrawer(
      BuildContext context, Function(int) onItemSelected, int currentIndex) {
    return MobileDrawer(
      onItemSelected: onItemSelected,
      currentIndex: currentIndex,
    );
  }
}
