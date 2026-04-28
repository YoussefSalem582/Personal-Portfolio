import 'package:flutter/material.dart';
import '../../../../../utils/assets/app_constants.dart';
import '../../../../../utils/responsive_helper.dart';
import '../../../../../widgets/skills_section/skills_section_header.dart';
import '../../../../../widgets/skills_section/skills_grid_widget.dart';

/// Skills Section - Main Screen
/// Displays the tech stack with categories and individual skills
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile
            ? ResponsiveHelper.getVerticalPadding(screenWidth) * 0.8
            : ResponsiveHelper.getVerticalPadding(screenWidth),
        horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
      ),
      decoration: BoxDecoration(
        color: AppColors.getBackground(isDark),
      ),
      child: Column(
        children: [
          // Section Header
          SkillsSectionHeader(
            isDark: isDark,
            isMobile: isMobile,
          ),
          SizedBox(
              height: isMobile
                  ? ResponsiveHelper.getSectionSpacing(screenWidth) * 0.4
                  : ResponsiveHelper.getSectionSpacing(screenWidth) * 0.5),

          // Skills Grid
          SkillsGridWidget(
            isDark: isDark,
            isMobile: isMobile,
          ),
        ],
      ),
    );
  }
}
