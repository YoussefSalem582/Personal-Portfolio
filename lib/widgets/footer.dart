import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive_helper.dart';
import '../utils/portfolio_data.dart';
import '../utils/url_helper.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);

    return Container(
      width: double.infinity,
      color: AppTheme.primaryColor,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
        vertical: AppTheme.spacingXL,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ResponsiveHelper.getMaxWidth(screenWidth),
        ),
        child: Column(
          children: [
            if (isMobile) _buildMobileFooter() else _buildDesktopFooter(),

            const SizedBox(height: AppTheme.spacingL),

            Container(height: 1, color: Colors.white.withOpacity(0.2)),

            const SizedBox(height: AppTheme.spacingL),

            // Copyright
            Text(
              '© ${DateTime.now().year} ${PortfolioData.fullName}. All rights reserved.',
              style: AppTheme.bodyMedium.copyWith(
                color: Colors.white.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppTheme.spacingS),

            Text(
              'Built with Flutter 💙',
              style: AppTheme.bodySmall.copyWith(
                color: Colors.white.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopFooter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // About section
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                PortfolioData.fullName,
                style: AppTheme.headingMedium.copyWith(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),

              const SizedBox(height: AppTheme.spacingM),

              Text(
                PortfolioData.title,
                style: AppTheme.bodyLarge.copyWith(
                  color: AppTheme.accentColor,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: AppTheme.spacingS),

              Text(
                'Creating beautiful and functional applications with Flutter.',
                style: AppTheme.bodyMedium.copyWith(
                  color: Colors.white.withOpacity(0.8),
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
              Text(
                'Quick Links',
                style: AppTheme.headingSmall.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: AppTheme.spacingM),

              _buildFooterLink('About', () => _scrollToSection('about')),
              _buildFooterLink('Projects', () => _scrollToSection('projects')),
              _buildFooterLink('Skills', () => _scrollToSection('skills')),
              _buildFooterLink('Contact', () => _scrollToSection('contact')),
            ],
          ),
        ),

        const SizedBox(width: AppTheme.spacingXL),

        // Contact info
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Get In Touch',
                style: AppTheme.headingSmall.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: AppTheme.spacingM),

              _buildContactLink(
                Icons.email_outlined,
                PortfolioData.contactInfo.email,
                () => UrlHelper.launchEmail(
                  email: PortfolioData.contactInfo.email,
                ),
              ),

              _buildContactLink(
                Icons.location_on_outlined,
                PortfolioData.contactInfo.location,
                null,
              ),

              const SizedBox(height: AppTheme.spacingM),

              // Social links
              Row(
                children: PortfolioData.socialLinks.map((social) {
                  return Padding(
                    padding: const EdgeInsets.only(right: AppTheme.spacingM),
                    child: IconButton(
                      onPressed: () => UrlHelper.launchURL(social.url),
                      icon: Icon(
                        _getSocialIcon(social.name),
                        color: Colors.white.withOpacity(0.8),
                        size: 20,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 32,
                        minHeight: 32,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Name and title
        Text(
          PortfolioData.fullName,
          style: AppTheme.headingMedium.copyWith(
            color: Colors.white,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: AppTheme.spacingS),

        Text(
          PortfolioData.title,
          style: AppTheme.bodyLarge.copyWith(
            color: AppTheme.accentColor,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: AppTheme.spacingL),

        // Social links
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: PortfolioData.socialLinks.map((social) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingS,
              ),
              child: IconButton(
                onPressed: () => UrlHelper.launchURL(social.url),
                icon: Icon(
                  _getSocialIcon(social.name),
                  color: Colors.white.withOpacity(0.8),
                  size: 24,
                ),
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: AppTheme.spacingL),

        // Contact email
        InkWell(
          onTap: () =>
              UrlHelper.launchEmail(email: PortfolioData.contactInfo.email),
          child: Text(
            PortfolioData.contactInfo.email,
            style: AppTheme.bodyMedium.copyWith(
              color: AppTheme.accentColor,
              decoration: TextDecoration.underline,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildFooterLink(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.spacingS),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: AppTheme.bodyMedium.copyWith(
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
    );
  }

  Widget _buildContactLink(IconData icon, String text, VoidCallback? onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.spacingS),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, size: 16, color: Colors.white.withOpacity(0.6)),
            const SizedBox(width: AppTheme.spacingS),
            Expanded(
              child: Text(
                text,
                style: AppTheme.bodySmall.copyWith(
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getSocialIcon(String name) {
    switch (name.toLowerCase()) {
      case 'github':
        return Icons.code;
      case 'linkedin':
        return Icons.work;
      case 'twitter':
        return Icons.alternate_email;
      case 'portfolio':
        return Icons.web;
      case 'mostaql':
        return Icons.business;
      default:
        return Icons.link;
    }
  }

  void _scrollToSection(String section) {
    // TODO: Implement scrolling to sections
    // This would require passing a scroll controller or using a named route
  }
}
