import 'package:flutter/material.dart';
import '../../utils/app_constants.dart';
import '../../utils/data/portfolio_data.dart';
import '../../utils/url_helper.dart';

import '../../theme/app_theme.dart';

/// Widget displaying social media profile links as icon buttons.
///
/// Shows:
/// - "Connect With Me" heading
/// - Wrapped row of social media icon buttons
/// - Icons for GitHub, LinkedIn, YouTube, Upwork, etc.
///
/// Each icon is clickable and opens the corresponding social profile in a browser.
/// Icons are determined by platform name using the _getIconForPlatform method.
class SocialLinksWidget extends StatelessWidget {
  const SocialLinksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        // Section heading
        Text(
          'Connect With Me',
          style: (isDark ? AppFonts.h3() : AppFonts.h3()).copyWith(
            color: isDark ? AppColors.white : AppColors.gray900,
            fontWeight: AppFonts.bold,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: AppTheme.spacingL),

        // Wrapped row of social buttons
        Wrap(
          spacing: AppTheme.spacingM,
          runSpacing: AppTheme.spacingM,
          alignment: WrapAlignment.center,
          children: PortfolioData.socialLinks
              .map((social) => _buildSocialButton(social))
              .toList(),
        ),
      ],
    );
  }

  /// Builds a single social media icon button.
  ///
  /// Creates a rounded square container with an icon that represents
  /// the social platform. Clicking the button opens the social profile URL.
  Widget _buildSocialButton(social) {
    return InkWell(
      onTap: () => UrlHelper.launchURL(social.url),
      borderRadius: BorderRadius.circular(AppTheme.radiusL),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.accentLight.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
          border: Border.all(
            color: AppColors.accentLight.withValues(alpha: 0.2),
          ),
        ),
        child: Icon(
          _getIconForPlatform(social.name),
          color: AppColors.accentLight,
          size: 24,
        ),
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
