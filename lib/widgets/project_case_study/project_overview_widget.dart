import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/project.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/data/project_case_study_data.dart';

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
                            .withOpacity(0.3),
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
                  .withOpacity(0.2),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: (isDark ? AppColors.black : AppColors.gray300)
                    .withOpacity(0.1),
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
              if (ProjectCaseStudyData.getProjectFeatures(project.id) != null)
                _buildProjectFeatures(
                    ProjectCaseStudyData.getProjectFeatures(project.id)!,
                    isDark),
            ],
          ),
        ),
      ],
    );
  }

  /// Build project-specific features section
  Widget _buildProjectFeatures(
      List<Map<String, dynamic>> features, bool isDark) {
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
        ...features.map((feature) => _buildFeatureItem(feature, isDark)),
      ],
    );
  }

  Widget _buildFeatureItem(Map<String, dynamic> feature, bool isDark) {
    return Padding(
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
                  color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                      .withOpacity(0.3),
                  blurRadius: isMobile ? 6 : 8,
                  offset: Offset(0, isMobile ? 1 : 2),
                ),
              ],
            ),
            child: _buildFeatureIcon(feature['icon'], isDark),
          ),
          SizedBox(width: isMobile ? AppTheme.spacingS : AppTheme.spacingM),
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
                    height: isMobile ? AppTheme.spacingXS : AppTheme.spacingS),
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
    );
  }

  /// Build icon widget based on icon type (String for SVG or IconData for Material)
  Widget _buildFeatureIcon(dynamic icon, bool isDark) {
    // Map string icon names to actual AppIcons or Icons
    if (icon is String) {
      // Check if it's an AppIcons reference (SVG)
      switch (icon) {
        case 'flutter_icon_svg':
          return SvgPicture.asset(
            AppIcons.flutterIconSvg,
            width: isMobile ? 20 : 24,
            height: isMobile ? 20 : 24,
            colorFilter: const ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
          );
        // AppIcons that are IconData (not SVG)
        case 'badge':
          return Icon(AppIcons.badge,
              color: AppColors.white, size: isMobile ? 20 : 24);
        case 'technology':
          return Icon(AppIcons.technology,
              color: AppColors.white, size: isMobile ? 20 : 24);
        case 'dashboard':
          return Icon(AppIcons.dashboard,
              color: AppColors.white, size: isMobile ? 20 : 24);
        // Material Icons by string name
        case 'store':
          return Icon(Icons.store,
              color: AppColors.white, size: isMobile ? 20 : 24);
        case 'map_outlined':
          return Icon(Icons.map_outlined,
              color: AppColors.white, size: isMobile ? 20 : 24);
        case 'chat':
          return Icon(Icons.chat,
              color: AppColors.white, size: isMobile ? 20 : 24);
        case 'payment':
          return Icon(Icons.payment,
              color: AppColors.white, size: isMobile ? 20 : 24);
        case 'language':
          return Icon(Icons.language,
              color: AppColors.white, size: isMobile ? 20 : 24);
        case 'analytics':
          return Icon(Icons.analytics,
              color: AppColors.white, size: isMobile ? 20 : 24);
        case 'family_restroom':
          return Icon(Icons.family_restroom,
              color: AppColors.white, size: isMobile ? 20 : 24);
        case 'restaurant_menu':
          return Icon(Icons.restaurant_menu,
              color: AppColors.white, size: isMobile ? 20 : 24);
        case 'mood':
          return Icon(Icons.mood,
              color: AppColors.white, size: isMobile ? 20 : 24);
        case 'map':
          return Icon(Icons.map,
              color: AppColors.white, size: isMobile ? 20 : 24);
        case 'chat_bubble':
          return Icon(Icons.chat_bubble,
              color: AppColors.white, size: isMobile ? 20 : 24);
        case 'calendar_today':
          return Icon(Icons.calendar_today,
              color: AppColors.white, size: isMobile ? 20 : 24);
        default:
          return Icon(Icons.check_circle,
              color: AppColors.white, size: isMobile ? 20 : 24);
      }
    } else if (icon is IconData) {
      return Icon(icon, color: AppColors.white, size: isMobile ? 20 : 24);
    }
    // Fallback
    return Icon(Icons.check_circle,
        color: AppColors.white, size: isMobile ? 20 : 24);
  }
}
