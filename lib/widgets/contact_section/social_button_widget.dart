import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// A custom button widget for displaying social media platform links.
///
/// This widget creates an outlined button with an icon and platform name.
/// The icon is automatically selected based on the platform name (GitHub, LinkedIn, etc.).
/// When tapped, it opens the social media profile in an external browser.
class SocialButtonWidget extends StatelessWidget {
  /// The name of the social media platform (e.g., "GitHub", "LinkedIn")
  final String title;

  /// The icon path (currently unused, icon is determined by platform name)
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
    final accentColor =
        isDark ? AppTheme.darkAccentColor : AppTheme.accentColor;

    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        foregroundColor: accentColor,
        side: BorderSide(color: accentColor.withValues(alpha: 0.3)),
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingM,
          vertical: AppTheme.spacingS,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Platform-specific icon
          Icon(
            _getIconForPlatform(title),
            color: accentColor,
            size: 18,
          ),
          const SizedBox(width: 8),
          // Platform name
          Text(title),
        ],
      ),
    );
  }

  /// Maps social media platform names to Material Icons.
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
        return Icons.play_arrow;
      case 'upwork':
        return Icons.work_outline;
      default:
        return Icons.link;
    }
  }
}
