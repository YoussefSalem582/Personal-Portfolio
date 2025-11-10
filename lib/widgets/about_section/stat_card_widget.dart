import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';
import '../../theme/app_theme.dart';
import '../common/animated_card.dart';
import '../common/common_widgets.dart';

/// A single statistic card widget with enhanced UI/UX.
///
/// Features:
/// - Hover effects with scale animation
/// - Dynamic gradient backgrounds based on theme
/// - Icon support for visual enhancement
/// - Smooth transitions and shadows
/// - Theme-aware colors
///
/// Examples:
/// - Title: "10+", Subtitle: "Projects Completed"
/// - Title: "2+", Subtitle: "Years Experience"
/// - Title: "100%", Subtitle: "Client Satisfaction"
class StatCardWidget extends StatelessWidget {
  /// The main statistic value (e.g., "10+", "2+", "100%")
  final String title;

  /// The description of the statistic (e.g., "Projects Completed")
  final String subtitle;

  /// Optional icon to display above the stat
  final IconData? icon;

  const StatCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isSmallMobile = screenWidth < 375;

    return AnimatedCard(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 4.0 : AppTheme.spacingM,
        vertical: isMobile ? 4.0 : AppTheme.spacingL,
      ),
      gradientColors: isDark
          ? [
              AppColors.cardDark,
              AppColors.cardDark,
            ]
          : [
              AppColors.surfaceLight,
              AppColors.surfaceLight.withValues(alpha: 0.95),
            ],
      hoverBorderColor: isDark
          ? AppColors.accentDark.withValues(alpha: 0.5)
          : AppColors.accentLight.withValues(alpha: 0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Optional icon
          if (icon != null) ...[
            IconContainer(
              icon: icon!,
              size: isMobile ? (isSmallMobile ? 24 : 30) : 46,
              iconSize: isMobile ? (isSmallMobile ? 10 : 14) : 22,
              shape: BoxShape.circle,
              gradientColors: isDark
                  ? [
                      AppColors.accentDark.withValues(alpha: 0.2),
                      AppColors.accentDark.withValues(alpha: 0.1),
                    ]
                  : [
                      AppColors.accentLight.withValues(alpha: 0.2),
                      AppColors.primaryLight.withValues(alpha: 0.1),
                    ],
              iconColor: isDark ? AppColors.accentDark : AppColors.accentLight,
            ),
            SizedBox(height: isMobile ? 3 : AppTheme.spacingS),
          ],

          // Large title with gradient text effect (stat value)
          GradientText(
            text: title,
            style: TextStyle(
              fontSize: isMobile ? (isSmallMobile ? 18 : 22) : 34,
              fontWeight: AppFonts.extraBold,
              letterSpacing: -0.5,
              fontFamily: AppFonts.primaryFont,
              height: 1.0,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            gradientColors: isDark
                ? [
                    AppColors.accentDark,
                    AppColors.accentDark.withValues(alpha: 0.8),
                  ]
                : [
                    AppColors.accentLight,
                    AppColors.primaryLight,
                  ],
          ),

          SizedBox(height: isMobile ? 2 : 6),

          // Divider line
          Container(
            width: isMobile ? 18 : 35,
            height: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              gradient: LinearGradient(
                colors: isDark
                    ? [
                        AppColors.accentDark,
                        AppColors.transparent,
                      ]
                    : [
                        AppColors.accentLight,
                        AppColors.transparent,
                      ],
              ),
            ),
          ),

          SizedBox(height: isMobile ? 2 : 6),

          // Subtitle (stat description)
          Text(
            subtitle,
            style: AppFonts.bodyMedium().copyWith(
              fontSize: isMobile ? (isSmallMobile ? 8 : 9) : 13,
              color: isDark ? AppColors.gray300 : AppColors.gray700,
              fontWeight: AppFonts.semiBold,
              letterSpacing: 0.1,
              height: 1.1,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
