import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../utils/responsive_helper.dart';
import '../../widgets/about_section/bio_section_widget.dart';
import '../../widgets/about_section/stats_section_widget.dart';

/// The about section of the portfolio displaying biographical information and statistics.
///
/// This section provides two main components:
/// 1. BioSectionWidget - Shows bio text and contact information
/// 2. StatsSectionWidget - Displays stats, resume download, and social links
///
/// The layout is responsive:
/// - Desktop: Side-by-side layout (bio: 66%, stats: 33%)
/// - Mobile: Stacked layout (bio above stats)
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
      color: isDark ? AppTheme.darkSurfaceColor : AppTheme.surfaceColor,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
        vertical: AppTheme.spacingXXL,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ResponsiveHelper.getMaxWidth(screenWidth),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Section title
            Text(
              'About Me',
              style: (isDark
                      ? AppTheme.headingLargeForTheme(context)
                      : AppTheme.headingLarge)
                  .copyWith(fontSize: 36),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppTheme.spacingS),

            // Decorative gradient underline
            Container(
              width: 60,
              height: 4,
              decoration: BoxDecoration(
                gradient: isDark
                    ? AppTheme.darkPrimaryGradient
                    : AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            const SizedBox(height: AppTheme.spacingXXL),

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
