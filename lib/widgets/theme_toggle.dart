import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_constants.dart';
import '../controllers/theme_controller.dart';

class ThemeToggle extends StatelessWidget {
  final bool isCompact;

  const ThemeToggle({super.key, this.isCompact = false});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(() {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: InkWell(
          onTap: themeController.toggleTheme,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(isCompact ? 8 : 12),
            decoration: BoxDecoration(
              color: themeController.isDarkMode
                  ? AppColors.surfaceDark
                  : AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: themeController.isDarkMode
                    ? AppColors.accentDark.withValues(alpha: 0.3)
                    : AppColors.accentLight.withValues(alpha: 0.3),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: themeController.isDarkMode
                      ? AppColors.black.withValues(alpha: 0.2)
                      : AppColors.black.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    themeController.isDarkMode
                        ? AppIcons.darkMode
                        : AppIcons.lightMode,
                    color: themeController.isDarkMode
                        ? AppColors.accentDark
                        : AppColors.accentLight,
                    size: isCompact ? 18 : 20,
                  ),
                ),
                if (!isCompact) ...[
                  const SizedBox(width: 8),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: Text(
                      themeController.isDarkMode ? 'Dark' : 'Light',
                      key: ValueKey(themeController.isDarkMode),
                      style: AppFonts.labelMedium(
                        color: themeController.isDarkMode
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ).copyWith(fontWeight: AppFonts.medium),
                    ),
                  ),
                ],
              ],
            ),
          ),
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
