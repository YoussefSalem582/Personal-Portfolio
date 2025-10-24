import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/project.dart';
import '../../utils/assets/app_constants.dart';

import '../../theme/app_theme.dart';

/// Project overview section with modern card design
class ProjectOverviewWidget extends StatelessWidget {
  final Project project;
  final String overviewText;

  const ProjectOverviewWidget({
    super.key,
    required this.project,
    required this.overviewText,
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
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: isDark
                    ? AppColors.primaryGradientDark
                    : AppColors.primaryGradientLight,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color:
                        (isDark ? AppColors.accentDark : AppColors.accentLight)
                            .withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                AppIcons.blog,
                color: AppColors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: AppTheme.spacingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Project Overview',
                    style: AppFonts.h4(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ).copyWith(
                      fontWeight: AppFonts.extraBold,
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 60,
                    margin: const EdgeInsets.only(top: 8),
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

        const SizedBox(height: AppTheme.spacingXL),

        // Overview Content Card
        Container(
          padding: const EdgeInsets.all(AppTheme.spacingXL),
          decoration: BoxDecoration(
            color: isDark ? AppColors.cardDark : AppColors.white,
            borderRadius: BorderRadius.circular(AppTheme.radiusL),
            border: Border.all(
              color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                  .withValues(alpha: 0.2),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: (isDark ? AppColors.black : AppColors.gray300)
                    .withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                overviewText,
                style: AppFonts.bodyLarge().copyWith(
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
        const SizedBox(height: AppTheme.spacingXXL),
        const Divider(),
        const SizedBox(height: AppTheme.spacingXL),
        Text(
          'Key Features',
          style: AppFonts.h5(
            color:
                isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ).copyWith(
            fontWeight: AppFonts.bold,
          ),
        ),
        const SizedBox(height: AppTheme.spacingL),
        ...features.map((feature) => Padding(
              padding: const EdgeInsets.only(bottom: AppTheme.spacingL),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: isDark
                          ? AppColors.primaryGradientDark
                          : AppColors.primaryGradientLight,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: (isDark
                                  ? AppColors.accentDark
                                  : AppColors.accentLight)
                              .withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: feature['icon'] is String
                        ? SvgPicture.asset(
                            feature['icon'] as String,
                            width: 24,
                            height: 24,
                            colorFilter: const ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn,
                            ),
                          )
                        : Icon(
                            feature['icon'] as IconData,
                            color: AppColors.white,
                            size: 24,
                          ),
                  ),
                  const SizedBox(width: AppTheme.spacingM),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          feature['title'] as String,
                          style: AppFonts.h3().copyWith(
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight,
                            fontWeight: AppFonts.bold,
                          ),
                        ),
                        const SizedBox(height: AppTheme.spacingS),
                        Text(
                          feature['description'] as String,
                          style: AppFonts.bodyMedium().copyWith(
                            color: isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                            height: 1.6,
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
