import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/data/portfolio_data.dart';
import '../../utils/url_helper.dart';

import '../../theme/app_theme.dart';

/// Widget displaying social media profile links as icon buttons.
///
/// Shows:
/// - "Connect With Me" heading
/// - Wrapped row of social media icon buttons
/// - SVG icons for GitHub, LinkedIn, YouTube, Upwork, etc.
///
/// Each icon is clickable and opens the corresponding social profile in a browser.
/// Icons are determined by platform name using SVG assets from AppIcons.
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
  /// Creates a rounded square container with an SVG icon that represents
  /// the social platform. Clicking the button opens the social profile URL.
  Widget _buildSocialButton(dynamic social) {
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
        child: Center(
          child: _getIconForPlatform(social.name),
        ),
      ),
    );
  }

  /// Gets the appropriate icon widget for a social media platform.
  ///
  /// Returns an SVG or PNG icon for platforms with assets (GitHub, LinkedIn, YouTube, Upwork, Mostaql)
  /// or a Material Icon as fallback for other platforms.
  Widget _getIconForPlatform(String name) {
    // Try to get icon path first
    final iconPath = AppIcons.getSocialIconSvg(name);

    if (iconPath != null) {
      return _buildIconWidget(iconPath);
    }

    // Fallback to Material Icons
    IconData fallbackIcon;
    switch (name.toLowerCase()) {
      case 'github':
        fallbackIcon = Icons.code;
        break;
      case 'linkedin':
        fallbackIcon = Icons.work;
        break;
      case 'youtube':
        fallbackIcon = Icons.play_circle_outline;
        break;
      case 'upwork':
        fallbackIcon = Icons.work;
        break;
      case 'mostaql':
        fallbackIcon = Icons.work;
        break;
      default:
        fallbackIcon = AppIcons.website;
    }

    return Icon(
      fallbackIcon,
      color: AppColors.accentLight,
      size: 24,
    );
  }

  /// Builds icon widget based on file format (SVG or PNG).
  Widget _buildIconWidget(String iconPath) {
    // Check if it's an SVG or PNG/other image format
    if (iconPath.endsWith('.svg')) {
      return SvgPicture.asset(
        iconPath,
        width: 40,
        height: 40,
        fit: BoxFit.contain,
      );
    } else {
      // For PNG and other image formats
      return Image.asset(
        iconPath,
        width: 40,
        height: 40,
        fit: BoxFit.contain,
      );
    }
  }
}
