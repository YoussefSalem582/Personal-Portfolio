import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/data/portfolio_data.dart';
import '../../utils/url_helper.dart';
import 'contact_info_item_widget.dart';

import '../../theme/app_theme.dart';

/// Widget displaying a list of contact information items.
///
/// Shows:
/// - "Get In Touch" heading
/// - Email (clickable - launches email client)
/// - Location (non-clickable)
/// - Portfolio URL (clickable - opens website)
///
/// Each item uses ContactInfoItemWidget for consistent styling.
class ContactInfoListWidget extends StatelessWidget {
  const ContactInfoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section heading
        Text(
          'Get In Touch',
          style: (isDark ? AppFonts.h3() : AppFonts.h3()).copyWith(
            color: isDark ? AppColors.white : AppColors.gray900,
            fontWeight: AppFonts.bold,
          ),
        ),

        const SizedBox(height: AppTheme.spacingM),

        // Email contact item (clickable)
        ContactInfoItemWidget(
          icon: AppIcons.email,
          label: 'Email',
          value: PortfolioData.email,
          onTap: () => UrlHelper.launchEmail(email: PortfolioData.email),
        ),

        const SizedBox(height: AppTheme.spacingS),

        // Location item (non-clickable)
        ContactInfoItemWidget(
          icon: AppIcons.location,
          label: 'Location',
          value: PortfolioData.location,
          onTap: null,
        ),

        const SizedBox(height: AppTheme.spacingS),

        // Portfolio website link (clickable)
        ContactInfoItemWidget(
          icon: AppIcons.website,
          label: 'Portfolio',
          value: 'View Online',
          onTap: () => UrlHelper.launchURL(PortfolioData.portfolioUrl),
        ),
      ],
    );
  }
}
