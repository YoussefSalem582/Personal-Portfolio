import 'package:flutter/material.dart';
import 'package:youssef_hassan_portfolio/features/skills/domain/entities/skill.dart';
import '../../utils/assets/app_constants.dart';
import 'skill_icon_widget.dart';

/// Individual Skill Item Widget
/// Displays a single skill card with icon and name
class SkillItemWidget extends StatelessWidget {
  final Skill skill;
  final bool isDark;
  final bool isMobile;

  const SkillItemWidget({
    super.key,
    required this.skill,
    required this.isDark,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final size = isMobile ? 100.0 : 120.0;
    final iconSize = isMobile ? 45.0 : 55.0;
    final color = AppColors.getSkillColor(skill.id);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.getSurface(isDark),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? AppColors.white.withOpacity(0.1)
              : AppColors.black.withOpacity(0.1),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? AppColors.black.withOpacity(0.3)
                : AppColors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: AppColors.transparent,
          child: InkWell(
            onTap: () {
              // TODO: Add skill detail dialog or navigation
            },
            hoverColor: color.withOpacity(0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon Container
                Container(
                  width: iconSize,
                  height: iconSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDark
                        ? AppColors.white.withOpacity(0.05)
                        : color.withOpacity(0.05),
                  ),
                  child: Center(
                    child: SkillIconWidget(
                      skillId: skill.id,
                      size: iconSize * 0.65,
                      color: color,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Skill Name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    skill.name,
                    style: AppFonts.labelMedium(
                      color: AppColors.getTextPrimary(isDark),
                    ).copyWith(fontWeight: AppFonts.semiBold),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
