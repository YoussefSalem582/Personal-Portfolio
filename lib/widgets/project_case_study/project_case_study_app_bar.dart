import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/theme_controller.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/responsive_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Custom AppBar for Project Case Study Screen
///
/// Features:
/// - Back button to return to projects
/// - Project title display
/// - Section navigation (Overview, Tech Stack, Documents, Gallery, Challenges, Learnings)
/// - Theme toggle with GetX integration
/// - Responsive design matching main navigation style
class ProjectCaseStudyAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String projectTitle;
  final Function(int)? onSectionSelected;
  final int currentSection;
  final GlobalKey? overviewKey;
  final GlobalKey? techStackKey;
  final GlobalKey? documentsKey;
  final GlobalKey? galleryKey;
  final GlobalKey? challengesKey;
  final GlobalKey? learningsKey;

  const ProjectCaseStudyAppBar({
    super.key,
    required this.projectTitle,
    this.onSectionSelected,
    this.currentSection = 0,
    this.overviewKey,
    this.techStackKey,
    this.documentsKey,
    this.galleryKey,
    this.challengesKey,
    this.learningsKey,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70.0);

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);

    return Obx(() {
      final isDark = themeController.isDarkMode;

      return Container(
        height: 70,
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
          vertical: 8,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [
                    AppColors.surfaceDark,
                    AppColors.surfaceDark.withValues(alpha: 0.95),
                  ]
                : [
                    AppColors.surfaceLight,
                    AppColors.surfaceLight.withValues(alpha: 0.98),
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: Border(
            bottom: BorderSide(
              color: isDark
                  ? AppColors.accentDark.withValues(alpha: 0.2)
                  : AppColors.accentLight.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? AppColors.black.withValues(alpha: 0.3)
                  : AppColors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            // Back button + Project title
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Back button
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color:
                          isDark ? AppColors.accentDark : AppColors.accentLight,
                      size: 20,
                    ),
                    onPressed: () => Navigator.pop(context),
                    tooltip: 'Back to Projects',
                    style: IconButton.styleFrom(
                      backgroundColor: isDark
                          ? AppColors.white.withValues(alpha: 0.1)
                          : AppColors.black.withValues(alpha: 0.05),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Project title with icon
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: isDark
                                  ? [
                                      AppColors.accentDark,
                                      AppColors.accentDark
                                          .withValues(alpha: 0.7)
                                    ]
                                  : [
                                      AppColors.accentLight,
                                      AppColors.accentLight
                                          .withValues(alpha: 0.8)
                                    ],
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset(
                            AppIcons.flutterIconSvg,
                            width: 20,
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        if (!isMobile)
                          Flexible(
                            child: ShaderMask(
                              shaderCallback: (bounds) => LinearGradient(
                                colors: isDark
                                    ? [AppColors.accentDark, AppColors.white]
                                    : [
                                        AppColors.primaryLight,
                                        AppColors.accentLight
                                      ],
                              ).createShader(bounds),
                              child: Text(
                                projectTitle,
                                style: AppFonts.h6().copyWith(
                                  color: AppColors.white,
                                  fontWeight: AppFonts.bold,
                                  letterSpacing: -0.3,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Navigation sections (only on desktop)
            if (!isMobile)
              Flexible(
                flex: 3,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: _buildSectionItems(isDark),
                ),
              ),

            const SizedBox(width: 20),

            // Theme toggle
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.white.withValues(alpha: 0.1)
                    : AppColors.black.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isDark
                      ? AppColors.white.withValues(alpha: 0.15)
                      : AppColors.black.withValues(alpha: 0.1),
                  width: 1,
                ),
              ),
              child: IconButton(
                icon: Icon(
                  isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  size: 20,
                ),
                color: isDark ? AppColors.accentDark : AppColors.accentLight,
                onPressed: themeController.toggleTheme,
                tooltip: isDark ? 'Light Mode' : 'Dark Mode',
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
              ),
            ),
          ],
        ),
      );
    });
  }

  List<Widget> _buildSectionItems(bool isDark) {
    final sections = [
      {'title': 'Overview', 'index': 0, 'key': overviewKey},
      {'title': 'Tech Stack', 'index': 1, 'key': techStackKey},
      {'title': 'Documents', 'index': 2, 'key': documentsKey},
      {'title': 'Gallery', 'index': 3, 'key': galleryKey},
      {'title': 'Challenges', 'index': 4, 'key': challengesKey},
      {'title': 'Learnings', 'index': 5, 'key': learningsKey},
    ];

    return sections
        .expand((section) => [
              _ProjectSectionItem(
                title: section['title'] as String,
                index: section['index'] as int,
                isSelected: currentSection == section['index'],
                onTap: () {
                  final key = section['key'] as GlobalKey?;
                  if (key != null && key.currentContext != null) {
                    Scrollable.ensureVisible(
                      key.currentContext!,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      alignment: 0.1,
                    );
                  }
                  onSectionSelected?.call(section['index'] as int);
                },
                isDark: isDark,
              ),
              const SizedBox(width: 24),
            ])
        .take(sections.length * 2 - 1)
        .toList();
  }
}

/// Individual section navigation item for project case study
class _ProjectSectionItem extends StatelessWidget {
  final String title;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isDark;

  const _ProjectSectionItem({
    required this.title,
    required this.index,
    required this.isSelected,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        hoverColor: (isDark ? AppColors.accentDark : AppColors.accentLight)
            .withValues(alpha: 0.1),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: isSelected
                ? LinearGradient(
                    colors: isDark
                        ? [
                            AppColors.accentDark.withValues(alpha: 0.2),
                            AppColors.accentDark.withValues(alpha: 0.1),
                          ]
                        : [
                            AppColors.accentLight.withValues(alpha: 0.15),
                            AppColors.accentLight.withValues(alpha: 0.08),
                          ],
                  )
                : null,
            border: isSelected
                ? Border.all(
                    color:
                        (isDark ? AppColors.accentDark : AppColors.accentLight)
                            .withValues(alpha: 0.4),
                    width: 1.5,
                  )
                : null,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: (isDark
                              ? AppColors.accentDark
                              : AppColors.accentLight)
                          .withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Text(
            title,
            style: AppFonts.labelMedium().copyWith(
              color: isSelected
                  ? (isDark ? AppColors.accentDark : AppColors.accentLight)
                  : (isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight),
              fontWeight: isSelected ? AppFonts.bold : AppFonts.regular,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
