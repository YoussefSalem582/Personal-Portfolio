import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';
import '../../theme/app_theme.dart';

/// Common Info Card Widget
/// Reusable card for displaying information with icon, title, and content
class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? borderColor;
  final EdgeInsets? padding;
  final double? iconSize;
  final double borderRadius;
  final double borderWidth;
  final bool useGradientIcon;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
    this.backgroundColor,
    this.iconColor,
    this.borderColor,
    this.padding,
    this.iconSize,
    this.borderRadius = AppTheme.radiusM,
    this.borderWidth = 1.5,
    this.useGradientIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor =
        iconColor ?? (isDark ? AppColors.accentDark : AppColors.accentLight);

    return Container(
      padding: padding ?? const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (isDark
                ? AppColors.surfaceDark.withValues(alpha: 0.5)
                : AppColors.gray50),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ??
              (isDark
                  ? AppColors.textSecondaryDark.withValues(alpha: 0.15)
                  : AppColors.gray200),
          width: borderWidth,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIcon(accentColor),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(
            child: _buildContent(isDark),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(Color accentColor) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: useGradientIcon
            ? LinearGradient(
                colors: [
                  accentColor.withValues(alpha: 0.15),
                  accentColor.withValues(alpha: 0.05),
                ],
              )
            : null,
        color: useGradientIcon ? null : accentColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, size: iconSize ?? 22, color: accentColor),
    );
  }

  Widget _buildContent(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.bodySmall().copyWith(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
            fontWeight: AppFonts.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          content,
          style: AppFonts.bodyMedium().copyWith(
            color:
                isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            fontWeight: AppFonts.regular,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
