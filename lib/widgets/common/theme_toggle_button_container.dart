import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';
import '../theme_toggle.dart';

/// Common Theme Toggle Button Container
/// Reusable styled container for theme toggle button
class ThemeToggleButtonContainer extends StatelessWidget {
  final bool isDark;
  final bool isCompact;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const ThemeToggleButtonContainer({
    super.key,
    required this.isDark,
    this.isCompact = true,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding ?? const EdgeInsets.all(4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [
                  AppColors.white.withValues(alpha: 0.08),
                  AppColors.white.withValues(alpha: 0.04),
                ]
              : [
                  AppColors.black.withValues(alpha: 0.04),
                  AppColors.black.withValues(alpha: 0.02),
                ],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark
              ? AppColors.white.withValues(alpha: 0.12)
              : AppColors.black.withValues(alpha: 0.08),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? AppColors.black.withValues(alpha: 0.2)
                : AppColors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ThemeToggle(isCompact: isCompact),
    );
  }
}
