import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../l10n/app_localizations.dart';
import '../../utils/assets/app_constants.dart';
import 'contact_info_list_widget.dart';

import '../../theme/app_theme.dart';

/// Widget displaying the biographical information section.
///
/// Enhanced with:
/// - Professional bio structure
/// - Highlighted key sections
/// - Better typography hierarchy
/// - Icon-based visual elements
class BioSectionWidget extends StatelessWidget {
  final VoidCallback? onNavigateToContact;
  final String email;

  const BioSectionWidget({
    super.key,
    this.onNavigateToContact,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isSmallMobile = screenWidth < 375;
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section heading with gradient underline
        Row(
          children: [
            Text(
              l10n.bioWhoIAm,
              style: (isDark ? AppFonts.h2() : AppFonts.h2()).copyWith(
                fontSize: isMobile ? (isSmallMobile ? 22 : 24) : null,
                fontWeight: AppFonts.bold,
              ),
            ),
            SizedBox(width: isMobile ? AppTheme.spacingS : AppTheme.spacingM),
            Expanded(
              child: Container(
                height: isMobile ? 2 : 3,
                decoration: BoxDecoration(
                  gradient: isDark
                      ? AppColors.primaryGradientDark
                      : AppColors.primaryGradientLight,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: isMobile ? AppTheme.spacingL : AppTheme.spacingXL),

        // Main bio introduction
        Text(
          l10n.bioIntro,
          style:
              (isDark ? AppFonts.bodyLarge() : AppFonts.bodyLarge()).copyWith(
            fontSize: isMobile ? (isSmallMobile ? 14 : 15) : null,
            height: isMobile ? 1.7 : 1.8,
            letterSpacing: 0.2,
            color: isDark ? AppColors.gray300 : AppColors.gray800,
            fontWeight: AppFonts.medium,
          ),
        ),

        SizedBox(height: isMobile ? AppTheme.spacingL : AppTheme.spacingXL),

        // Mobile App Development section
        _buildHighlightSection(
          context,
          icon: Icons.phone_android,
          title: l10n.bioMobileDevTitle,
          description: l10n.bioMobileDevBody,
          isDark: isDark,
          isMobile: isMobile,
          isSmallMobile: isSmallMobile,
        ),

        SizedBox(height: isMobile ? AppTheme.spacingM : AppTheme.spacingL),

        // Technical Interests section
        _buildHighlightSection(
          context,
          icon: AppIcons.technology,
          title: l10n.bioTechTitle,
          description: l10n.bioTechBody,
          isDark: isDark,
          isMobile: isMobile,
          isSmallMobile: isSmallMobile,
        ),

        SizedBox(height: isMobile ? AppTheme.spacingM : AppTheme.spacingL),

        // Skills & Communication section
        _buildHighlightSection(
          context,
          icon: AppIcons.flutterIconSvg,
          title: l10n.bioSkillsTitle,
          description: l10n.bioSkillsBody,
          isDark: isDark,
          isMobile: isMobile,
          isSmallMobile: isSmallMobile,
        ),

        SizedBox(height: isMobile ? AppTheme.spacingL : AppTheme.spacingXL),

        // Closing statement
        Container(
          padding: EdgeInsets.all(
            isMobile ? AppTheme.spacingM : AppTheme.spacingL,
          ),
          decoration: BoxDecoration(
            gradient: isDark
                ? LinearGradient(
                    colors: [
                      AppColors.primaryLight.withOpacity(0.1),
                      AppColors.accentLight.withOpacity(0.1),
                    ],
                  )
                : LinearGradient(
                    colors: [
                      AppColors.accentLight.withOpacity(0.08),
                      AppColors.primaryLight.withOpacity(0.08),
                    ],
                  ),
            borderRadius: BorderRadius.circular(
              isMobile ? AppTheme.radiusS : AppTheme.radiusM,
            ),
            border: Border.all(
              color: (isDark ? AppColors.primaryLight : AppColors.accentLight)
                  .withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                AppIcons.featured,
                color: isDark ? AppColors.primaryLight : AppColors.accentLight,
                size: isMobile ? 20 : 24,
              ),
              SizedBox(width: isMobile ? AppTheme.spacingS : AppTheme.spacingM),
              Expanded(
                child: Text(
                  l10n.bioHighlightClosing,
                  style: (isDark ? AppFonts.bodyLarge() : AppFonts.bodyLarge())
                      .copyWith(
                    fontSize: isMobile ? (isSmallMobile ? 13 : 14) : null,
                    fontWeight: AppFonts.semiBold,
                    height: isMobile ? 1.5 : 1.6,
                    color: isDark ? AppColors.gray200 : AppColors.gray900,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: isMobile ? AppTheme.spacingL : AppTheme.spacingXL),

        // Call to action
        Text(
          l10n.bioClosingCta,
          style:
              (isDark ? AppFonts.bodyLarge() : AppFonts.bodyLarge()).copyWith(
            fontSize: isMobile ? (isSmallMobile ? 13 : 14) : null,
            fontStyle: FontStyle.italic,
            color: isDark ? AppColors.gray400 : AppColors.gray700,
            fontWeight: AppFonts.medium,
            height: isMobile ? 1.5 : 1.6,
          ),
        ),

        SizedBox(height: isMobile ? AppTheme.spacingXL : AppTheme.spacingXXL),

        // Contact information list
        ContactInfoListWidget(
          onNavigateToContact: onNavigateToContact,
          email: email,
        ),
      ],
    );
  }

  Widget _buildHighlightSection(
    BuildContext context, {
    required dynamic icon,
    required String title,
    required String description,
    required bool isDark,
    required bool isMobile,
    required bool isSmallMobile,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        Container(
          padding: EdgeInsets.all(
            isMobile ? 8 : AppTheme.spacingS,
          ),
          decoration: BoxDecoration(
            gradient: isDark
                ? AppColors.primaryGradientDark
                : AppColors.primaryGradientLight,
            borderRadius: BorderRadius.circular(
              isMobile ? 6 : AppTheme.radiusS,
            ),
            boxShadow: [
              BoxShadow(
                color: (isDark ? AppColors.primaryLight : AppColors.accentLight)
                    .withOpacity(0.3),
                blurRadius: isMobile ? 6 : 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: icon is String
              ? SvgPicture.asset(
                  icon,
                  width: isMobile ? 16 : 20,
                  height: isMobile ? 16 : 20,
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                )
              : Icon(
                  icon,
                  color: AppColors.white,
                  size: isMobile ? 16 : 20,
                ),
        ),
        SizedBox(width: isMobile ? AppTheme.spacingS : AppTheme.spacingM),
        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: (isDark ? AppFonts.h3() : AppFonts.h3()).copyWith(
                  fontSize: isMobile ? (isSmallMobile ? 16 : 18) : null,
                  fontWeight: AppFonts.bold,
                  color: isDark ? AppColors.white : AppColors.gray900,
                ),
              ),
              SizedBox(height: isMobile ? 4 : AppTheme.spacingS),
              Text(
                description,
                style: (isDark ? AppFonts.bodyLarge() : AppFonts.bodyLarge())
                    .copyWith(
                  fontSize: isMobile ? (isSmallMobile ? 13 : 14) : null,
                  height: isMobile ? 1.6 : 1.7,
                  color: isDark ? AppColors.gray300 : AppColors.gray800,
                  fontWeight: AppFonts.medium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
