import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../l10n/app_localizations.dart';
import 'package:youssef_hassan_portfolio/features/hero/data/localized/portfolio_strings.dart';
import '../utils/assets/app_constants.dart';
import '../utils/responsive_helper.dart';
import '../utils/data/portfolio_data.dart';
import '../utils/url_helper.dart';

import '../theme/app_theme.dart';

class Footer extends StatelessWidget {
  final Function(int)? onNavigateToSection;
  final VoidCallback? onScrollToTop;

  const Footer({
    super.key,
    this.onNavigateToSection,
    this.onScrollToTop,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [
                  AppColors.surfaceDark,
                  AppColors.backgroundDark,
                ]
              : [
                  AppColors.primaryLight,
                  AppColors.primaryLight.withOpacity(0.9),
                ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? AppColors.black.withOpacity(0.3)
                : AppColors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
        vertical: AppTheme.spacingXXL,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ResponsiveHelper.getMaxWidth(screenWidth),
        ),
        child: Column(
          children: [
            if (isMobile)
              _buildMobileFooter(isDark, l10n)
            else
              _buildDesktopFooter(isDark, l10n),

            const SizedBox(height: AppTheme.spacingXL),

            // Scroll to top button
            _buildScrollToTopButton(isDark),

            const SizedBox(height: AppTheme.spacingXL),

            Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    (isDark ? AppColors.white : AppColors.white)
                        .withOpacity(0.2),
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppTheme.spacingL),

            // Copyright and tech stack
            _buildCopyrightSection(isDark, l10n),
          ],
        ),
      ),
    );
  }

  Widget _buildScrollToTopButton(bool isDark) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: onScrollToTop,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingL,
            vertical: AppTheme.spacingM,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDark
                  ? [
                      AppColors.accentDark,
                      AppColors.accentDark.withOpacity(0.8),
                    ]
                  : [
                      AppColors.accentLight,
                      AppColors.accentLight.withOpacity(0.8),
                    ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                    .withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                AppIcons.arrowUp,
                color: AppColors.white,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCopyrightSection(bool isDark, AppLocalizations l10n) {
    return Column(
      children: [
        // Copyright
        Text(
          l10n.copyrightNotice(DateTime.now().year, PortfolioData.fullName),
          style: AppFonts.bodyMedium().copyWith(
            color: (isDark ? AppColors.textSecondaryDark : AppColors.white)
                .withOpacity(0.8),
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: AppTheme.spacingS),

        // Built with Flutter
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.footerBuiltWith,
              style: AppFonts.bodySmall().copyWith(
                color: (isDark ? AppColors.textSecondaryDark : AppColors.white)
                    .withOpacity(0.6),
              ),
            ),
            const SizedBox(width: AppTheme.spacingXS),
            Icon(
              Icons.favorite,
              size: 14,
              color: Colors.red.withOpacity(0.8),
            ),
            const SizedBox(width: AppTheme.spacingXS),
            Text(
              l10n.footerUsingFlutter,
              style: AppFonts.bodySmall().copyWith(
                color: (isDark ? AppColors.textSecondaryDark : AppColors.white)
                    .withOpacity(0.6),
              ),
            ),
            const SizedBox(width: AppTheme.spacingXS),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF027DFD).withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFF027DFD).withOpacity(0.3),
                ),
              ),
              child: const Text(
                '💙',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),

        const SizedBox(height: AppTheme.spacingM),
      ],
    );
  }

  Widget _buildDesktopFooter(bool isDark, AppLocalizations l10n) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // About section
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name with gradient
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: isDark
                      ? [AppColors.accentDark, AppColors.white]
                      : [AppColors.accentLight, AppColors.white],
                ).createShader(bounds),
                child: Text(
                  PortfolioData.fullName,
                  style: AppFonts.h3().copyWith(
                    color: AppColors.white,
                    fontWeight: AppFonts.bold,
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.spacingM),

              // Title with icon
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: isDark
                            ? [
                                AppColors.accentDark,
                                AppColors.accentDark.withOpacity(0.7)
                              ]
                            : [
                                AppColors.accentLight,
                                AppColors.accentLight.withOpacity(0.8)
                              ],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.code,
                      size: 16,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(width: AppTheme.spacingS),
                  Expanded(
                    child: Text(
                      PortfolioStrings.title,
                      style: AppFonts.bodyLarge().copyWith(
                        color: isDark
                            ? AppColors.accentDark
                            : AppColors.accentLight,
                        fontWeight: AppFonts.semiBold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.spacingM),

              // Description
              Text(
                l10n.footerTagline,
                style: AppFonts.bodyMedium().copyWith(
                  color:
                      (isDark ? AppColors.textSecondaryDark : AppColors.white)
                          .withOpacity(0.8),
                  height: 1.6,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),

        const SizedBox(width: AppTheme.spacingXXL),

        // Quick links
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle(l10n.footerQuickLinks, isDark),
              const SizedBox(height: AppTheme.spacingM),
              _buildFooterLink(
                  l10n.navHome, AppIcons.home, () => _scrollToSection(0), isDark),
              _buildFooterLink(
                  l10n.navAbout, AppIcons.about, () => _scrollToSection(1), isDark),
              _buildFooterLink(
                  l10n.navSkills, AppIcons.skills, () => _scrollToSection(2), isDark),
              _buildFooterLink(l10n.navProjects, AppIcons.projects,
                  () => _scrollToSection(4), isDark),
              _buildFooterLink(l10n.navContact, AppIcons.contact,
                  () => _scrollToSection(6), isDark),
              const SizedBox(height: AppTheme.spacingS),
              _buildFooterLink(
                  l10n.footerViewResume, AppIcons.view, () => _viewResume(), isDark),
            ],
          ),
        ),

        const SizedBox(width: AppTheme.spacingXL),

        // Contact & Social
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle(l10n.footerGetInTouch, isDark),
              const SizedBox(height: AppTheme.spacingM),

              _buildContactLink(
                AppIcons.email,
                PortfolioData.contactInfo.email,
                () => UrlHelper.launchEmail(
                  email: PortfolioData.contactInfo.email,
                ),
                isDark,
              ),

              _buildContactLink(
                AppIcons.location,
                PortfolioData.contactInfo.location,
                null,
                isDark,
              ),

              const SizedBox(height: AppTheme.spacingL),

              // Social links with improved styling
              Text(
                l10n.footerFollowMe,
                style: AppFonts.labelMedium().copyWith(
                  color:
                      (isDark ? AppColors.textSecondaryDark : AppColors.white)
                          .withOpacity(0.9),
                  fontWeight: AppFonts.semiBold,
                ),
              ),
              const SizedBox(height: AppTheme.spacingM),

              Wrap(
                spacing: AppTheme.spacingS,
                runSpacing: AppTheme.spacingS,
                children: PortfolioData.socialLinks.map((social) {
                  return _buildSocialButton(social.name, social.url, isDark);
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 20,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDark
                  ? [
                      AppColors.accentDark,
                      AppColors.accentDark.withOpacity(0.5)
                    ]
                  : [
                      AppColors.accentLight,
                      AppColors.accentLight.withOpacity(0.5)
                    ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: AppTheme.spacingS),
        Text(
          title,
          style: AppFonts.h5().copyWith(
            color: isDark ? AppColors.white : AppColors.white,
            fontWeight: AppFonts.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton(String platform, String url, bool isDark) {
    final iconPath = AppIcons.getSocialIconSvg(platform);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () => UrlHelper.launchURL(url),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDark
                  ? [
                      AppColors.white.withOpacity(0.1),
                      AppColors.white.withOpacity(0.05),
                    ]
                  : [
                      AppColors.white.withOpacity(0.2),
                      AppColors.white.withOpacity(0.1),
                    ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color:
                  (isDark ? AppColors.white : AppColors.white).withOpacity(0.2),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: iconPath != null
                ? _buildIconWidget(iconPath)
                : Icon(
                    _getIconForPlatform(platform),
                    color:
                        (isDark ? AppColors.accentDark : AppColors.accentLight),
                    size: 20,
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconWidget(String iconPath) {
    // Check if it's an SVG or PNG/other image format
    if (iconPath.endsWith('.svg')) {
      return SvgPicture.asset(
        iconPath,
        width: 34,
        height: 34,
        fit: BoxFit.contain,
      );
    } else {
      // For PNG and other image formats
      return Image.asset(
        iconPath,
        width: 34,
        height: 34,
        fit: BoxFit.contain,
      );
    }
  }

  Widget _buildMobileFooter(bool isDark, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Name with gradient
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: isDark
                ? [AppColors.accentDark, AppColors.white]
                : [AppColors.accentLight, AppColors.white],
          ).createShader(bounds),
          child: Text(
            PortfolioData.fullName,
            style: AppFonts.h3().copyWith(
              color: AppColors.white,
              fontWeight: AppFonts.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        const SizedBox(height: AppTheme.spacingS),

        // Title
        Text(
          PortfolioStrings.title,
          style: AppFonts.bodyLarge().copyWith(
            color: isDark ? AppColors.accentDark : AppColors.accentLight,
            fontWeight: AppFonts.semiBold,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: AppTheme.spacingL),

        // Social links
        Wrap(
          spacing: AppTheme.spacingM,
          runSpacing: AppTheme.spacingM,
          alignment: WrapAlignment.center,
          children: PortfolioData.socialLinks.map((social) {
            return _buildSocialButton(social.name, social.url, isDark);
          }).toList(),
        ),

        const SizedBox(height: AppTheme.spacingL),

        // Contact email
        InkWell(
          onTap: () =>
              UrlHelper.launchEmail(email: PortfolioData.contactInfo.email),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingM,
              vertical: AppTheme.spacingS,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isDark
                    ? [
                        AppColors.white.withOpacity(0.1),
                        AppColors.white.withOpacity(0.05),
                      ]
                    : [
                        AppColors.white.withOpacity(0.2),
                        AppColors.white.withOpacity(0.1),
                      ],
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: (isDark ? AppColors.white : AppColors.white)
                    .withOpacity(0.2),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  AppIcons.email,
                  size: 16,
                  color: isDark ? AppColors.accentDark : AppColors.accentLight,
                ),
                const SizedBox(width: AppTheme.spacingS),
                Text(
                  PortfolioData.contactInfo.email,
                  style: AppFonts.bodyMedium().copyWith(
                    color: isDark ? AppColors.textPrimaryDark : AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: AppTheme.spacingL),

        // Resume download button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _viewResume(),
            icon: const Icon(AppIcons.view, size: 20),
            label: Text(l10n.footerViewResume),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor:
                  isDark ? AppColors.accentDark : AppColors.accentLight,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 0,
              shadowColor:
                  (isDark ? AppColors.accentDark : AppColors.accentLight)
                      .withOpacity(0.3),
              textStyle: AppFonts.labelLarge().copyWith(
                fontWeight: AppFonts.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooterLink(
    String title,
    IconData icon,
    VoidCallback onTap,
    bool isDark,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.spacingS),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppTheme.spacingXS,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 16,
                  color:
                      (isDark ? AppColors.textSecondaryDark : AppColors.white)
                          .withOpacity(0.7),
                ),
                const SizedBox(width: AppTheme.spacingS),
                Text(
                  title,
                  style: AppFonts.bodyMedium().copyWith(
                    color:
                        (isDark ? AppColors.textSecondaryDark : AppColors.white)
                            .withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactLink(
    IconData icon,
    String text,
    VoidCallback? onTap,
    bool isDark,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.spacingM),
      child: MouseRegion(
        cursor:
            onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(AppTheme.spacingS),
            decoration: BoxDecoration(
              color: (isDark ? AppColors.white : AppColors.white)
                  .withOpacity(0.05),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: (isDark ? AppColors.white : AppColors.white)
                    .withOpacity(0.1),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 16,
                  color: isDark ? AppColors.accentDark : AppColors.accentLight,
                ),
                const SizedBox(width: AppTheme.spacingS),
                Expanded(
                  child: Text(
                    text,
                    style: AppFonts.bodySmall().copyWith(
                      color: (isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.white)
                          .withOpacity(0.8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getIconForPlatform(String name) {
    switch (name.toLowerCase()) {
      case 'github':
        return Icons.code; // GitHub icon
      case 'linkedin':
        return Icons.work; // LinkedIn icon
      case 'youtube':
        return Icons.play_circle_outline; // YouTube icon
      case 'upwork':
        return Icons.work; // Upwork icon
      default:
        return AppIcons.website;
    }
  }

  void _scrollToSection(int sectionIndex) {
    if (onNavigateToSection != null) {
      onNavigateToSection!(sectionIndex);
    }
  }

  void _viewResume() async {
    try {
      await UrlHelper.openFile(PortfolioData.resumeUrl);
    } catch (e) {
      // Handle error silently
    }
  }
}
