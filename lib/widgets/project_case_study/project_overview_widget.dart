import 'package:flutter/material.dart';
import '../../models/project.dart';
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
                    ? AppTheme.darkPrimaryGradient
                    : AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: (isDark
                            ? AppTheme.darkAccentColor
                            : AppTheme.accentColor)
                        .withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.article_rounded,
                color: Colors.white,
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
                    style: AppTheme.headingLarge.copyWith(
                      color: isDark
                          ? AppTheme.darkTextPrimary
                          : AppTheme.textPrimary,
                      fontWeight: FontWeight.w800,
                      fontSize: 28,
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 60,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      gradient: isDark
                          ? AppTheme.darkPrimaryGradient
                          : AppTheme.primaryGradient,
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
            color: isDark ? AppTheme.darkCardColor : Colors.white,
            borderRadius: BorderRadius.circular(AppTheme.radiusL),
            border: Border.all(
              color: (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
                  .withValues(alpha: 0.2),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: (isDark ? Colors.black : Colors.grey.shade300)
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
                style: AppTheme.bodyLarge.copyWith(
                  height: 1.8,
                  fontSize: 16,
                  color: isDark
                      ? AppTheme.darkTextSecondary
                      : AppTheme.textSecondary,
                  fontWeight: FontWeight.w400,
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
        'icon': Icons.psychology_rounded,
        'title': 'Real-time Emotion Detection',
        'description':
            'Advanced ML models analyze facial expressions and vocal patterns for accurate emotion recognition'
      },
      {
        'icon': Icons.security_rounded,
        'title': 'Privacy-First Architecture',
        'description':
            'Built with privacy by design principles, ensuring user data protection and compliance'
      },
      {
        'icon': Icons.multitrack_audio_rounded,
        'title': 'Multimodal Analysis',
        'description':
            'Combines audio and video processing for comprehensive emotion understanding'
      },
      {
        'icon': Icons.analytics_rounded,
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
          style: AppTheme.headingMedium.copyWith(
            color: isDark ? AppTheme.darkTextPrimary : AppTheme.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 22,
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
                          ? AppTheme.darkPrimaryGradient
                          : AppTheme.primaryGradient,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: (isDark
                                  ? AppTheme.darkAccentColor
                                  : AppTheme.accentColor)
                              .withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      feature['icon'] as IconData,
                      color: Colors.white,
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
                          style: AppTheme.headingSmall.copyWith(
                            color: isDark
                                ? AppTheme.darkTextPrimary
                                : AppTheme.textPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: AppTheme.spacingS),
                        Text(
                          feature['description'] as String,
                          style: AppTheme.bodyMedium.copyWith(
                            color: isDark
                                ? AppTheme.darkTextSecondary
                                : AppTheme.textSecondary,
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
