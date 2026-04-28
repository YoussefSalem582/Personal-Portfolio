import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../utils/assets/app_constants.dart';
import 'package:youssef_hassan_portfolio/features/portfolio/data/localized/portfolio_strings.dart';
import '../../utils/data/portfolio_data.dart';
import '../../utils/url_helper.dart';
import 'contact_item_widget.dart';
import 'social_button_widget.dart';

import '../../theme/app_theme.dart';

/// A widget that displays contact information including email, phone, location,
/// and social media links.
///
/// This widget is used in the contact section to show how to reach the portfolio owner.
/// It includes clickable items for email and phone that launch the respective apps,
/// and social media buttons that open external links.
class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine theme mode for styling
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isSmallMobile = screenWidth < 375;
    final l10n = AppLocalizations.of(context);

    return Container(
      padding:
          EdgeInsets.all(isMobile ? AppTheme.spacingL : AppTheme.spacingXL),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [
                  AppColors.cardDark.withOpacity(0.3),
                  AppColors.surfaceDark.withOpacity(0.2),
                ]
              : [
                  AppColors.surfaceLight.withOpacity(0.3),
                  AppColors.white.withOpacity(0.5),
                ],
        ),
        borderRadius: BorderRadius.circular(
            isMobile ? AppTheme.radiusL : AppTheme.radiusXL),
        border: Border.all(
          color: isDark
              ? AppColors.white.withOpacity(0.05)
              : AppColors.black.withOpacity(0.05),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section heading with icon
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(
                    isMobile ? AppTheme.spacingS : AppTheme.spacingM),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? [
                            AppColors.accentDark,
                            AppColors.accentDark.withOpacity(0.8)
                          ]
                        : [
                            AppColors.accentLight,
                            AppColors.accentLight.withOpacity(0.8)
                          ],
                  ),
                  borderRadius: BorderRadius.circular(
                      isMobile ? AppTheme.radiusS : AppTheme.radiusM),
                  boxShadow: [
                    BoxShadow(
                      color: (isDark
                              ? AppColors.accentDark
                              : AppColors.accentLight)
                          .withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  AppIcons.contact,
                  color: AppColors.white,
                  size: isMobile ? 20 : 24,
                ),
              ),
              SizedBox(width: isMobile ? AppTheme.spacingS : AppTheme.spacingM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.contactCardTitle,
                      style: AppFonts.h3().copyWith(
                        fontSize: isMobile ? (isSmallMobile ? 15 : 16) : null,
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                        fontWeight: AppFonts.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.contactCardSubtitle,
                      style: AppFonts.bodySmall().copyWith(
                        fontSize: isMobile ? (isSmallMobile ? 10 : 11) : null,
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: isMobile ? AppTheme.spacingL : AppTheme.spacingXL),

          // Email contact item (clickable - launches email client)
          ContactItemWidget(
            icon: AppIcons.email,
            title: l10n.contactInfoEmailLabel,
            value: PortfolioData.contactInfo.email,
            onTap: () =>
                UrlHelper.launchEmail(email: PortfolioData.contactInfo.email),
          ),

          SizedBox(height: isMobile ? AppTheme.spacingS : AppTheme.spacingM),

          // Location contact item (non-clickable - just displays location)
          ContactItemWidget(
            icon: AppIcons.location,
            title: l10n.contactInfoLocationLabel,
            value: PortfolioStrings.locationDisplay,
            onTap: null, // No action for location
          ),

          SizedBox(height: isMobile ? AppTheme.spacingL : AppTheme.spacingXXL),

          // Divider
          Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  (isDark ? AppColors.white : AppColors.black).withOpacity(0.1),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          SizedBox(height: isMobile ? AppTheme.spacingL : AppTheme.spacingXL),

          // Social media section heading
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(isMobile ? 6 : 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? [
                            AppColors.accentDark.withOpacity(0.2),
                            AppColors.accentDark.withOpacity(0.1),
                          ]
                        : [
                            AppColors.accentLight.withOpacity(0.2),
                            AppColors.accentLight.withOpacity(0.1),
                          ],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.link,
                  color: isDark ? AppColors.accentDark : AppColors.accentLight,
                  size: isMobile ? 16 : 20,
                ),
              ),
              SizedBox(width: isMobile ? AppTheme.spacingS : AppTheme.spacingM),
              Text(
                l10n.contactSocialHeading,
                style: AppFonts.h4().copyWith(
                  fontSize: isMobile ? (isSmallMobile ? 13 : 14) : null,
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                  fontWeight: AppFonts.bold,
                ),
              ),
            ],
          ),

          SizedBox(height: isMobile ? AppTheme.spacingM : AppTheme.spacingL),

          // Social media buttons (wrap for responsive layout)
          Wrap(
            spacing: isMobile ? AppTheme.spacingS : AppTheme.spacingM,
            runSpacing: isMobile ? AppTheme.spacingS : AppTheme.spacingM,
            children: PortfolioData.socialLinks.map((social) {
              return SocialButtonWidget(
                title: social.name,
                iconPath: social.iconPath,
                onTap: () => UrlHelper.launchURL(social.url),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
