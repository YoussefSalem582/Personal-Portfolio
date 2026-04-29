import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:youssef_hassan_portfolio/features/skills/domain/entities/skill.dart';
import '../../../utils/assets/app_constants.dart';
import 'skill_item_widget.dart';

/// Skill Category Widget
/// Displays a category of skills with title and grid of skill items
class SkillCategoryWidget extends StatelessWidget {
  final String categoryName;
  final List<Skill> skills;
  final bool isDark;
  final bool isMobile;

  const SkillCategoryWidget({
    super.key,
    required this.categoryName,
    required this.skills,
    required this.isDark,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: isMobile ? 50 : 0,
        left: isMobile ? 0 : 10,
        right: isMobile ? 0 : 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Category Title
          Text(
            categoryName,
            style: isMobile
                ? AppFonts.h6(color: AppColors.getTextPrimary(isDark))
                : AppFonts.h5(color: AppColors.getTextPrimary(isDark)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          // Skills Grid with Animations
          AnimationLimiter(
            child: Wrap(
              spacing: isMobile ? 15 : 20,
              runSpacing: isMobile ? 15 : 20,
              alignment: WrapAlignment.center,
              children: List.generate(
                skills.length,
                (index) => AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                      child: SkillItemWidget(
                        skill: skills[index],
                        isDark: isDark,
                        isMobile: isMobile,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
