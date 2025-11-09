import 'package:flutter/material.dart';
import '../../utils/data/portfolio_data.dart';
import '../../utils/url_helper.dart';
import '../../utils/responsive_helper.dart';
import '../../utils/assets/app_constants.dart';
import '../../theme/app_theme.dart';
import '../common/custom_buttons.dart';

class HeroActionButtonsWidget extends StatelessWidget {
  final Function(int)? onNavigateToSection;

  const HeroActionButtonsWidget({
    super.key,
    this.onNavigateToSection,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final isSmallMobile = ResponsiveHelper.isSmallMobile(screenWidth);

    return Wrap(
      spacing: isSmallMobile ? AppTheme.spacingS : AppTheme.spacingM,
      runSpacing: isSmallMobile ? AppTheme.spacingS : AppTheme.spacingM,
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
      children: [
        // Primary CTA - Get In Touch
        PrimaryGradientButton(
          label: 'Get In Touch',
          icon: AppIcons.send,
          onPressed: () => _navigateToSection(6),
          isMobile: isMobile,
        ),

        // Secondary CTA - View Resume
        SecondaryOutlinedButton(
          label: 'View Resume',
          icon: AppIcons.download,
          onPressed: () => UrlHelper.openFile(PortfolioData.resumeUrl),
          isMobile: isMobile,
        ),

        // Tertiary CTA - View Projects
        SecondaryOutlinedButton(
          label: 'View Projects',
          icon: AppIcons.projects,
          onPressed: () => _navigateToSection(4),
          isMobile: isMobile,
        ),
      ],
    );
  }

  void _navigateToSection(int sectionIndex) {
    if (onNavigateToSection != null) {
      onNavigateToSection!(sectionIndex);
    }
  }
}
