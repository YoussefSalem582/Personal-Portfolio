import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';
import '../../theme/app_theme.dart';

/// Skills Section Header Widget
/// Displays the title and description for the skills section
class SkillsSectionHeader extends StatelessWidget {
  final bool isDark;
  final bool isMobile;

  const SkillsSectionHeader({
    super.key,
    required this.isDark,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallMobile = screenWidth < 375;

    return Column(
      children: [
        // Title with gradient effect
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: isDark
                ? [AppColors.primaryLight, AppColors.accentLight]
                : [AppColors.accentLight, AppColors.primaryLight],
          ).createShader(bounds),
          child: Text(
            'My Tech Stack',
            style: isMobile
                ? AppFonts.h3(color: AppColors.white).copyWith(
                    fontSize: isSmallMobile ? 28 : 32,
                    fontWeight: AppFonts.extraBold,
                    letterSpacing: -0.5,
                  )
                : AppFonts.h2(color: AppColors.white).copyWith(
                    fontWeight: AppFonts.extraBold,
                    letterSpacing: -1,
                  ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: isMobile ? AppTheme.spacingS : AppTheme.spacingM),

        // Decorative gradient underline
        Container(
          width: isMobile ? (isSmallMobile ? 50 : 60) : 80,
          height: isMobile ? 3 : 4,
          decoration: BoxDecoration(
            gradient: isDark
                ? AppColors.primaryGradientDark
                : AppColors.primaryGradientLight,
            borderRadius: BorderRadius.circular(3),
            boxShadow: [
              BoxShadow(
                color: (isDark ? AppColors.primaryLight : AppColors.accentLight)
                    .withOpacity(0.4),
                blurRadius: 12,
                spreadRadius: 2,
              ),
            ],
          ),
        ),

        SizedBox(height: isMobile ? AppTheme.spacingM : AppTheme.spacingL),

        // Description
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? AppTheme.spacingM : 0,
          ),
          child: Container(
            constraints:
                BoxConstraints(maxWidth: isMobile ? double.infinity : 700),
            child: Text(
              'A collection of technologies I am proficient in and enjoy working with.',
              style:
                  AppFonts.bodyLarge(color: AppColors.getTextSecondary(isDark))
                      .copyWith(
                fontSize: isMobile ? (isSmallMobile ? 14 : 15) : null,
                height: 1.5,
                letterSpacing: 0.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
