import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../utils/responsive_helper.dart';
import '../../utils/data/portfolio_data.dart';
import '../../models/skill.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      color: isDark ? AppTheme.darkSurfaceColor : AppTheme.surfaceColor,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
        vertical: AppTheme.spacingXXL,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ResponsiveHelper.getMaxWidth(screenWidth),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Section title
            Text(
              'Skills & Technologies',
              style: (isDark
                      ? AppTheme.headingLargeForTheme(context)
                      : AppTheme.headingLarge)
                  .copyWith(fontSize: 36),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppTheme.spacingS),

            Container(
              width: 60,
              height: 4,
              decoration: BoxDecoration(
                gradient: isDark
                    ? AppTheme.darkPrimaryGradient
                    : AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            const SizedBox(height: AppTheme.spacingM),

            Text(
              'Technologies and tools I work with',
              style: AppTheme.bodyLarge.copyWith(
                color: isDark
                    ? AppTheme.darkTextSecondary
                    : AppTheme.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppTheme.spacingXXL),

            // Skills categories - Simplified layout
            _buildSkillsGrid(isDark, isMobile),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsGrid(bool isDark, bool isMobile) {
    return Wrap(
      spacing: AppTheme.spacingL,
      runSpacing: AppTheme.spacingL,
      alignment: WrapAlignment.center,
      children: PortfolioData.skills.map((category) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: isMobile ? double.infinity : 400,
            maxWidth: isMobile ? double.infinity : 500,
          ),
          child: _buildSkillCategory(category, isDark),
        );
      }).toList(),
    );
  }

  Widget _buildSkillCategory(SkillCategory category, bool isDark) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: Card(
        elevation: _selectedCategory == category.name ? 8 : 2,
        shadowColor: isDark ? Colors.black38 : Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
          side: _selectedCategory == category.name
              ? BorderSide(
                  color:
                      isDark ? AppTheme.darkAccentColor : AppTheme.accentColor,
                  width: 2,
                )
              : BorderSide.none,
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              _selectedCategory =
                  _selectedCategory == category.name ? null : category.name;
            });
          },
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
          child: Container(
            padding: const EdgeInsets.all(AppTheme.spacingL),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppTheme.radiusL),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? [
                        AppTheme.darkCardColor,
                        AppTheme.darkSurfaceColor,
                      ]
                    : [
                        AppTheme.surfaceColor,
                        AppTheme.backgroundColor,
                      ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Category header
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppTheme.spacingM),
                      decoration: BoxDecoration(
                        gradient: isDark
                            ? AppTheme.darkPrimaryGradient
                            : AppTheme.primaryGradient,
                        borderRadius: BorderRadius.circular(AppTheme.radiusM),
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
                        _getCategoryIcon(category.name),
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: AppTheme.spacingM),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category.name,
                            style: AppTheme.headingSmall.copyWith(
                              fontSize: 18,
                              color: isDark
                                  ? AppTheme.darkTextPrimary
                                  : AppTheme.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${category.skills.length} skills',
                            style: AppTheme.bodySmall.copyWith(
                              color: isDark
                                  ? AppTheme.darkTextSecondary
                                  : AppTheme.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      _selectedCategory == category.name
                          ? Icons.expand_less
                          : Icons.expand_more,
                      color: isDark
                          ? AppTheme.darkTextSecondary
                          : AppTheme.textSecondary,
                    ),
                  ],
                ),

                // Expandable skills list
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  crossFadeState: _selectedCategory == category.name
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  firstChild: const SizedBox.shrink(),
                  secondChild: Column(
                    children: [
                      const SizedBox(height: AppTheme.spacingL),
                      const Divider(),
                      const SizedBox(height: AppTheme.spacingM),
                      ...category.skills.map(
                        (skill) => Padding(
                          padding:
                              const EdgeInsets.only(bottom: AppTheme.spacingM),
                          child: _buildSkillItem(skill, isDark),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkillItem(Skill skill, bool isDark) {
    final proficiencyPercent = (skill.proficiency / 5.0 * 100).toInt();
    final proficiencyColor = _getProficiencyColor(skill.proficiency);

    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: isDark
            ? AppTheme.darkSurfaceColor.withValues(alpha: 0.5)
            : Colors.white.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        border: Border.all(
          color: isDark
              ? AppTheme.darkTextSecondary.withValues(alpha: 0.1)
              : AppTheme.textSecondary.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  skill.name,
                  style: AppTheme.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AppTheme.darkTextPrimary
                        : AppTheme.textPrimary,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingS,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: proficiencyColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: proficiencyColor.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  '$proficiencyPercent%',
                  style: AppTheme.bodySmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: proficiencyColor,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppTheme.spacingS),

          // Modern progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeOutCubic,
              tween: Tween<double>(
                begin: 0.0,
                end: skill.proficiency / 5.0,
              ),
              builder: (context, value, _) => LinearProgressIndicator(
                value: value,
                backgroundColor: isDark
                    ? AppTheme.darkTextSecondary.withValues(alpha: 0.1)
                    : AppTheme.textSecondary.withValues(alpha: 0.1),
                valueColor: AlwaysStoppedAnimation<Color>(proficiencyColor),
                minHeight: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getProficiencyColor(int proficiency) {
    switch (proficiency) {
      case 5:
        return AppTheme.successColor;
      case 4:
        return AppTheme.accentColor;
      case 3:
        return Colors.orange;
      case 2:
        return Colors.amber;
      case 1:
        return AppTheme.errorColor;
      default:
        return AppTheme.textSecondary;
    }
  }

  IconData _getCategoryIcon(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'mobile development':
        return Icons.phone_android;
      case 'programming languages':
        return Icons.code;
      case 'web development':
        return Icons.web;
      case 'ai & machine learning':
        return Icons.psychology;
      case 'tools & technologies':
        return Icons.build;
      default:
        return Icons.category;
    }
  }
}
