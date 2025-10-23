import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../../utils/app_constants.dart';
import '../../utils/responsive_helper.dart';
import '../../utils/data/portfolio_data.dart';
import '../../utils/url_helper.dart';
import '../../widgets/project_card_advanced.dart';

import '../../theme/app_theme.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  String _selectedFilter = 'All';
  List<String> _filters = ['All'];
  int _displayedProjectCount = 6;
  static const int _initialProjectCount = 6;
  static const int _incrementCount = 3;

  @override
  void initState() {
    super.initState();
    _initializeFilters();
  }

  void _initializeFilters() {
    // Simplified filter tags for better UX
    _filters = [
      'All',
      'Flutter',
      'Python',
      'API',
      'AI/ML',
      'Firebase',
      'Maps',
      'Chat',
      'TensorFlow',
      'Computer Vision',
    ];
  }

  List<dynamic> get _filteredProjects {
    List<dynamic> filtered;

    if (_selectedFilter == 'All') {
      filtered = PortfolioData.projects;
    } else {
      filtered = PortfolioData.projects.where((project) {
        final projectTechs = project.technologies.join(' ').toLowerCase();

        switch (_selectedFilter) {
          case 'Flutter':
            return projectTechs.contains('flutter') ||
                projectTechs.contains('dart');
          case 'Python':
            return projectTechs.contains('python');
          case 'API':
            return projectTechs.contains('api') ||
                projectTechs.contains('rest');
          case 'AI/ML':
            return projectTechs.contains('machine learning') ||
                projectTechs.contains('tensorflow') ||
                projectTechs.contains('ai') ||
                projectTechs.contains('ml');
          case 'Firebase':
            return projectTechs.contains('firebase');
          case 'Maps':
            return projectTechs.contains('maps') ||
                projectTechs.contains('location');
          case 'Chat':
            return projectTechs.contains('chat') ||
                projectTechs.contains('messaging');
          case 'TensorFlow':
            return projectTechs.contains('tensorflow');
          case 'Computer Vision':
            return projectTechs.contains('computer vision') ||
                projectTechs.contains('opencv') ||
                projectTechs.contains('cv');
          default:
            return project.technologies.contains(_selectedFilter);
        }
      }).toList();
    }

    // Return limited projects based on displayed count
    if (filtered.length > _displayedProjectCount) {
      return filtered.take(_displayedProjectCount).toList();
    }

    return filtered;
  }

  List<dynamic> get _allFilteredProjects {
    if (_selectedFilter == 'All') {
      return PortfolioData.projects;
    }

    return PortfolioData.projects.where((project) {
      final projectTechs = project.technologies.join(' ').toLowerCase();

      switch (_selectedFilter) {
        case 'Flutter':
          return projectTechs.contains('flutter') ||
              projectTechs.contains('dart');
        case 'Python':
          return projectTechs.contains('python');
        case 'API':
          return projectTechs.contains('api') || projectTechs.contains('rest');
        case 'AI/ML':
          return projectTechs.contains('machine learning') ||
              projectTechs.contains('tensorflow') ||
              projectTechs.contains('ai') ||
              projectTechs.contains('ml');
        case 'Firebase':
          return projectTechs.contains('firebase');
        case 'Maps':
          return projectTechs.contains('maps') ||
              projectTechs.contains('location');
        case 'Chat':
          return projectTechs.contains('chat') ||
              projectTechs.contains('messaging');
        case 'TensorFlow':
          return projectTechs.contains('tensorflow');
        case 'Computer Vision':
          return projectTechs.contains('computer vision') ||
              projectTechs.contains('opencv') ||
              projectTechs.contains('cv');
        default:
          return project.technologies.contains(_selectedFilter);
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
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
              'My Projects',
              style: AppFonts.h1(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppTheme.spacingS),

            Container(
              width: 60,
              height: 4,
              decoration: BoxDecoration(
                gradient: isDark
                    ? AppColors.primaryGradientDark
                    : AppColors.primaryGradientLight,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            const SizedBox(height: AppTheme.spacingM),

            Text(
              'Here are some of the projects I\'ve worked on',
              style: AppFonts.bodyLarge().copyWith(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppTheme.spacingXL),

            // Filter tabs
            _buildFilterTabs(isMobile),

            const SizedBox(height: AppTheme.spacingXL),

            // Projects grid
            _buildProjectsGrid(screenWidth),

            // Show More button (if there are more projects to show)
            if (_allFilteredProjects.length > _displayedProjectCount) ...[
              const SizedBox(height: AppTheme.spacingXL),
              _buildShowMoreButton(),
            ],

            const SizedBox(height: AppTheme.spacingXL),

            // View all button
            _buildViewAllButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTabs(bool isMobile) {
    if (isMobile) {
      return SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _filters.length,
          itemBuilder: (context, index) {
            final filter = _filters[index];
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 0 : AppTheme.spacingS,
                right: index == _filters.length - 1 ? 0 : AppTheme.spacingS,
              ),
              child: _buildFilterChip(filter),
            );
          },
        ),
      );
    } else {
      return Wrap(
        spacing: AppTheme.spacingM,
        runSpacing: AppTheme.spacingM,
        alignment: WrapAlignment.center,
        children: _filters.map((filter) => _buildFilterChip(filter)).toList(),
      );
    }
  }

  Widget _buildFilterChip(String filter) {
    final isSelected = _selectedFilter == filter;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return FilterChip(
      label: Text(
        filter,
        style: AppFonts.bodyMedium().copyWith(
          color: isSelected
              ? AppColors.white
              : (isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight),
          fontWeight: isSelected ? AppFonts.semiBold : AppFonts.regular,
        ),
      ),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedFilter = filter;
          _displayedProjectCount =
              _initialProjectCount; // Reset when changing filter
        });
      },
      backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      selectedColor: isDark ? AppColors.accentDark : AppColors.accentLight,
      side: BorderSide(
        color: isSelected
            ? (isDark ? AppColors.accentDark : AppColors.accentLight)
            : (isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight)
                .withValues(alpha: 0.3),
      ),
    );
  }

  Widget _buildProjectsGrid(double screenWidth) {
    final columns = ResponsiveHelper.getGridColumns(screenWidth);
    final filteredProjects = _filteredProjects;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (filteredProjects.isEmpty) {
      return SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              AppIcons.search,
              size: 64,
              color: (isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight)
                  .withValues(alpha: 0.5),
            ),
            const SizedBox(height: AppTheme.spacingM),
            Text(
              'No projects found for "$_selectedFilter"',
              style: AppFonts.bodyLarge().copyWith(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
          ],
        ),
      );
    }

    return AnimationLimiter(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.9,
        ),
        itemCount: filteredProjects.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 300),
            columnCount: columns,
            child: FadeInAnimation(
              child: ProjectCardAdvanced(
                project: filteredProjects[index],
                isCompact: false,
                index: index,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildShowMoreButton() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor = isDark ? AppColors.accentDark : AppColors.accentLight;

    return Center(
      child: OutlinedButton.icon(
        onPressed: () {
          setState(() {
            _displayedProjectCount += _incrementCount;
          });
        },
        icon: const Icon(Icons.expand_more, size: 20),
        label: const Text('Show More'),
        style: OutlinedButton.styleFrom(
          foregroundColor: accentColor,
          side: BorderSide(color: accentColor, width: 2),
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildViewAllButton() {
    return Column(
      children: [
        Text(
          'Interested in seeing more?',
          style: AppFonts.bodyLarge(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppTheme.spacingM),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton.icon(
              onPressed: () => _showAllProjectsDialog(),
              icon: const Icon(AppIcons.projects),
              label: const Text('View All Projects'),
            ),
            const SizedBox(width: AppTheme.spacingM),
            ElevatedButton.icon(
              onPressed: () => _navigateToGitHub(),
              icon: const Icon(AppIcons.github),
              label: const Text('Visit GitHub'),
            ),
          ],
        ),
      ],
    );
  }

  void _showAllProjectsDialog() {
    showDialog(
      context: context,
      builder: (context) =>
          _AllProjectsDialog(projects: PortfolioData.projects),
    );
  }

  void _navigateToGitHub() {
    // Find GitHub link from social links
    final githubLink = PortfolioData.socialLinks.firstWhere(
      (link) => link.name.toLowerCase() == 'github',
    );
    // Launch GitHub URL
    UrlHelper.launchURL(githubLink.url);
  }
}

class _AllProjectsDialog extends StatelessWidget {
  final List<dynamic> projects;

  const _AllProjectsDialog({required this.projects});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      backgroundColor: AppColors.transparent,
      insetPadding: const EdgeInsets.all(AppTheme.spacingL),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900, maxHeight: 700),
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
          border: Border.all(
            color: isDark
                ? AppColors.white.withOpacity(0.1)
                : AppColors.black.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(AppTheme.spacingL),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isDark
                        ? AppColors.white.withOpacity(0.1)
                        : AppColors.black.withOpacity(0.1),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'All Projects (${projects.length})',
                      style: AppFonts.h2().copyWith(
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      AppIcons.close,
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: isDark
                          ? AppColors.white.withOpacity(0.05)
                          : AppColors.black.withOpacity(0.05),
                    ),
                  ),
                ],
              ),
            ),

            // Projects list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final project = projects[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppTheme.spacingM),
                    child: Material(
                      color: AppColors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          // Navigate to case study for projects with images
                          if (project.imageUrl != null ||
                              (project.galleryImages != null &&
                                  project.galleryImages!.isNotEmpty)) {
                            Get.toNamed('/project/${project.id}');
                          }
                        },
                        borderRadius: BorderRadius.circular(AppTheme.radiusM),
                        child: Container(
                          padding: const EdgeInsets.all(AppTheme.spacingL),
                          decoration: BoxDecoration(
                            color:
                                isDark ? AppColors.cardDark : AppColors.white,
                            borderRadius:
                                BorderRadius.circular(AppTheme.radiusM),
                            border: Border.all(
                              color: isDark
                                  ? AppColors.white.withOpacity(0.1)
                                  : AppColors.black.withOpacity(0.1),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              // Project Image
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: (isDark
                                          ? AppColors.accentDark
                                          : AppColors.accentLight)
                                      .withOpacity(0.1),
                                  borderRadius:
                                      BorderRadius.circular(AppTheme.radiusS),
                                  image: project.imageUrl != null
                                      ? DecorationImage(
                                          image:
                                              NetworkImage(project.imageUrl!),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                                child: project.imageUrl == null
                                    ? Icon(
                                        AppIcons.technology,
                                        color: isDark
                                            ? AppColors.accentDark
                                            : AppColors.accentLight,
                                        size: 28,
                                      )
                                    : null,
                              ),

                              const SizedBox(width: AppTheme.spacingL),

                              // Content
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      project.title,
                                      style: AppFonts.h5().copyWith(
                                        color: isDark
                                            ? AppColors.textPrimaryDark
                                            : AppColors.textPrimaryLight,
                                        fontWeight: AppFonts.semiBold,
                                      ),
                                    ),
                                    const SizedBox(height: AppTheme.spacingXS),
                                    Text(
                                      project.shortDescription,
                                      style: AppFonts.bodySmall().copyWith(
                                        color: isDark
                                            ? AppColors.textSecondaryDark
                                            : AppColors.textSecondaryLight,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: AppTheme.spacingS),
                                    Wrap(
                                      spacing: AppTheme.spacingXS,
                                      runSpacing: AppTheme.spacingXS,
                                      children: project.technologies
                                          .take(3)
                                          .map<Widget>(
                                            (tech) => Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 12,
                                                vertical: 6,
                                              ),
                                              decoration: BoxDecoration(
                                                color: isDark
                                                    ? AppColors.white
                                                        .withOpacity(0.1)
                                                    : AppColors.black
                                                        .withOpacity(0.05),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppTheme.radiusS),
                                              ),
                                              child: Text(
                                                tech,
                                                style: AppFonts.labelSmall()
                                                    .copyWith(
                                                  color: isDark
                                                      ? AppColors
                                                          .textPrimaryDark
                                                      : AppColors
                                                          .textPrimaryLight,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),

                              // Arrow
                              Icon(
                                AppIcons.arrowRight,
                                size: 20,
                                color: isDark
                                    ? AppColors.textSecondaryDark
                                    : AppColors.textSecondaryLight,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
