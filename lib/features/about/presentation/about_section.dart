import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../l10n/app_localizations.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/assets/app_constants.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../core/widgets/about_section/bio_section_widget.dart';
import '../../../core/widgets/about_section/stats_section_widget.dart';
import 'bloc/about_bloc.dart';
import 'bloc/about_state.dart';

/// The about section of the portfolio displaying biographical information and statistics.
///
/// Enhanced with:
/// - Gradient background for depth
/// - Animated gradient text on title
/// - Larger, bolder typography
/// - Improved spacing and visual hierarchy
/// - Glassmorphism effect
class AboutSection extends StatelessWidget {
  final VoidCallback? onNavigateToContact;

  const AboutSection({super.key, this.onNavigateToContact});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions and responsive settings
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final isSmallMobile = ResponsiveHelper.isSmallMobile(screenWidth);
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
            : const LinearGradient(
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
        vertical: ResponsiveHelper.getVerticalPadding(screenWidth),
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
                AppLocalizations.of(context).sectionAboutTitle,
                style: (isDark ? AppFonts.h1() : AppFonts.h1()).copyWith(
                  fontSize: isMobile
                      ? (isSmallMobile ? 32 : 38)
                      : ResponsiveHelper.getHeadingSize(screenWidth,
                          isLarge: false),
                  fontWeight: AppFonts.extraBold,
                  letterSpacing: isMobile ? -0.5 : -1,
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: isMobile ? AppTheme.spacingS : AppTheme.spacingM),

            // Decorative gradient underline with glow
            Container(
              width: isSmallMobile ? 50 : (isMobile ? 70 : 90),
              height: isSmallMobile ? 4 : 5,
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? AppTheme.spacingM : 0,
              ),
              child: Text(
                AppLocalizations.of(context).aboutTagline,
                style: (isDark ? AppFonts.bodyLarge() : AppFonts.bodyLarge())
                    .copyWith(
                  fontSize: isMobile
                      ? (isSmallMobile ? 14 : 15)
                      : ResponsiveHelper.getBodySize(screenWidth,
                          isLarge: true),
                  color: isDark
                      ? AppColors.textSecondaryDark.withOpacity(0.9)
                      : AppColors.textSecondaryLight,
                  letterSpacing: 0.3,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(
                height:
                    isMobile ? AppTheme.spacingXL : AppTheme.spacingXXL * 2),

            BlocBuilder<AboutBloc, AboutState>(
              builder: (context, state) {
                if (state is AboutFailure) {
                  return Text(state.message);
                }
                if (state is! AboutLoaded) {
                  return const Padding(
                    padding: EdgeInsets.all(32),
                    child: CircularProgressIndicator(),
                  );
                }
                final c = state.content;
                if (isMobile) {
                  return Column(
                    children: [
                      BioSectionWidget(
                        onNavigateToContact: onNavigateToContact,
                        email: c.email,
                      ),
                      const SizedBox(height: AppTheme.spacingXXL),
                      StatsSectionWidget(
                        projectsCount: c.projectsCount,
                        technologiesCount: c.technologiesCount,
                        resumeUrl: c.resumeUrl,
                        socialLinks: c.socialLinks,
                      ),
                    ],
                  );
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: BioSectionWidget(
                        onNavigateToContact: onNavigateToContact,
                        email: c.email,
                      ),
                    ),
                    const SizedBox(width: AppTheme.spacingXXL),
                    Expanded(
                      child: StatsSectionWidget(
                        projectsCount: c.projectsCount,
                        technologiesCount: c.technologiesCount,
                        resumeUrl: c.resumeUrl,
                        socialLinks: c.socialLinks,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
