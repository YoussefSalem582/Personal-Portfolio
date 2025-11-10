import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/theme_controller.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/responsive_helper.dart';

/// Custom AppBar for Project Case Study Screen
///
/// Features:
/// - Back button to return to projects
/// - Project title display with project-specific image
/// - Section navigation (Overview, Tech Stack, Documents, Gallery, Challenges, Learnings)
/// - Theme toggle with GetX integration
/// - Responsive design matching main navigation style
class ProjectCaseStudyAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String projectTitle;
  final String? projectImageUrl;
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
    this.projectImageUrl,
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
    final isSmallMobile = ResponsiveHelper.isSmallMobile(screenWidth);

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
                    AppColors.surfaceDark.withOpacity(0.95),
                  ]
                : [
                    AppColors.surfaceLight,
                    AppColors.surfaceLight.withOpacity(0.98),
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: Border(
            bottom: BorderSide(
              color: isDark
                  ? AppColors.accentDark.withOpacity(0.2)
                  : AppColors.accentLight.withOpacity(0.1),
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? AppColors.black.withOpacity(0.3)
                  : AppColors.black.withOpacity(0.08),
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
                      size: isMobile ? 18 : 20,
                    ),
                    onPressed: () => Navigator.pop(context),
                    tooltip: 'Back to Projects',
                    style: IconButton.styleFrom(
                      backgroundColor: isDark
                          ? AppColors.white.withOpacity(0.1)
                          : AppColors.black.withOpacity(0.05),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(width: isMobile ? 8 : 12),
                  // Project title with icon
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Dynamic project logo with Hero animation
                        Hero(
                          tag: 'project_icon_$projectTitle',
                          child: Container(
                            width: isSmallMobile ? 36 : 40,
                            height: isSmallMobile ? 36 : 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: (isDark
                                          ? AppColors.accentDark
                                          : AppColors.accentLight)
                                      .withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: projectImageUrl != null &&
                                      projectImageUrl!.isNotEmpty
                                  ? Image.asset(
                                      projectImageUrl!,
                                      width: isSmallMobile ? 36 : 40,
                                      height: isSmallMobile ? 36 : 40,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return _buildFallbackLogo(
                                            isDark, isSmallMobile ? 36 : 40);
                                      },
                                    )
                                  : _buildFallbackLogo(
                                      isDark, isSmallMobile ? 36 : 40),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
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
                              style: isMobile
                                  ? AppFonts.labelLarge().copyWith(
                                      color: AppColors.white,
                                      fontWeight: AppFonts.semiBold,
                                      letterSpacing: -0.2,
                                    )
                                  : AppFonts.h6().copyWith(
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

            const SizedBox(width: 12),

            // Navigation sections (only on desktop)
            if (!isMobile)
              Flexible(
                flex: 3,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: _buildSectionItems(isDark),
                ),
              ),

            if (!isMobile) const Spacer(),

            const SizedBox(width: 12),

            // Mobile menu button (mobile only)
            if (isMobile)
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? [
                            AppColors.white.withOpacity(0.12),
                            AppColors.white.withOpacity(0.08),
                          ]
                        : [
                            AppColors.black.withOpacity(0.06),
                            AppColors.black.withOpacity(0.04),
                          ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDark
                        ? AppColors.white.withOpacity(0.2)
                        : AppColors.black.withOpacity(0.12),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: (isDark
                              ? AppColors.accentDark
                              : AppColors.accentLight)
                          .withOpacity(0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.menu_rounded,
                    size: 18,
                  ),
                  color: isDark ? AppColors.accentDark : AppColors.accentLight,
                  onPressed: () => _showMobileSectionsMenu(context, isDark),
                  tooltip: 'Sections Menu',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 28,
                    minHeight: 28,
                  ),
                ),
              ),

            // Theme toggle (desktop only)
            if (!isMobile) const SizedBox(width: 8),

            if (!isMobile)
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? [
                            AppColors.white.withOpacity(0.12),
                            AppColors.white.withOpacity(0.08),
                          ]
                        : [
                            AppColors.black.withOpacity(0.06),
                            AppColors.black.withOpacity(0.04),
                          ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDark
                        ? AppColors.white.withOpacity(0.2)
                        : AppColors.black.withOpacity(0.12),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: (isDark
                              ? AppColors.accentDark
                              : AppColors.accentLight)
                          .withOpacity(0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 2),
                    ),
                  ],
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
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
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

  /// Build fallback logo when project image is not available
  Widget _buildFallbackLogo(bool isDark, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [
                  AppColors.accentDark,
                  AppColors.accentDark.withOpacity(0.7),
                ]
              : [
                  AppColors.accentLight,
                  AppColors.accentLight.withOpacity(0.8),
                ],
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark
              ? AppColors.white.withOpacity(0.2)
              : AppColors.black.withOpacity(0.1),
          width: 1.5,
        ),
      ),
      child: Icon(
        Icons.folder_special_rounded,
        size: size * 0.6,
        color: AppColors.white,
      ),
    );
  }

  /// Show mobile sections menu as bottom sheet
  void _showMobileSectionsMenu(BuildContext context, bool isDark) {
    final sections = [
      {
        'title': 'Overview',
        'icon': Icons.info_outline_rounded,
        'index': 0,
        'key': overviewKey
      },
      {
        'title': 'Tech Stack',
        'icon': Icons.code_rounded,
        'index': 1,
        'key': techStackKey
      },
      {
        'title': 'Documents',
        'icon': Icons.description_outlined,
        'index': 2,
        'key': documentsKey
      },
      {
        'title': 'Gallery',
        'icon': Icons.photo_library_outlined,
        'index': 3,
        'key': galleryKey
      },
      {
        'title': 'Challenges',
        'icon': Icons.psychology_outlined,
        'index': 4,
        'key': challengesKey
      },
      {
        'title': 'Learnings',
        'icon': Icons.lightbulb_outline_rounded,
        'index': 5,
        'key': learningsKey
      },
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          border: Border.all(
            color: isDark
                ? AppColors.accentDark.withOpacity(0.2)
                : AppColors.accentLight.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.white.withOpacity(0.3)
                    : AppColors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.menu_book_rounded,
                    color:
                        isDark ? AppColors.accentDark : AppColors.accentLight,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Sections',
                    style: AppFonts.h6().copyWith(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                      fontWeight: AppFonts.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // Dark mode toggle
            InkWell(
              onTap: () {
                Get.find<ThemeController>().toggleTheme();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? [
                            AppColors.white.withOpacity(0.08),
                            AppColors.white.withOpacity(0.04),
                          ]
                        : [
                            AppColors.black.withOpacity(0.04),
                            AppColors.black.withOpacity(0.02),
                          ],
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: isDark
                              ? [
                                  AppColors.accentDark,
                                  AppColors.accentDark.withOpacity(0.8),
                                ]
                              : [
                                  AppColors.accentLight,
                                  AppColors.accentLight.withOpacity(0.8),
                                ],
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        isDark
                            ? Icons.light_mode_rounded
                            : Icons.dark_mode_rounded,
                        color: AppColors.white,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        isDark ? 'Light Mode' : 'Dark Mode',
                        style: AppFonts.bodyMedium().copyWith(
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                          fontWeight: AppFonts.medium,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 1),
            // Section list
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sections.length,
              itemBuilder: (context, index) {
                final section = sections[index];
                final isSelected = currentSection == section['index'];

                return InkWell(
                  onTap: () {
                    Navigator.pop(context);
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
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? (isDark
                                  ? AppColors.accentDark
                                  : AppColors.accentLight)
                              .withOpacity(0.1)
                          : null,
                      border: Border(
                        left: BorderSide(
                          color: isSelected
                              ? (isDark
                                  ? AppColors.accentDark
                                  : AppColors.accentLight)
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          section['icon'] as IconData,
                          color: isSelected
                              ? (isDark
                                  ? AppColors.accentDark
                                  : AppColors.accentLight)
                              : (isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight),
                          size: 20,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            section['title'] as String,
                            style: AppFonts.bodyMedium().copyWith(
                              color: isSelected
                                  ? (isDark
                                      ? AppColors.accentDark
                                      : AppColors.accentLight)
                                  : (isDark
                                      ? AppColors.textPrimaryDark
                                      : AppColors.textPrimaryLight),
                              fontWeight: isSelected
                                  ? AppFonts.semiBold
                                  : AppFonts.regular,
                            ),
                          ),
                        ),
                        if (isSelected)
                          Icon(
                            Icons.check_circle_rounded,
                            color: isDark
                                ? AppColors.accentDark
                                : AppColors.accentLight,
                            size: 20,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
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
            .withOpacity(0.1),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: isSelected
                ? LinearGradient(
                    colors: isDark
                        ? [
                            AppColors.accentDark.withOpacity(0.2),
                            AppColors.accentDark.withOpacity(0.1),
                          ]
                        : [
                            AppColors.accentLight.withOpacity(0.15),
                            AppColors.accentLight.withOpacity(0.08),
                          ],
                  )
                : null,
            border: isSelected
                ? Border.all(
                    color:
                        (isDark ? AppColors.accentDark : AppColors.accentLight)
                            .withOpacity(0.4),
                    width: 1.5,
                  )
                : null,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: (isDark
                              ? AppColors.accentDark
                              : AppColors.accentLight)
                          .withOpacity(0.2),
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
