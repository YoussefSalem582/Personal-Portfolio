import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';
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

    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingXL),
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
        borderRadius: BorderRadius.circular(AppTheme.radiusXL),
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
                padding: const EdgeInsets.all(AppTheme.spacingM),
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
                  borderRadius: BorderRadius.circular(AppTheme.radiusM),
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
                  size: 24,
                ),
              ),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Information',
                      style: AppFonts.h3().copyWith(
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                        fontWeight: AppFonts.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Get in touch with me',
                      style: AppFonts.bodySmall().copyWith(
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

          const SizedBox(height: AppTheme.spacingXL),

          // Email contact item (clickable - launches email client)
          ContactItemWidget(
            icon: AppIcons.email,
            title: 'Email',
            value: PortfolioData.contactInfo.email,
            onTap: () =>
                UrlHelper.launchEmail(email: PortfolioData.contactInfo.email),
          ),

          const SizedBox(height: AppTheme.spacingM),

          // Phone contact item (clickable - launches phone dialer)
          ContactItemWidget(
            icon: AppIcons.phone,
            title: 'Phone',
            value: PortfolioData.contactInfo.phone,
            onTap: () => UrlHelper.launchPhone(PortfolioData.contactInfo.phone),
          ),

          const SizedBox(height: AppTheme.spacingM),

          // Location contact item (non-clickable - just displays location)
          ContactItemWidget(
            icon: AppIcons.location,
            title: 'Location',
            value: PortfolioData.contactInfo.location,
            onTap: null, // No action for location
          ),

          const SizedBox(height: AppTheme.spacingXXL),

          // Divider
          Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  (isDark ? AppColors.white : AppColors.black)
                      .withOpacity(0.1),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          const SizedBox(height: AppTheme.spacingXL),

          // Social media section heading
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
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
                  size: 20,
                ),
              ),
              const SizedBox(width: AppTheme.spacingM),
              Text(
                'Connect With Me',
                style: AppFonts.h4().copyWith(
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                  fontWeight: AppFonts.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppTheme.spacingL),

          // Social media buttons (wrap for responsive layout)
          Wrap(
            spacing: AppTheme.spacingM,
            runSpacing: AppTheme.spacingM,
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
