import 'package:flutter/material.dart';
import '../../models/skill.dart';
import 'package:youssef_hassan_portfolio/core/localization/localized_extensions.dart';
import 'skill_category_widget.dart';

/// Skills Grid Widget
/// Displays all skill categories in a responsive grid layout
class SkillsGridWidget extends StatelessWidget {
  final bool isDark;
  final bool isMobile;
  final List<SkillCategory> categories;

  const SkillsGridWidget({
    super.key,
    required this.isDark,
    required this.isMobile,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    final maxWidth = isMobile ? double.infinity : 1400.0;
    final List<SkillCategory> categories = this.categories;

    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: isMobile
            ? _buildMobileLayout(categories)
            : _buildDesktopLayout(categories),
      ),
    );
  }

  /// Mobile Layout - Vertical Column
  Widget _buildMobileLayout(List<SkillCategory> categories) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: categories.map((category) {
        return SkillCategoryWidget(
          categoryName: category.localizedName,
          skills: category.skills,
          isDark: isDark,
          isMobile: isMobile,
        );
      }).toList(),
    );
  }

  /// Desktop Layout - Horizontal Row
  Widget _buildDesktopLayout(List<SkillCategory> categories) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: categories.map((category) {
        return Expanded(
          child: SkillCategoryWidget(
            categoryName: category.localizedName,
            skills: category.skills,
            isDark: isDark,
            isMobile: isMobile,
          ),
        );
      }).toList(),
    );
  }
}
