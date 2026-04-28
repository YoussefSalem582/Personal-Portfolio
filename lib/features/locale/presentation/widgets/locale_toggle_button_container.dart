import 'package:flutter/material.dart';

import '../../../../utils/assets/app_constants.dart';
import 'locale_toggle_button.dart';

/// Styled container wrapping [LocaleToggleButton] to match [ThemeToggleButtonContainer].
class LocaleToggleButtonContainer extends StatelessWidget {
  final bool isDark;
  final bool isCompact;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const LocaleToggleButtonContainer({
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
                  AppColors.white.withOpacity(0.08),
                  AppColors.white.withOpacity(0.04),
                ]
              : [
                  AppColors.black.withOpacity(0.04),
                  AppColors.black.withOpacity(0.02),
                ],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark
              ? AppColors.white.withOpacity(0.12)
              : AppColors.black.withOpacity(0.08),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? AppColors.black.withOpacity(0.2)
                : AppColors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: LocaleToggleButton(isDark: isDark, isCompact: isCompact),
    );
  }
}
