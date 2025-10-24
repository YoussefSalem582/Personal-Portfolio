import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/data/portfolio_data.dart';
import '../../utils/url_helper.dart';
import '../../utils/responsive_helper.dart';
import '../../theme/app_theme.dart';

class HeroActionButtonsWidget extends StatelessWidget {
  final Function(int)? onNavigateToSection;

  const HeroActionButtonsWidget({
    super.key,
    this.onNavigateToSection,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);

    return Wrap(
      spacing: AppTheme.spacingM,
      runSpacing: AppTheme.spacingM,
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
      children: [
        // Primary CTA - Get In Touch
        _buildPrimaryButton(
          context,
          label: 'Get In Touch',
          icon: AppIcons.send,
          onPressed: () => _navigateToSection(6),
          isDark: isDark,
        ),
        // Secondary CTA - View Resume
        _buildSecondaryButton(
          context,
          label: 'View Resume',
          icon: AppIcons.download,
          onPressed: () => UrlHelper.openFile(PortfolioData.resumeUrl),
          isDark: isDark,
        ),
        // Tertiary CTA - View Projects
        _buildSecondaryButton(
          context,
          label: 'View Projects',
          icon: AppIcons.projects,
          onPressed: () => _navigateToSection(4),
          isDark: isDark,
        ),
      ],
    );
  }

  Widget _buildPrimaryButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
    required bool isDark,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: isDark
            ? AppColors.primaryGradientDark
            : AppColors.primaryGradientLight,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                .withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        label: Text(
          label,
          style: AppFonts.button().copyWith(
            fontWeight: AppFonts.semiBold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.transparent,
          foregroundColor: AppColors.white,
          shadowColor: AppColors.transparent,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
    required bool isDark,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20),
      label: Text(
        label,
        style: AppFonts.button().copyWith(
          color: isDark ? AppColors.accentDark : AppColors.accentLight,
          fontWeight: AppFonts.medium,
        ),
      ),
      style: OutlinedButton.styleFrom(
        foregroundColor: isDark ? AppColors.accentDark : AppColors.accentLight,
        side: BorderSide(
          color: (isDark ? AppColors.accentDark : AppColors.accentLight)
              .withValues(alpha: 0.5),
          width: 1.5,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  void _navigateToSection(int sectionIndex) {
    if (onNavigateToSection != null) {
      onNavigateToSection!(sectionIndex);
    }
  }
}
