import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../utils/data/portfolio_data.dart';
import '../../utils/url_helper.dart';
import 'contact_item_widget.dart';
import 'social_button_widget.dart';

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section heading
        Text(
          'Contact Information',
          style: (isDark
                  ? AppTheme.headingMediumForTheme(context)
                  : AppTheme.headingMedium)
              .copyWith(fontSize: 24),
        ),

        const SizedBox(height: AppTheme.spacingL),

        // Email contact item (clickable - launches email client)
        ContactItemWidget(
          icon: Icons.email_outlined,
          title: 'Email',
          value: PortfolioData.contactInfo.email,
          onTap: () =>
              UrlHelper.launchEmail(email: PortfolioData.contactInfo.email),
        ),

        const SizedBox(height: AppTheme.spacingL),

        // Phone contact item (clickable - launches phone dialer)
        ContactItemWidget(
          icon: Icons.phone_outlined,
          title: 'Phone',
          value: PortfolioData.contactInfo.phone,
          onTap: () => UrlHelper.launchPhone(PortfolioData.contactInfo.phone),
        ),

        const SizedBox(height: AppTheme.spacingL),

        // Location contact item (non-clickable - just displays location)
        ContactItemWidget(
          icon: Icons.location_on_outlined,
          title: 'Location',
          value: PortfolioData.contactInfo.location,
          onTap: null, // No action for location
        ),

        const SizedBox(height: AppTheme.spacingXL),

        // Social media section heading
        Text(
          'Connect With Me',
          style: (isDark
                  ? AppTheme.headingSmallForTheme(context)
                  : AppTheme.headingSmall)
              .copyWith(fontSize: 18),
        ),

        const SizedBox(height: AppTheme.spacingL),

        // Social media buttons (wrap for responsive layout)
        // Maps through all social links from portfolio data and creates buttons
        Wrap(
          spacing: AppTheme.spacingL,
          children: PortfolioData.socialLinks.map((social) {
            return SocialButtonWidget(
              title: social.name,
              iconPath: social.iconPath,
              onTap: () => UrlHelper.launchURL(social.url),
            );
          }).toList(),
        ),
      ],
    );
  }
}
