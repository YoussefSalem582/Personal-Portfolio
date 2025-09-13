import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../theme/app_theme.dart';
import '../../utils/responsive_helper.dart';
import '../../utils/portfolio_data.dart';
import '../../utils/url_helper.dart';
import '../../widgets/project_card.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  String _selectedFilter = 'All';
  List<String> _filters = ['All'];

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
      color: isDark ? AppTheme.darkBackgroundColor : AppTheme.backgroundColor,
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
              'Here are some of the projects I\'ve worked on',
              style: AppTheme.bodyLarge.copyWith(
                color: isDark
                    ? AppTheme.darkTextSecondary
                    : AppTheme.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppTheme.spacingXL),

            // Filter tabs
            _buildFilterTabs(isMobile),

            const SizedBox(height: AppTheme.spacingXL),

            // Projects grid
            _buildProjectsGrid(screenWidth),

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
        style: AppTheme.bodyMedium.copyWith(
          color: isSelected
              ? Colors.white
              : (isDark ? AppTheme.darkTextPrimary : AppTheme.textPrimary),
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedFilter = filter;
        });
      },
      backgroundColor:
          isDark ? AppTheme.darkSurfaceColor : AppTheme.surfaceColor,
      selectedColor: isDark ? AppTheme.darkAccentColor : AppTheme.accentColor,
      side: BorderSide(
        color: isSelected
            ? (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
            : (isDark ? AppTheme.darkTextSecondary : AppTheme.textSecondary)
                .withOpacity(0.3),
      ),
    );
  }

  Widget _buildProjectsGrid(double screenWidth) {
    final columns = ResponsiveHelper.getGridColumns(screenWidth);
    final filteredProjects = _filteredProjects;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (filteredProjects.isEmpty) {
      return Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 64,
              color:
                  (isDark ? AppTheme.darkTextSecondary : AppTheme.textSecondary)
                      .withOpacity(0.5),
            ),
            const SizedBox(height: AppTheme.spacingM),
            Text(
              'No projects found for "$_selectedFilter"',
              style: AppTheme.bodyLarge.copyWith(
                color: isDark
                    ? AppTheme.darkTextSecondary
                    : AppTheme.textSecondary,
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
          crossAxisSpacing: AppTheme.spacingL,
          mainAxisSpacing: AppTheme.spacingL,
          childAspectRatio: 0.8,
        ),
        itemCount: filteredProjects.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 500),
            columnCount: columns,
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: ProjectCard(
                  project: filteredProjects[index],
                  isCompact: false,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildViewAllButton() {
    return Column(
      children: [
        Text(
          'Interested in seeing more?',
          style: AppTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppTheme.spacingM),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton.icon(
              onPressed: () => _showAllProjects(),
              icon: const Icon(Icons.grid_view_rounded),
              label: const Text('View All Projects'),
            ),
            const SizedBox(width: AppTheme.spacingM),
            ElevatedButton.icon(
              onPressed: () => _navigateToGitHub(),
              icon: const Icon(Icons.code_rounded),
              label: const Text('Visit GitHub'),
            ),
          ],
        ),
      ],
    );
  }

  void _showAllProjects() {
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
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(AppTheme.spacingM),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900, maxHeight: 700),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
        ),
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(AppTheme.spacingL),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'All Projects (${projects.length})',
                      style: AppTheme.headingMedium,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // Projects list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(AppTheme.spacingM),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final project = projects[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppTheme.spacingM),
                    child: Card(
                      child: ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppTheme.accentColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(
                              AppTheme.radiusS,
                            ),
                          ),
                          child: const Icon(
                            Icons.code,
                            color: AppTheme.accentColor,
                          ),
                        ),
                        title: Text(
                          project.title,
                          style: AppTheme.headingSmall.copyWith(fontSize: 16),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: AppTheme.spacingXS),
                            Text(
                              project.shortDescription,
                              style: AppTheme.bodySmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: AppTheme.spacingS),
                            Wrap(
                              spacing: AppTheme.spacingXS,
                              children: project.technologies
                                  .take(3)
                                  .map<Widget>(
                                    (tech) => Chip(
                                      label: Text(
                                        tech,
                                        style: AppTheme.bodySmall.copyWith(
                                          fontSize: 10,
                                        ),
                                      ),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          Navigator.of(context).pop();
                          // Show project details
                        },
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
