import 'package:flutter/material.dart';
import '../../utils/app_constants.dart';
import '../../utils/responsive_helper.dart';
import '../../widgets/about_section/bio_section_widget.dart';
import '../../widgets/about_section/stats_section_widget.dart';

import '../../theme/app_theme.dart';

/// The about section of the portfolio displaying biographical information and statistics.
///
/// Enhanced with:
/// - Gradient background for depth
/// - Animated gradient text on title
/// - Larger, bolder typography
/// - Improved spacing and visual hierarchy
/// - Glassmorphism effect
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions and responsive settings
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: isDark
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.surfaceDark,
                  AppColors.cardDark.withOpacity(0.5),
                ],
              )
            : LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.surfaceLight,
                  AppColors.gray50,
                ],
              ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
        vertical:
            isMobile ? AppTheme.spacingXXL * 1.5 : AppTheme.spacingXXL * 2,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ResponsiveHelper.getMaxWidth(screenWidth),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Section title with gradient effect
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: isDark
                    ? [AppColors.primaryLight, AppColors.accentLight]
                    : [AppColors.accentLight, AppColors.primaryLight],
              ).createShader(bounds),
              child: Text(
                'About Me',
                style: (isDark ? AppFonts.h1() : AppFonts.h1()).copyWith(
                  fontSize: isMobile ? 36 : 48,
                  fontWeight: AppFonts.extraBold,
                  letterSpacing: -1,
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: AppTheme.spacingM),

            // Decorative gradient underline with glow
            Container(
              width: isMobile ? 70 : 90,
              height: 5,
              decoration: BoxDecoration(
                gradient: isDark
                    ? AppColors.primaryGradientDark
                    : AppColors.primaryGradientLight,
                borderRadius: BorderRadius.circular(3),
                boxShadow: [
                  BoxShadow(
                    color: (isDark
                            ? AppColors.primaryLight
                            : AppColors.accentLight)
                        .withOpacity(0.4),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppTheme.spacingL),

            // Subtitle description
            Text(
              'Discover my journey, skills, and passion for technology',
              style: (isDark ? AppFonts.bodyLarge() : AppFonts.bodyLarge())
                  .copyWith(
                fontSize: isMobile ? 15 : 17,
                color: isDark
                    ? AppColors.textSecondaryDark.withOpacity(0.9)
                    : AppColors.textSecondaryLight,
                letterSpacing: 0.3,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(
                height: isMobile
                    ? AppTheme.spacingXXL * 1.5
                    : AppTheme.spacingXXL * 2),

            // Content - responsive layout
            // Mobile: Stack vertically (bio above stats)
            if (isMobile)
              const Column(
                children: [
                  BioSectionWidget(),
                  SizedBox(height: AppTheme.spacingXXL),
                  StatsSectionWidget(),
                ],
              )
            // Desktop: Display side by side (bio 66% | stats 33%)
            else
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side - Bio and contact info (2/3 width)
                  Expanded(flex: 2, child: BioSectionWidget()),
                  SizedBox(width: AppTheme.spacingXXL),
                  // Right side - Stats and actions (1/3 width)
                  Expanded(child: StatsSectionWidget()),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
