import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/assets/app_constants.dart';
import '../controllers/theme_controller.dart';

class ThemeToggle extends StatelessWidget {
  final bool isCompact;

  const ThemeToggle({super.key, this.isCompact = false});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(() {
      final isDark = themeController.isDarkMode;

      return IconButton(
        icon: Icon(
          isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
          size: isCompact ? 20 : 22,
        ),
        color: isDark ? AppColors.accentDark : AppColors.accentLight,
        onPressed: themeController.toggleTheme,
        tooltip: isDark ? 'Light Mode' : 'Dark Mode',
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minWidth: isCompact ? 32 : 40,
          minHeight: isCompact ? 32 : 40,
        ),
      );
    });
  }
}

class ThemeToggleSwitch extends StatelessWidget {
  const ThemeToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(() {
      return Container(
        width: 56,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: themeController.isDarkMode
              ? AppColors.accentDark
              : AppColors.accentLight.withValues(alpha: 0.3),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              left: themeController.isDarkMode ? 30 : 2,
              top: 2,
              child: GestureDetector(
                onTap: themeController.toggleTheme,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: themeController.isDarkMode
                        ? AppColors.surfaceDark
                        : AppColors.surfaceLight,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: 0.2),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Icon(
                    themeController.isDarkMode
                        ? AppIcons.darkMode
                        : AppIcons.lightMode,
                    size: 14,
                    color: themeController.isDarkMode
                        ? AppColors.accentDark
                        : AppColors.accentLight,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
