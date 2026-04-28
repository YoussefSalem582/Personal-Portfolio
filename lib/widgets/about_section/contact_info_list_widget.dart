import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/data/portfolio_data.dart';
import '../../utils/data/localized/portfolio_strings.dart';
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

    final l10n = AppLocalizations.of(context);
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
              l10n.contactInfoHeading,
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
                      AppColors.surfaceDark.withOpacity(0.5),
                      AppColors.surfaceDark.withOpacity(0.3),
                    ]
                  : [
                      AppColors.white.withOpacity(0.8),
                      AppColors.white.withOpacity(0.5),
                    ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppTheme.radiusL),
            border: Border.all(
              color: isDark
                  ? AppColors.white.withOpacity(0.1)
                  : AppColors.gray300.withOpacity(0.3),
            ),
          ),
          padding: const EdgeInsets.all(AppTheme.spacingM),
          child: Column(
            children: [
              // Email contact item (clickable)
              ContactInfoItemWidget(
                icon: AppIcons.email,
                label: l10n.contactInfoEmailLabel,
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
                            AppColors.white.withOpacity(0),
                            AppColors.white.withOpacity(0.1),
                            AppColors.white.withOpacity(0),
                          ]
                        : [
                            AppColors.gray300.withOpacity(0),
                            AppColors.gray300.withOpacity(0.3),
                            AppColors.gray300.withOpacity(0),
                          ],
                  ),
                ),
              ),

              const SizedBox(height: AppTheme.spacingM),

              // Location item (non-clickable)
              ContactInfoItemWidget(
                icon: AppIcons.location,
                label: l10n.contactInfoLocationLabel,
                value: PortfolioStrings.locationDisplay,
                onTap: null,
              ),

              const SizedBox(height: AppTheme.spacingL),

              // Contact Me button
              _buildContactButton(context, isDark, l10n),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactButton(
      BuildContext context, bool isDark, AppLocalizations l10n) {
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
                    .withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                AppIcons.message,
                color: AppColors.white,
                size: 20,
              ),
              const SizedBox(width: AppTheme.spacingS),
              Text(
                l10n.contactFormTitle,
                style: AppFonts.button().copyWith(
                  color: AppColors.white,
                  fontWeight: AppFonts.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: AppTheme.spacingS),
              const Icon(
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
