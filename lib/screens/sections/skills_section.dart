import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../theme/app_theme.dart';
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
        color: isDark ? AppTheme.darkBackgroundColor : AppTheme.backgroundColor,
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
          style: TextStyle(
            fontSize: isMobile ? 32 : 42,
            fontWeight: FontWeight.bold,
            color: isDark ? AppTheme.darkTextPrimary : AppTheme.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Container(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Text(
            'A collection of technologies I am proficient in and enjoy working with.',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color:
                  isDark ? AppTheme.darkTextSecondary : AppTheme.textSecondary,
              height: 1.5,
            ),
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
            style: TextStyle(
              fontSize: isMobile ? 22 : 24,
              fontWeight: FontWeight.bold,
              color: isDark ? AppTheme.darkTextPrimary : AppTheme.textPrimary,
            ),
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
    final color = _getSkillColor(skill.id);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkCardColor : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.1),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.3)
                : Colors.black.withOpacity(0.08),
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
                        ? Colors.white.withOpacity(0.05)
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
                    style: TextStyle(
                      fontSize: isMobile ? 12 : 13,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppTheme.darkTextPrimary
                          : AppTheme.textPrimary,
                    ),
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
            _getSkillIcon(skillId),
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
      _getSkillIcon(skillId),
      size: size,
      color: color,
    );
  }

  IconData _getSkillIcon(String skillId) {
    // Map skill IDs to Material Icons
    switch (skillId.toLowerCase()) {
      // Languages
      case 'dart':
        return Icons.flutter_dash;
      case 'python':
        return Icons.pets;
      case 'java':
        return Icons.coffee;
      case 'cpp':
        return Icons.code;
      case 'javascript':
        return Icons.javascript;
      case 'sql':
        return Icons.storage;

      // Mobile Development & State Management
      case 'flutter':
        return Icons.flutter_dash;
      case 'native-ui-ux':
        return Icons.design_services;
      case 'responsive-web':
        return Icons.devices;
      case 'getx':
        return Icons.flutter_dash;
      case 'bloc':
        return Icons.flutter_dash;
      case 'provider':
        return Icons.flutter_dash;
      case 'riverpod':
        return Icons.flutter_dash;

      // Backend, Cloud & Communication
      case 'rest-api':
        return Icons.api;
      case 'firebase':
        return Icons.local_fire_department;
      case 'supabase':
        return Icons.bolt;
      case 'custom-backend':
        return Icons.dns;
      case 'github-pages':
        return Icons.public;
      case 'vercel':
        return Icons.cloud_upload;
      case 'emailjs':
        return Icons.email;
      case 'fcm':
        return Icons.notifications;

      default:
        return Icons.code;
    }
  }

  Color _getSkillColor(String skillId) {
    // Assign colors based on skill
    switch (skillId.toLowerCase()) {
      // Languages
      case 'dart':
        return const Color(0xFF0175C2);
      case 'python':
        return const Color(0xFF3776AB);
      case 'java':
        return const Color(0xFFE76F00);
      case 'cpp':
        return const Color(0xFF00599C);
      case 'javascript':
        return const Color(0xFFF7DF1E);
      case 'sql':
        return const Color(0xFF4479A1);

      // Mobile Development & State Management
      case 'flutter':
        return const Color(0xFF02569B);
      case 'native-ui-ux':
        return const Color(0xFFF24E1E);
      case 'responsive-web':
        return const Color(0xFFE34F26);
      case 'getx':
        return const Color(0xFF8A2BE2);
      case 'bloc':
        return const Color(0xFF02569B);
      case 'provider':
        return const Color(0xFF0175C2);
      case 'riverpod':
        return const Color(0xFF0175C2);

      // Backend, Cloud & Communication
      case 'rest-api':
        return const Color(0xFFFF6C37);
      case 'firebase':
        return const Color(0xFFFFCA28);
      case 'supabase':
        return const Color(0xFF3ECF8E);
      case 'custom-backend':
        return const Color(0xFF339933);
      case 'github-pages':
        return const Color(0xFF222222);
      case 'vercel':
        return const Color(0xFF000000);
      case 'emailjs':
        return const Color(0xFF168DE2);
      case 'fcm':
        return const Color(0xFFFFCA28);

      default:
        return AppTheme.accentColor;
    }
  }
}
