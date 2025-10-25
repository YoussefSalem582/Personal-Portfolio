import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/assets/app_constants.dart';
import 'contact_info_list_widget.dart';

import '../../theme/app_theme.dart';

/// Widget displaying the biographical information section.
///
/// Enhanced with:
/// - Professional bio structure
/// - Highlighted key sections
/// - Better typography hierarchy
/// - Icon-based visual elements
class BioSectionWidget extends StatelessWidget {
  final VoidCallback? onNavigateToContact;

  const BioSectionWidget({super.key, this.onNavigateToContact});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section heading with gradient underline
        Row(
          children: [
            Text(
              'Who I Am',
              style: (isDark ? AppFonts.h2() : AppFonts.h2()).copyWith(
                fontWeight: AppFonts.bold,
              ),
            ),
            const SizedBox(width: AppTheme.spacingM),
            Expanded(
              child: Container(
                height: 3,
                decoration: BoxDecoration(
                  gradient: isDark
                      ? AppColors.primaryGradientDark
                      : AppColors.primaryGradientLight,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: AppTheme.spacingXL),

        // Main bio introduction
        Text(
          'As a dedicated Flutter Developer and Computer Science student at Nile University, I am passionate about crafting high-performance, cross-platform mobile applications using Dart and Flutter. With hands-on experience in building scalable apps like ChargeHub (EV station finder) and a carpooling platform, I excel in implementing robust state management with BLoC, integrating RESTful APIs, and leveraging Firebase for real-time backend services.',
          style:
              (isDark ? AppFonts.bodyLarge() : AppFonts.bodyLarge()).copyWith(
            height: 1.8,
            letterSpacing: 0.2,
            color: isDark ? AppColors.gray300 : AppColors.gray800,
            fontWeight: AppFonts.medium,
          ),
        ),

        const SizedBox(height: AppTheme.spacingXL),

        // Mobile App Development section
        _buildHighlightSection(
          context,
          icon: Icons.phone_android,
          title: 'Mobile App Development',
          description:
              'My projects emphasize clean architecture, modern UI/UX design, and seamless user experiences across Android and iOS platforms.',
          isDark: isDark,
        ),

        const SizedBox(height: AppTheme.spacingL),

        // Technical Interests section
        _buildHighlightSection(
          context,
          icon: AppIcons.technology,
          title: 'Technical Interests',
          description:
              'Passionate about advancing in Natural Language Processing, Machine Learning, and Computer Vision, with a keen interest in leveraging these fields to drive innovative tech solutions.',
          isDark: isDark,
        ),

        const SizedBox(height: AppTheme.spacingL),

        // Skills & Communication section
        _buildHighlightSection(
          context,
          icon: AppIcons.flutterIconSvg,
          title: 'Skills & Communication',
          description:
              'Proficient in developing feature-rich applications from music players to e-commerce marketplaces. I combine technical expertise with a focus on maintainable code and agile practices.',
          isDark: isDark,
        ),

        const SizedBox(height: AppTheme.spacingXL),

        // Closing statement
        Container(
          padding: const EdgeInsets.all(AppTheme.spacingL),
          decoration: BoxDecoration(
            gradient: isDark
                ? LinearGradient(
                    colors: [
                      AppColors.primaryLight.withValues(alpha: 0.1),
                      AppColors.accentLight.withValues(alpha: 0.1),
                    ],
                  )
                : LinearGradient(
                    colors: [
                      AppColors.accentLight.withValues(alpha: 0.08),
                      AppColors.primaryLight.withValues(alpha: 0.08),
                    ],
                  ),
            borderRadius: BorderRadius.circular(AppTheme.radiusM),
            border: Border.all(
              color: (isDark ? AppColors.primaryLight : AppColors.accentLight)
                  .withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                AppIcons.featured,
                color: isDark ? AppColors.primaryLight : AppColors.accentLight,
                size: 24,
              ),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: Text(
                  'I am eager to contribute my Flutter skills to innovate user-centric mobile solutions that drive engagement and scalability.',
                  style: (isDark ? AppFonts.bodyLarge() : AppFonts.bodyLarge())
                      .copyWith(
                    fontWeight: AppFonts.semiBold,
                    height: 1.6,
                    color: isDark ? AppColors.gray200 : AppColors.gray900,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: AppTheme.spacingXL),

        // Call to action
        Text(
          'Feel free to connect if you\'re interested in discussing technology, design, machine learning, or collaborative opportunities!',
          style:
              (isDark ? AppFonts.bodyLarge() : AppFonts.bodyLarge()).copyWith(
            fontStyle: FontStyle.italic,
            color: isDark ? AppColors.gray400 : AppColors.gray700,
            fontWeight: AppFonts.medium,
          ),
        ),

        const SizedBox(height: AppTheme.spacingXXL),

        // Contact information list
        ContactInfoListWidget(
          onNavigateToContact: onNavigateToContact,
        ),
      ],
    );
  }

  Widget _buildHighlightSection(
    BuildContext context, {
    required dynamic icon,
    required String title,
    required String description,
    required bool isDark,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        Container(
          padding: const EdgeInsets.all(AppTheme.spacingS),
          decoration: BoxDecoration(
            gradient: isDark
                ? AppColors.primaryGradientDark
                : AppColors.primaryGradientLight,
            borderRadius: BorderRadius.circular(AppTheme.radiusS),
            boxShadow: [
              BoxShadow(
                color: (isDark ? AppColors.primaryLight : AppColors.accentLight)
                    .withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: icon is String
              ? SvgPicture.asset(
                  icon,
                  width: 20,
                  height: 20,
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                )
              : Icon(
                  icon,
                  color: AppColors.white,
                  size: 20,
                ),
        ),
        const SizedBox(width: AppTheme.spacingM),
        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: (isDark ? AppFonts.h3() : AppFonts.h3()).copyWith(
                  fontWeight: AppFonts.bold,
                  color: isDark ? AppColors.white : AppColors.gray900,
                ),
              ),
              const SizedBox(height: AppTheme.spacingS),
              Text(
                description,
                style: (isDark ? AppFonts.bodyLarge() : AppFonts.bodyLarge())
                    .copyWith(
                  height: 1.7,
                  color: isDark ? AppColors.gray300 : AppColors.gray800,
                  fontWeight: AppFonts.medium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
