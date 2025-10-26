import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/assets/app_constants.dart';

import '../../theme/app_theme.dart';

/// A custom button widget for displaying social media platform links.
///
/// This widget creates an outlined button with an SVG icon and platform name.
/// The icon is automatically selected based on the platform name (GitHub, LinkedIn, etc.).
/// When tapped, it opens the social media profile in an external browser.
class SocialButtonWidget extends StatelessWidget {
  /// The name of the social media platform (e.g., "GitHub", "LinkedIn")
  final String title;

  /// The icon path (SVG or PNG) for the social platform
  final String iconPath;

  /// Callback function to execute when the button is pressed
  /// Typically launches the social media URL
  final VoidCallback onTap;

  const SocialButtonWidget({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Get theme-specific accent color
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor = isDark ? AppColors.accentDark : AppColors.accentLight;
    final svgIconPath = AppIcons.getSocialIconSvg(title);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppTheme.radiusM),
          hoverColor: accentColor.withOpacity(0.1),
          splashColor: accentColor.withOpacity(0.2),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingM,
              vertical: AppTheme.spacingS,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isDark
                    ? [
                        AppColors.cardDark.withOpacity(0.8),
                        AppColors.surfaceDark.withOpacity(0.8),
                      ]
                    : [
                        AppColors.white,
                        AppColors.surfaceLight,
                      ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              border: Border.all(
                color: accentColor.withOpacity(0.3),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? AppColors.black.withOpacity(0.2)
                      : accentColor.withOpacity(0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Platform-specific SVG icon
                if (svgIconPath != null)
                  _buildIconWidget(svgIconPath, accentColor)
                else
                  Icon(
                    _getIconForPlatform(title),
                    color: accentColor,
                    size: 20,
                  ),
                const SizedBox(width: AppTheme.spacingS),
                // Platform name
                Text(
                  title,
                  style: TextStyle(
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the icon widget (SVG or PNG)
  Widget _buildIconWidget(String iconPath, Color color) {
    if (iconPath.endsWith('.svg')) {
      return SvgPicture.asset(
        iconPath,
        width: 24,
        height: 24,
        fit: BoxFit.contain,
        //colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      );
    } else {
      // For PNG and other image formats
      return Image.asset(
        iconPath,
        width: 24,
        height: 24,
        fit: BoxFit.contain,
        color: color,
      );
    }
  }

  /// Maps social media platform names to Material Icons (fallback).
  ///
  /// Returns an appropriate icon based on the platform name:
  /// - GitHub: code icon
  /// - LinkedIn: work icon
  /// - YouTube: play_arrow icon
  /// - Upwork: work_outline icon
  /// - Default: generic link icon
  IconData _getIconForPlatform(String name) {
    switch (name.toLowerCase()) {
      case 'github':
        return Icons.code;
      case 'linkedin':
        return Icons.work;
      case 'youtube':
        return Icons.play_circle_outline;
      case 'upwork':
        return Icons.work;
      default:
        return AppIcons.website;
    }
  }
}
