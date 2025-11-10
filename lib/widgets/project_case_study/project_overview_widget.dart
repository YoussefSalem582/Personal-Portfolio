import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/project.dart';
import '../../utils/assets/app_constants.dart';

import '../../theme/app_theme.dart';

/// Project overview section with modern card design
class ProjectOverviewWidget extends StatelessWidget {
  final Project project;
  final String overviewText;
  final bool isMobile;
  final bool isSmallMobile;

  const ProjectOverviewWidget({
    super.key,
    required this.project,
    required this.overviewText,
    this.isMobile = false,
    this.isSmallMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title with gradient underline
        Row(
          children: [
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
                AppIcons.blog,
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
                    'Project Overview',
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

        // Overview Content Card
        Container(
          padding:
              EdgeInsets.all(isMobile ? AppTheme.spacingL : AppTheme.spacingXL),
          decoration: BoxDecoration(
            color: isDark ? AppColors.cardDark : AppColors.white,
            borderRadius: BorderRadius.circular(
                isMobile ? AppTheme.radiusM : AppTheme.radiusL),
            border: Border.all(
              color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                  .withValues(alpha: 0.2),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: (isDark ? AppColors.black : AppColors.gray300)
                    .withValues(alpha: 0.1),
                blurRadius: isMobile ? 12 : 20,
                offset: Offset(0, isMobile ? 4 : 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                overviewText,
                style: TextStyle(
                  fontSize: isMobile ? (isSmallMobile ? 14 : 15) : 16,
                  height: 1.8,
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                  fontWeight: AppFonts.regular,
                  letterSpacing: 0.2,
                ),
              ),

              // Additional project-specific features
              if (project.id == 'emosense-app') _buildEmosenseFeatures(isDark),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEmosenseFeatures(bool isDark) {
    final features = [
      {
        'icon': AppIcons.flutterIconSvg,
        'title': 'Real-time Emotion Detection',
        'description':
            'Advanced ML models analyze facial expressions and vocal patterns for accurate emotion recognition'
      },
      {
        'icon': AppIcons.badge,
        'title': 'Privacy-First Architecture',
        'description':
            'Built with privacy by design principles, ensuring user data protection and compliance'
      },
      {
        'icon': AppIcons.technology,
        'title': 'Multimodal Analysis',
        'description':
            'Combines audio and video processing for comprehensive emotion understanding'
      },
      {
        'icon': AppIcons.dashboard,
        'title': 'Advanced Analytics',
        'description':
            'Comprehensive emotion analytics dashboard with insights and reporting capabilities'
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: isMobile ? AppTheme.spacingL : AppTheme.spacingXXL),
        const Divider(),
        SizedBox(height: isMobile ? AppTheme.spacingM : AppTheme.spacingXL),
        Text(
          'Key Features',
          style: TextStyle(
            fontSize: isMobile ? (isSmallMobile ? 18 : 20) : 22,
            fontWeight: AppFonts.bold,
            color:
                isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        SizedBox(height: isMobile ? AppTheme.spacingM : AppTheme.spacingL),
        ...features.map((feature) => Padding(
              padding: EdgeInsets.only(
                  bottom: isMobile ? AppTheme.spacingM : AppTheme.spacingL),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(isMobile ? 10 : 12),
                    decoration: BoxDecoration(
                      gradient: isDark
                          ? AppColors.primaryGradientDark
                          : AppColors.primaryGradientLight,
                      borderRadius: BorderRadius.circular(isMobile ? 10 : 12),
                      boxShadow: [
                        BoxShadow(
                          color: (isDark
                                  ? AppColors.accentDark
                                  : AppColors.accentLight)
                              .withValues(alpha: 0.3),
                          blurRadius: isMobile ? 6 : 8,
                          offset: Offset(0, isMobile ? 1 : 2),
                        ),
                      ],
                    ),
                    child: feature['icon'] is String
                        ? SvgPicture.asset(
                            feature['icon'] as String,
                            width: isMobile ? 20 : 24,
                            height: isMobile ? 20 : 24,
                            colorFilter: const ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn,
                            ),
                          )
                        : Icon(
                            feature['icon'] as IconData,
                            color: AppColors.white,
                            size: isMobile ? 20 : 24,
                          ),
                  ),
                  SizedBox(
                      width: isMobile ? AppTheme.spacingS : AppTheme.spacingM),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          feature['title'] as String,
                          style: TextStyle(
                            fontSize: isMobile ? (isSmallMobile ? 15 : 16) : 18,
                            fontWeight: AppFonts.bold,
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight,
                          ),
                        ),
                        SizedBox(
                            height: isMobile
                                ? AppTheme.spacingXS
                                : AppTheme.spacingS),
                        Text(
                          feature['description'] as String,
                          style: TextStyle(
                            fontSize: isMobile ? (isSmallMobile ? 13 : 14) : 15,
                            height: 1.6,
                            color: isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
