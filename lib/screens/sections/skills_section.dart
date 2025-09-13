import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../theme/app_theme.dart';
import '../../utils/responsive_helper.dart';
import '../../utils/portfolio_data.dart';
import '../../models/skill.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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

            const SizedBox(height: AppTheme.spacingXL),

            // Skills categories
            if (isMobile)
              _buildMobileSkillsLayout()
            else
              _buildDesktopSkillsLayout(),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopSkillsLayout() {
    return AnimationLimiter(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppTheme.spacingXL,
          mainAxisSpacing: AppTheme.spacingXL,
          childAspectRatio: 1.2,
        ),
        itemCount: PortfolioData.skills.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 500),
            columnCount: 2,
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: _buildSkillCategory(PortfolioData.skills[index]),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMobileSkillsLayout() {
    return AnimationLimiter(
      child: Column(
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 500),
          childAnimationBuilder: (widget) => SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(child: widget),
          ),
          children: PortfolioData.skills
              .map(
                (category) => Padding(
                  padding: const EdgeInsets.only(bottom: AppTheme.spacingL),
                  child: _buildSkillCategory(category),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildSkillCategory(SkillCategory category) {
    return Builder(
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;

        return Card(
          elevation: 4,
          shadowColor: Colors.black12,
          child: Container(
            padding: const EdgeInsets.all(AppTheme.spacingL),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppTheme.radiusL),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? [
                        AppTheme.darkSurfaceColor,
                        AppTheme.darkAccentColor.withOpacity(0.02),
                      ]
                    : [
                        AppTheme.surfaceColor,
                        AppTheme.accentColor.withOpacity(0.02),
                      ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category title
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppTheme.spacingS),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppTheme.darkAccentColor.withOpacity(0.1)
                            : AppTheme.accentColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppTheme.radiusS),
                      ),
                      child: Icon(
                        _getCategoryIcon(category.name),
                        size: 24,
                        color: isDark
                            ? AppTheme.darkAccentColor
                            : AppTheme.accentColor,
                      ),
                    ),
                    const SizedBox(width: AppTheme.spacingM),
                    Expanded(
                      child: Text(
                        category.name,
                        style: AppTheme.headingSmall.copyWith(
                          fontSize: 18,
                          color: isDark
                              ? AppTheme.darkTextPrimary
                              : AppTheme.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppTheme.spacingL),

                // Skills list
                Expanded(
                  child: Column(
                    children: category.skills
                        .map(
                          (skill) => Padding(
                            padding: const EdgeInsets.only(
                              bottom: AppTheme.spacingM,
                            ),
                            child: _buildSkillItem(skill),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSkillItem(Skill skill) {
    return Builder(
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;

        return Column(
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
                _buildProficiencyStars(skill.proficiency),
              ],
            ),

            const SizedBox(height: AppTheme.spacingS),

            // Progress bar
            LinearProgressIndicator(
              value: skill.proficiency / 5.0,
              backgroundColor: isDark
                  ? AppTheme.darkAccentColor.withOpacity(0.1)
                  : AppTheme.accentColor.withOpacity(0.1),
              valueColor: AlwaysStoppedAnimation<Color>(
                _getProficiencyColor(skill.proficiency),
              ),
              minHeight: 4,
            ),
          ],
        );
      },
    );
  }

  Widget _buildProficiencyStars(int proficiency) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < proficiency ? Icons.star : Icons.star_border,
          size: 16,
          color: index < proficiency
              ? _getProficiencyColor(proficiency)
              : AppTheme.textSecondary.withOpacity(0.3),
        );
      }),
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
