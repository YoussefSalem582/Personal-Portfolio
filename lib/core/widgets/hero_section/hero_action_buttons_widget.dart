import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';
import 'package:youssef_salem_portfolio/features/hero/data/local/personal_info_data.dart';
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
    final l10n = AppLocalizations.of(context);
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
          label: l10n.footerGetInTouch,
          icon: AppIcons.send,
          onPressed: () => _navigateToSection(6),
          isMobile: isMobile,
        ),

        // Secondary CTA - View Resume
        SecondaryOutlinedButton(
          label: l10n.footerViewResume,
          icon: AppIcons.download,
          onPressed: () => UrlHelper.openFile(PersonalInfoData.resumeUrl),
          isMobile: isMobile,
        ),

        // Tertiary CTA - View Projects
        SecondaryOutlinedButton(
          label: l10n.heroViewProjects,
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
