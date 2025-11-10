import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';

import '../../theme/app_theme.dart';

/// Technical stack section widget
///
/// Displays the technologies used in the project as styled chips.
/// Features:
/// - Gradient-enhanced chips with borders and shadows
/// - Theme-aware color scheme
/// - Responsive wrap layout
/// - Icon-enhanced section title
/// - Gradient underline accent
class TechnicalStackWidget extends StatelessWidget {
  /// List of technology names to display
  final List<String> technologies;
  final bool isMobile;
  final bool isSmallMobile;

  const TechnicalStackWidget({
    super.key,
    required this.technologies,
    this.isMobile = false,
    this.isSmallMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    // Detect current theme mode for styling
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title with icon and gradient underline
        Row(
          children: [
            // Gradient icon container with code icon
            Container(
              padding: EdgeInsets.all(isMobile ? 10 : 12),
              decoration: BoxDecoration(
                gradient: isDark
                    ? AppColors.primaryGradientDark
                    : AppColors.primaryGradientLight,
                borderRadius: BorderRadius.circular(isMobile ? 10 : 12),
                boxShadow: [
                  BoxShadow(
                    color:
                        (isDark ? AppColors.accentDark : AppColors.accentLight)
                            .withValues(alpha: 0.3),
                    blurRadius: isMobile ? 8 : 12,
                    offset: Offset(0, isMobile ? 2 : 4),
                  ),
                ],
              ),
              child: Icon(
                AppIcons.technology,
                color: AppColors.white,
                size: isMobile ? 20 : 24,
              ),
            ),
            SizedBox(width: isMobile ? AppTheme.spacingS : AppTheme.spacingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Technical Stack',
                    style: TextStyle(
                      fontSize: isMobile ? (isSmallMobile ? 20 : 22) : 28,
                      fontWeight: AppFonts.extraBold,
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                  ),
                  Container(
                    height: isMobile ? 2 : 3,
                    width: isMobile ? 45 : 60,
                    margin: EdgeInsets.only(top: isMobile ? 6 : 8),
                    decoration: BoxDecoration(
                      gradient: isDark
                          ? AppColors.primaryGradientDark
                          : AppColors.primaryGradientLight,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: isMobile ? AppTheme.spacingL : AppTheme.spacingXL),

        // Technology Chips - Responsive wrap layout
        Wrap(
          spacing: isMobile ? 8 : 12, // Horizontal spacing between chips
          runSpacing: isMobile ? 8 : 12, // Vertical spacing between rows
          children: technologies.map((tech) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? (isSmallMobile ? 14 : 16) : 20,
                vertical: isMobile ? (isSmallMobile ? 8 : 10) : 12,
              ),
              // Gradient-enhanced chip styling
              decoration: BoxDecoration(
                // Theme-aware gradient background
                gradient: LinearGradient(
                  colors: isDark
                      ? [
                          AppColors.accentDark.withValues(alpha: 0.2),
                          AppColors.primaryDark.withValues(alpha: 0.2),
                        ]
                      : [
                          AppColors.accentLight.withValues(alpha: 0.15),
                          AppColors.primaryLight.withValues(alpha: 0.15),
                        ],
                ),
                borderRadius: BorderRadius.circular(
                    isMobile ? AppTheme.radiusS : AppTheme.radiusM),
                // Colored border for accent
                border: Border.all(
                  color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                      .withValues(alpha: 0.4),
                  width: 1.5,
                ),
                // Subtle shadow for depth
                boxShadow: [
                  BoxShadow(
                    color:
                        (isDark ? AppColors.accentDark : AppColors.accentLight)
                            .withValues(alpha: 0.1),
                    blurRadius: isMobile ? 6 : 8,
                    offset: Offset(0, isMobile ? 1 : 2),
                  ),
                ],
              ),
              // Technology name text
              child: Text(
                tech,
                style: TextStyle(
                  fontSize: isMobile ? (isSmallMobile ? 12 : 13) : 14,
                  fontWeight: AppFonts.bold,
                  color: isDark ? AppColors.accentDark : AppColors.accentLight,
                  letterSpacing: 0.3,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
