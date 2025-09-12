import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../utils/responsive_helper.dart';
import '../../utils/portfolio_data.dart';
import '../../utils/url_helper.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);

    return Container(
      width: double.infinity,
      color: AppTheme.surfaceColor,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
        vertical: AppTheme.spacingXXL,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ResponsiveHelper.getMaxWidth(screenWidth),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Section title
            Text(
              'About Me',
              style: AppTheme.headingLarge.copyWith(fontSize: 36),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppTheme.spacingS),

            Container(
              width: 60,
              height: 4,
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            const SizedBox(height: AppTheme.spacingXXL),

            if (isMobile)
              _buildMobileLayout(context)
            else
              _buildDesktopLayout(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side - Bio and info
        Expanded(flex: 2, child: _buildBioSection()),

        const SizedBox(width: AppTheme.spacingXXL),

        // Right side - Stats and resume
        Expanded(child: _buildStatsSection()),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildBioSection(),
        const SizedBox(height: AppTheme.spacingXXL),
        _buildStatsSection(),
      ],
    );
  }

  Widget _buildBioSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Who I Am', style: AppTheme.headingMedium),

        const SizedBox(height: AppTheme.spacingL),

        Text(PortfolioData.bio, style: AppTheme.bodyLarge),

        const SizedBox(height: AppTheme.spacingL),

        Text(
          'I specialize in creating beautiful, performant applications that provide excellent user experiences. '
          'My passion lies in solving complex problems through code and bringing innovative ideas to life.',
          style: AppTheme.bodyLarge.copyWith(fontStyle: FontStyle.italic),
        ),

        const SizedBox(height: AppTheme.spacingXL),

        // Contact info
        _buildContactInfo(),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Get In Touch', style: AppTheme.headingSmall),

        const SizedBox(height: AppTheme.spacingM),

        _buildContactItem(
          Icons.email_outlined,
          'Email',
          PortfolioData.email,
          () => UrlHelper.launchEmail(email: PortfolioData.email),
        ),

        const SizedBox(height: AppTheme.spacingS),

        _buildContactItem(
          Icons.location_on_outlined,
          'Location',
          PortfolioData.location,
          null,
        ),

        const SizedBox(height: AppTheme.spacingS),

        _buildContactItem(
          Icons.web_outlined,
          'Portfolio',
          'View Online',
          () => UrlHelper.launchURL(PortfolioData.portfolioUrl),
        ),
      ],
    );
  }

  Widget _buildContactItem(
    IconData icon,
    String label,
    String value,
    VoidCallback? onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppTheme.radiusS),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingXS),
        child: Row(
          children: [
            Icon(icon, size: 20, color: AppTheme.accentColor),
            const SizedBox(width: AppTheme.spacingM),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTheme.bodySmall.copyWith(
                    color: AppTheme.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  value,
                  style: AppTheme.bodyMedium.copyWith(
                    color: onTap != null
                        ? AppTheme.accentColor
                        : AppTheme.textPrimary,
                    decoration: onTap != null ? TextDecoration.underline : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection() {
    return Column(
      children: [
        // Stats cards
        _buildStatsGrid(),

        const SizedBox(height: AppTheme.spacingXL),

        // Resume download
        _buildResumeCard(),

        const SizedBox(height: AppTheme.spacingXL),

        // Social links
        _buildSocialLinks(),
      ],
    );
  }

  Widget _buildStatsGrid() {
    final stats = [
      {
        'title': '${PortfolioData.projects.length}+',
        'subtitle': 'Projects Completed',
      },
      {'title': '2+', 'subtitle': 'Years Experience'},
      {
        'title': '${PortfolioData.skills.expand((cat) => cat.skills).length}+',
        'subtitle': 'Technologies',
      },
      {'title': '100%', 'subtitle': 'Client Satisfaction'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppTheme.spacingM,
        mainAxisSpacing: AppTheme.spacingM,
        childAspectRatio: 1.2,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        final stat = stats[index];
        return Card(
          elevation: 2,
          child: Container(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppTheme.radiusL),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppTheme.accentColor.withOpacity(0.1),
                  AppTheme.primaryColor.withOpacity(0.05),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  stat['title']!,
                  style: AppTheme.headingMedium.copyWith(
                    color: AppTheme.accentColor,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingS),
                Text(
                  stat['subtitle']!,
                  style: AppTheme.bodySmall.copyWith(
                    color: AppTheme.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildResumeCard() {
    return Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppTheme.spacingL),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
          gradient: AppTheme.primaryGradient,
        ),
        child: Column(
          children: [
            const Icon(
              Icons.download_rounded,
              size: 40,
              color: AppTheme.surfaceColor,
            ),

            const SizedBox(height: AppTheme.spacingM),

            Text(
              'Download Resume',
              style: AppTheme.headingSmall.copyWith(
                color: AppTheme.surfaceColor,
              ),
            ),

            const SizedBox(height: AppTheme.spacingS),

            Text(
              'Get a copy of my detailed CV',
              style: AppTheme.bodyMedium.copyWith(
                color: AppTheme.surfaceColor.withOpacity(0.9),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppTheme.spacingL),

            ElevatedButton(
              onPressed: () => UrlHelper.downloadFile(PortfolioData.resumeUrl),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.surfaceColor,
                foregroundColor: AppTheme.primaryColor,
              ),
              child: const Text('Download PDF'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Column(
      children: [
        Text(
          'Connect With Me',
          style: AppTheme.headingSmall,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: AppTheme.spacingL),

        Wrap(
          spacing: AppTheme.spacingM,
          runSpacing: AppTheme.spacingM,
          alignment: WrapAlignment.center,
          children: PortfolioData.socialLinks
              .map((social) => _buildSocialButton(social))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildSocialButton(social) {
    return InkWell(
      onTap: () => UrlHelper.launchURL(social.url),
      borderRadius: BorderRadius.circular(AppTheme.radiusL),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: AppTheme.accentColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
          border: Border.all(color: AppTheme.accentColor.withOpacity(0.2)),
        ),
        child: Icon(
          _getSocialIcon(social.name),
          color: AppTheme.accentColor,
          size: 24,
        ),
      ),
    );
  }

  IconData _getSocialIcon(String name) {
    switch (name.toLowerCase()) {
      case 'github':
        return Icons.code;
      case 'linkedin':
        return Icons.business;
      case 'portfolio':
        return Icons.web;
      case 'mostaql':
        return Icons.work;
      default:
        return Icons.link;
    }
  }
}
