import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'contact_info_list_widget.dart';

/// Widget displaying the biographical information section.
///
/// Enhanced with:
/// - Professional bio structure
/// - Highlighted key sections
/// - Better typography hierarchy
/// - Icon-based visual elements
class BioSectionWidget extends StatelessWidget {
  const BioSectionWidget({super.key});

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
              style: (isDark
                      ? AppTheme.headingMediumForTheme(context)
                      : AppTheme.headingMedium)
                  .copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: AppTheme.spacingM),
            Expanded(
              child: Container(
                height: 3,
                decoration: BoxDecoration(
                  gradient: isDark
                      ? AppTheme.darkPrimaryGradient
                      : AppTheme.primaryGradient,
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
          style: (isDark
                  ? AppTheme.bodyLargeForTheme(context)
                  : AppTheme.bodyLarge)
              .copyWith(
            fontSize: 16,
            height: 1.8,
            letterSpacing: 0.2,
            color: isDark ? Colors.grey.shade300 : Colors.grey.shade800,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: AppTheme.spacingXL),

        // Mobile App Development section
        _buildHighlightSection(
          context,
          icon: Icons.phone_android_rounded,
          title: 'Mobile App Development',
          description:
              'My projects emphasize clean architecture, modern UI/UX design, and seamless user experiences across Android and iOS platforms.',
          isDark: isDark,
        ),

        const SizedBox(height: AppTheme.spacingL),

        // Technical Interests section
        _buildHighlightSection(
          context,
          icon: Icons.psychology_rounded,
          title: 'Technical Interests',
          description:
              'Passionate about advancing in Natural Language Processing, Machine Learning, and Computer Vision, with a keen interest in leveraging these fields to drive innovative tech solutions.',
          isDark: isDark,
        ),

        const SizedBox(height: AppTheme.spacingL),

        // Skills & Communication section
        _buildHighlightSection(
          context,
          icon: Icons.code_rounded,
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
                      AppTheme.primaryColor.withOpacity(0.1),
                      AppTheme.accentColor.withOpacity(0.1),
                    ],
                  )
                : LinearGradient(
                    colors: [
                      AppTheme.accentColor.withOpacity(0.08),
                      AppTheme.primaryColor.withOpacity(0.08),
                    ],
                  ),
            borderRadius: BorderRadius.circular(AppTheme.radiusM),
            border: Border.all(
              color: (isDark ? AppTheme.primaryColor : AppTheme.accentColor)
                  .withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.rocket_launch_rounded,
                color: isDark ? AppTheme.primaryColor : AppTheme.accentColor,
                size: 24,
              ),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: Text(
                  'I am eager to contribute my Flutter skills to innovate user-centric mobile solutions that drive engagement and scalability.',
                  style: (isDark
                          ? AppTheme.bodyLargeForTheme(context)
                          : AppTheme.bodyLarge)
                      .copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    height: 1.6,
                    color: isDark ? Colors.grey.shade200 : Colors.grey.shade900,
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
          style: (isDark
                  ? AppTheme.bodyLargeForTheme(context)
                  : AppTheme.bodyLarge)
              .copyWith(
            fontStyle: FontStyle.italic,
            fontSize: 15,
            color: isDark ? Colors.grey.shade400 : Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: AppTheme.spacingXXL),

        // Contact information list
        const ContactInfoListWidget(),
      ],
    );
  }

  Widget _buildHighlightSection(
    BuildContext context, {
    required IconData icon,
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
                ? AppTheme.darkPrimaryGradient
                : AppTheme.primaryGradient,
            borderRadius: BorderRadius.circular(AppTheme.radiusS),
            boxShadow: [
              BoxShadow(
                color: (isDark ? AppTheme.primaryColor : AppTheme.accentColor)
                    .withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
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
                style: (isDark
                        ? AppTheme.headingSmallForTheme(context)
                        : AppTheme.headingSmall)
                    .copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : Colors.grey.shade900,
                ),
              ),
              const SizedBox(height: AppTheme.spacingS),
              Text(
                description,
                style: (isDark
                        ? AppTheme.bodyLargeForTheme(context)
                        : AppTheme.bodyLarge)
                    .copyWith(
                  fontSize: 15,
                  height: 1.7,
                  color: isDark ? Colors.grey.shade300 : Colors.grey.shade800,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
