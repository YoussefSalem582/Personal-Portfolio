import 'package:flutter/material.dart';
import '../utils/app_constants.dart';
import '../utils/responsive_helper.dart';
import '../utils/data/portfolio_data.dart';
import '../utils/url_helper.dart';

import '../theme/app_theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);

    return Container(
      width: double.infinity,
      color: AppColors.primaryLight,
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

            Container(height: 1, color: AppColors.white.withValues(alpha: 0.2)),

            const SizedBox(height: AppTheme.spacingL),

            // Copyright
            Text(
              '© ${DateTime.now().year} ${PortfolioData.fullName}. All rights reserved.',
              style: AppFonts.bodyMedium(
                  color: AppColors.white.withValues(alpha: 0.8)),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppTheme.spacingS),

            Text(
              'Built with Flutter 💙',
              style: AppFonts.bodySmall(
                  color: AppColors.white.withValues(alpha: 0.6)),
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
                style: AppFonts.h3(color: AppColors.white),
              ),
              const SizedBox(height: AppTheme.spacingM),
              Text(
                PortfolioData.title,
                style:
                    AppFonts.bodyLarge(color: AppColors.accentLight).copyWith(
                  fontWeight: AppFonts.semiBold,
                ),
              ),
              const SizedBox(height: AppTheme.spacingS),
              Text(
                'Creating beautiful and functional applications with Flutter.',
                style: AppFonts.bodyMedium(
                    color: AppColors.white.withValues(alpha: 0.8)),
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
                style: AppFonts.h5(color: AppColors.white),
              ),
              const SizedBox(height: AppTheme.spacingM),
              _buildFooterLink('About', () => _scrollToSection('about')),
              _buildFooterLink('Projects', () => _scrollToSection('projects')),
              _buildFooterLink('Skills', () => _scrollToSection('skills')),
              _buildFooterLink('Contact', () => _scrollToSection('contact')),
              _buildFooterLink('Resume PDF', () => _downloadResume()),
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
                style: AppFonts.h5(color: AppColors.white),
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
                    child: InkWell(
                      onTap: () => UrlHelper.launchURL(social.url),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: AppColors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          _getIconForPlatform(social.name),
                          color: AppColors.white.withValues(alpha: 0.8),
                          size: 18,
                        ),
                      ),
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
          style: AppFonts.h3(color: AppColors.white),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: AppTheme.spacingS),

        Text(
          PortfolioData.title,
          style: AppFonts.bodyLarge(color: AppColors.accentLight).copyWith(
            fontWeight: AppFonts.semiBold,
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
              child: InkWell(
                onTap: () => UrlHelper.launchURL(social.url),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    _getIconForPlatform(social.name),
                    color: AppColors.white.withValues(alpha: 0.8),
                    size: 24,
                  ),
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
            style: AppFonts.bodyMedium(color: AppColors.accentLight).copyWith(
              decoration: TextDecoration.underline,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        const SizedBox(height: AppTheme.spacingL),

        // Resume download button
        ElevatedButton.icon(
          onPressed: () => _downloadResume(),
          icon: const Icon(Icons.download, size: 18),
          label: const Text('Download Resume'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accentLight,
            foregroundColor: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
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
          style: AppFonts.bodyMedium(
              color: AppColors.white.withValues(alpha: 0.8)),
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
            Icon(icon, size: 16, color: AppColors.white.withValues(alpha: 0.6)),
            const SizedBox(width: AppTheme.spacingS),
            Expanded(
              child: Text(
                text,
                style: AppFonts.bodySmall(
                    color: AppColors.white.withValues(alpha: 0.8)),
              ),
            ),
          ],
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
        return Icons.play_arrow; // YouTube icon
      case 'upwork':
        return Icons.work_outline; // Upwork icon
      default:
        return Icons.link;
    }
  }

  void _scrollToSection(String section) {
    // TODO: Implement scrolling to sections
    // This would require passing a scroll controller or using a named route
  }

  void _downloadResume() async {
    try {
      await UrlHelper.openFile(PortfolioData.resumeUrl);
    } catch (e) {
      // Handle error silently
    }
  }
}
