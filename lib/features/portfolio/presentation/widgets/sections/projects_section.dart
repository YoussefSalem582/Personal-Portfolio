import 'package:flutter/material.dart';
import '../../../../../utils/responsive_helper.dart';
import '../../../../../utils/data/portfolio_data.dart';
import '../../../../../utils/url_helper.dart';
import '../../../../../utils/assets/app_constants.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../../widgets/projects_section/projects_section_header.dart';
import '../../../../../widgets/projects_section/projects_filter_tabs.dart';
import '../../../../../widgets/projects_section/projects_empty_state.dart';
import '../../../../../widgets/projects_section/projects_grid.dart';
import '../../../../../widgets/custom_show_more_button.dart';
import '../../../../../widgets/projects_section/projects_view_all_section.dart';
import '../../../../../widgets/projects_section/all_projects_dialog.dart';

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
    // Flutter-focused filter tags with state management and app categories
    _filters = [
      'All',
      'Flutter',
      'GetX',
      'BLoC/Cubit',
      'E-commerce',
      'Chat Apps',
      'Education',
      'Firebase',
      'Maps & GPS',
      'AI/ML',
      'Clean Architecture',
      'Enterprise',
    ];
  }

  List<dynamic> get _filteredProjects {
    List<dynamic> filtered;

    if (_selectedFilter == 'All') {
      filtered = PortfolioData.projects;
    } else {
      filtered = PortfolioData.projects.where((project) {
        final projectTechs = project.technologies.join(' ').toLowerCase();
        final projectTitle = project.title.toLowerCase();
        final projectDesc = project.description.toLowerCase();

        switch (_selectedFilter) {
          // Flutter Core
          case 'Flutter':
            return projectTechs.contains('flutter') ||
                projectTechs.contains('dart');

          // State Management Patterns
          case 'GetX':
            return projectTechs.contains('getx') ||
                projectTechs.contains('get');

          case 'BLoC/Cubit':
            return projectTechs.contains('bloc') ||
                projectTechs.contains('cubit');

          // App Categories
          case 'E-commerce':
            return projectTitle.contains('shop') ||
                projectTitle.contains('gogesh') ||
                projectTitle.contains('marketplace') ||
                projectDesc.contains('shopping') ||
                projectDesc.contains('e-commerce') ||
                projectDesc.contains('commercial') ||
                projectDesc.contains('payment') ||
                projectTechs.contains('payment');

          case 'Chat Apps':
            return projectTitle.contains('chat') ||
                projectDesc.contains('messaging') ||
                projectDesc.contains('chat') ||
                projectTechs.contains('chat') ||
                projectTechs.contains('messaging') ||
                projectTechs.contains('real-time database');

          case 'Education':
            return projectTitle.contains('quiz') ||
                projectTitle.contains('learning') ||
                projectDesc.contains('education') ||
                projectDesc.contains('quiz') ||
                projectDesc.contains('exam') ||
                projectDesc.contains('learning');

          // Backend & Integration
          case 'Firebase':
            return projectTechs.contains('firebase') ||
                projectTechs.contains('firestore') ||
                projectTechs.contains('real-time database') ||
                projectTechs.contains('cloud functions') ||
                projectTechs.contains('authentication') ||
                projectTechs.contains('fcm');

          case 'Maps & GPS':
            return projectTechs.contains('maps') ||
                projectTechs.contains('location') ||
                projectTechs.contains('google maps') ||
                projectTechs.contains('gps') ||
                projectTechs.contains('geolocator') ||
                projectTechs.contains('flutter_map') ||
                projectDesc.contains('carpool') ||
                projectDesc.contains('navigation');

          // AI & Machine Learning
          case 'AI/ML':
            return projectTechs.contains('machine learning') ||
                projectTechs.contains('tensorflow') ||
                projectTechs.contains('ai') ||
                projectTechs.contains('ml') ||
                projectTechs.contains('computer vision') ||
                projectTechs.contains('opencv') ||
                projectDesc.contains('emotion recognition') ||
                projectDesc.contains('facial recognition') ||
                projectDesc.contains('sign language');

          // Architecture & Patterns
          case 'Clean Architecture':
            return projectTechs.contains('clean architecture') ||
                projectTechs.contains('repository pattern') ||
                projectDesc.contains('clean architecture');

          case 'Enterprise':
            return projectDesc.contains('enterprise') ||
                projectTitle.contains('emosense') ||
                projectTitle.contains('gogesh') ||
                projectTechs.contains('enterprise') ||
                projectTechs.contains('jwt') ||
                projectTechs.contains('oauth');

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
      final projectTitle = project.title.toLowerCase();
      final projectDesc = project.description.toLowerCase();

      switch (_selectedFilter) {
        // Flutter Core
        case 'Flutter':
          return projectTechs.contains('flutter') ||
              projectTechs.contains('dart');

        // State Management Patterns
        case 'GetX':
          return projectTechs.contains('getx') || projectTechs.contains('get');

        case 'BLoC/Cubit':
          return projectTechs.contains('bloc') ||
              projectTechs.contains('cubit');

        // App Categories
        case 'E-commerce':
          return projectTitle.contains('shop') ||
              projectTitle.contains('gogesh') ||
              projectTitle.contains('marketplace') ||
              projectDesc.contains('shopping') ||
              projectDesc.contains('e-commerce') ||
              projectDesc.contains('commercial') ||
              projectDesc.contains('payment') ||
              projectTechs.contains('payment');

        case 'Chat Apps':
          return projectTitle.contains('chat') ||
              projectDesc.contains('messaging') ||
              projectDesc.contains('chat') ||
              projectTechs.contains('chat') ||
              projectTechs.contains('messaging') ||
              projectTechs.contains('real-time database');

        case 'Education':
          return projectTitle.contains('quiz') ||
              projectTitle.contains('learning') ||
              projectDesc.contains('education') ||
              projectDesc.contains('quiz') ||
              projectDesc.contains('exam') ||
              projectDesc.contains('learning');

        // Backend & Integration
        case 'Firebase':
          return projectTechs.contains('firebase') ||
              projectTechs.contains('firestore') ||
              projectTechs.contains('real-time database') ||
              projectTechs.contains('cloud functions') ||
              projectTechs.contains('authentication') ||
              projectTechs.contains('fcm');

        case 'Maps & GPS':
          return projectTechs.contains('maps') ||
              projectTechs.contains('location') ||
              projectTechs.contains('google maps') ||
              projectTechs.contains('gps') ||
              projectTechs.contains('geolocator') ||
              projectTechs.contains('flutter_map') ||
              projectDesc.contains('carpool') ||
              projectDesc.contains('navigation');

        // AI & Machine Learning
        case 'AI/ML':
          return projectTechs.contains('machine learning') ||
              projectTechs.contains('tensorflow') ||
              projectTechs.contains('ai') ||
              projectTechs.contains('ml') ||
              projectTechs.contains('computer vision') ||
              projectTechs.contains('opencv') ||
              projectDesc.contains('emotion recognition') ||
              projectDesc.contains('facial recognition') ||
              projectDesc.contains('sign language');

        // Architecture & Patterns
        case 'Clean Architecture':
          return projectTechs.contains('clean architecture') ||
              projectTechs.contains('repository pattern') ||
              projectDesc.contains('clean architecture');

        case 'Enterprise':
          return projectDesc.contains('enterprise') ||
              projectTitle.contains('emosense') ||
              projectTitle.contains('gogesh') ||
              projectTechs.contains('enterprise') ||
              projectTechs.contains('jwt') ||
              projectTechs.contains('oauth');

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
    final filteredProjects = _filteredProjects;

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
            // Section header
            const ProjectsSectionHeader(),

            const SizedBox(height: AppTheme.spacingXL),

            // Filter tabs
            ProjectsFilterTabs(
              filters: _filters,
              selectedFilter: _selectedFilter,
              isMobile: isMobile,
              onFilterSelected: (filter) {
                setState(() {
                  _selectedFilter = filter;
                  _displayedProjectCount = _initialProjectCount;
                });
              },
            ),

            const SizedBox(height: AppTheme.spacingXL),

            // Projects grid or empty state
            if (filteredProjects.isEmpty)
              ProjectsEmptyState(filterName: _selectedFilter)
            else
              ProjectsGrid(
                projects: filteredProjects,
                screenWidth: screenWidth,
              ),

            // Show More button (if there are more projects to show)
            if (_allFilteredProjects.length > _displayedProjectCount) ...[
              const SizedBox(height: AppTheme.spacingXL),
              CustomShowMoreButton(
                onPressed: () {
                  setState(() {
                    _displayedProjectCount += _incrementCount;
                  });
                },
              ),
            ],

            const SizedBox(height: AppTheme.spacingXL),

            // View all section
            ProjectsViewAllSection(
              onViewAllProjects: _showAllProjectsDialog,
              onVisitGitHub: _navigateToGitHub,
            ),
          ],
        ),
      ),
    );
  }

  void _showAllProjectsDialog() {
    showDialog(
      context: context,
      builder: (context) => AllProjectsDialog(
        projects: PortfolioData.projects,
      ),
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
