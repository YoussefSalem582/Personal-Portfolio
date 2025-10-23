import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../utils/app_constants.dart';
import '../../utils/data/skills_data.dart';
import '../../models/skill.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
        horizontal: isMobile ? 20 : 40,
      ),
      decoration: BoxDecoration(
        color: AppColors.getBackground(isDark),
      ),
      child: Column(
        children: [
          // Section Header
          _buildSectionHeader(context, isDark, isMobile),
          SizedBox(height: isMobile ? 40 : 60),

          // Tech Stack Grid
          _buildTechStackContent(context, isDark, isMobile),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, bool isDark, bool isMobile) {
    return Column(
      children: [
        Text(
          'My Tech Stack',
          style: isMobile
              ? AppFonts.h3(color: AppColors.getTextPrimary(isDark))
              : AppFonts.h2(color: AppColors.getTextPrimary(isDark)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Container(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Text(
            'A collection of technologies I am proficient in and enjoy working with.',
            style:
                AppFonts.bodyLarge(color: AppColors.getTextSecondary(isDark)),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildTechStackContent(
      BuildContext context, bool isDark, bool isMobile) {
    final maxWidth = isMobile ? double.infinity : 1400.0;
    final categories = SkillsData.skills;

    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: categories.map((category) {
                  return _buildCategorySection(
                    context,
                    category.name,
                    category.skills,
                    isDark,
                    isMobile,
                  );
                }).toList(),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: categories.map((category) {
                  return Expanded(
                    child: _buildCategorySection(
                      context,
                      category.name,
                      category.skills,
                      isDark,
                      isMobile,
                    ),
                  );
                }).toList(),
              ),
      ),
    );
  }

  Widget _buildCategorySection(
    BuildContext context,
    String categoryName,
    List<Skill> skills,
    bool isDark,
    bool isMobile,
  ) {
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

          // Tech Items Grid
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
                      child: _buildTechItem(
                        context,
                        skills[index],
                        isDark,
                        isMobile,
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

  Widget _buildTechItem(
      BuildContext context, Skill skill, bool isDark, bool isMobile) {
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
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            hoverColor: color.withOpacity(0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon - Using Image.network for online icons
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
                    child:
                        _getSkillIconWidget(skill.id, iconSize * 0.65, color),
                  ),
                ),
                const SizedBox(height: 10),

                // Name
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

  Widget _getSkillIconWidget(String skillId, double size, Color color) {
    // Using simple CDN for icons - simpleicons.org
    final iconUrls = {
      // Languages
      'dart': 'https://cdn.simpleicons.org/dart/0175C2',
      'python': 'https://cdn.simpleicons.org/python/3776AB',
      'java': 'https://cdn.simpleicons.org/openjdk/E76F00',
      'cpp': 'https://cdn.simpleicons.org/cplusplus/00599C',
      'javascript': 'https://cdn.simpleicons.org/javascript/F7DF1E',
      'sql': 'https://cdn.simpleicons.org/postgresql/4479A1',

      // Mobile Development & State Management
      'flutter':
          'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg',
      'native-ui-ux': 'https://cdn.simpleicons.org/figma/F24E1E',
      'responsive-web': 'https://cdn.simpleicons.org/html5/E34F26',
      'getx':
          'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg',
      'bloc':
          'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg',
      'provider':
          'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg',
      'riverpod':
          'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg',

      // Backend, Cloud & Communication
      'rest-api': 'https://cdn.simpleicons.org/postman/FF6C37',
      'firebase': 'https://cdn.simpleicons.org/firebase/FFCA28',
      'supabase': 'https://cdn.simpleicons.org/supabase/3ECF8E',
      'custom-backend': 'https://cdn.simpleicons.org/nodedotjs/339933',
      'github-pages': 'https://cdn.simpleicons.org/githubpages/222222',
      'vercel': 'https://cdn.simpleicons.org/vercel/000000',
      'emailjs': 'https://cdn.simpleicons.org/gmail/168DE2',
      'fcm': 'https://cdn.simpleicons.org/firebase/FFCA28',
    };

    final iconUrl = iconUrls[skillId.toLowerCase()];

    if (iconUrl != null) {
      return Image.network(
        iconUrl,
        width: size,
        height: size,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          // Fallback to Material Icon if network fails
          return Icon(
            AppIcons.getSkillIcon(skillId),
            size: size,
            color: color,
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
            width: size,
            height: size,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
          );
        },
      );
    }

    // Fallback to Material Icon
    return Icon(
      AppIcons.getSkillIcon(skillId),
      size: size,
      color: color,
    );
  }
}
