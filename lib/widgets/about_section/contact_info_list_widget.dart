import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/data/portfolio_data.dart';
import '../../utils/url_helper.dart';
import 'contact_info_item_widget.dart';

import '../../theme/app_theme.dart';

/// Widget displaying a list of contact information items.
///
/// Shows:
/// - "Get In Touch" heading with gradient accent
/// - Email (clickable - launches email client)
/// - Location (non-clickable)
/// - Button to navigate to Contact section
///
/// Each item uses ContactInfoItemWidget with enhanced dark mode visibility.
class ContactInfoListWidget extends StatelessWidget {
  final VoidCallback? onNavigateToContact;

  const ContactInfoListWidget({super.key, this.onNavigateToContact});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section heading with gradient accent bar
        Row(
          children: [
            Container(
              width: 4,
              height: 28,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isDark
                      ? [AppColors.primaryLight, AppColors.accentDark]
                      : [AppColors.primaryLight, AppColors.accentLight],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: AppTheme.spacingS),
            Text(
              'Get In Touch',
              style: (isDark ? AppFonts.h3() : AppFonts.h3()).copyWith(
                color: isDark ? AppColors.white : AppColors.gray900,
                fontWeight: AppFonts.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: AppTheme.spacingL),

        // Contact items container with subtle background
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDark
                  ? [
                      AppColors.surfaceDark.withValues(alpha: 0.5),
                      AppColors.surfaceDark.withValues(alpha: 0.3),
                    ]
                  : [
                      AppColors.white.withValues(alpha: 0.8),
                      AppColors.white.withValues(alpha: 0.5),
                    ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppTheme.radiusL),
            border: Border.all(
              color: isDark
                  ? AppColors.white.withValues(alpha: 0.1)
                  : AppColors.gray300.withValues(alpha: 0.3),
            ),
          ),
          padding: const EdgeInsets.all(AppTheme.spacingM),
          child: Column(
            children: [
              // Email contact item (clickable)
              ContactInfoItemWidget(
                icon: AppIcons.email,
                label: 'Email',
                value: PortfolioData.email,
                onTap: () => UrlHelper.launchEmail(email: PortfolioData.email),
              ),

              const SizedBox(height: AppTheme.spacingM),

              // Divider
              Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? [
                            AppColors.white.withValues(alpha: 0),
                            AppColors.white.withValues(alpha: 0.1),
                            AppColors.white.withValues(alpha: 0),
                          ]
                        : [
                            AppColors.gray300.withValues(alpha: 0),
                            AppColors.gray300.withValues(alpha: 0.3),
                            AppColors.gray300.withValues(alpha: 0),
                          ],
                  ),
                ),
              ),

              const SizedBox(height: AppTheme.spacingM),

              // Location item (non-clickable)
              ContactInfoItemWidget(
                icon: AppIcons.location,
                label: 'Location',
                value: PortfolioData.location,
                onTap: null,
              ),

              const SizedBox(height: AppTheme.spacingL),

              // Contact Me button
              _buildContactButton(context, isDark),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactButton(BuildContext context, bool isDark) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: onNavigateToContact,
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingL,
            vertical: AppTheme.spacingM,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDark
                  ? [AppColors.primaryLight, AppColors.accentDark]
                  : [AppColors.primaryLight, AppColors.accentLight],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppTheme.radiusM),
            boxShadow: [
              BoxShadow(
                color: (isDark ? AppColors.primaryLight : AppColors.accentLight)
                    .withValues(alpha: 0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                AppIcons.message,
                color: AppColors.white,
                size: 20,
              ),
              const SizedBox(width: AppTheme.spacingS),
              Text(
                'Send Me a Message',
                style: AppFonts.button().copyWith(
                  color: AppColors.white,
                  fontWeight: AppFonts.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: AppTheme.spacingS),
              Icon(
                Icons.arrow_forward_rounded,
                color: AppColors.white,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
